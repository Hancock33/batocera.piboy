#!/usr/bin/env python3
"""PiBoy DMG control daemon for Batocera.

Based upon https://github.com/Sblawx/piboy-dmg-batocera.git
Credits to Sblawx

Sits on top of the xpi_gamecon kernel module, which publishes the PiBoy's
MCU state under /sys/kernel/xpi_gamecon/. On a PiBoy XRS, which that module
cannot drive, the user-space driver xpi-user/xpi_user.py publishes the same
files under /run/xpi_gamecon/ instead. Provides:

  battery  - mirrors the driver into a standard /sys/class/power_supply/BAT0
             node. The stock Batocera EmulationStation is not built with the
             PIBOY patch and only looks in /sys/class/power_supply, which is
             empty on this board; publishing a conventional node there brings
             back the native ES gauge.
  fan      - temperature curve. The driver's `fan` node is a 0-255 PWM duty,
             NOT a percentage.
  volume   - volume wheel -> system volume.
  power    - power switch and low battery -> clean shutdown.
"""

import configparser
import math
import os
import re
import signal
import socket
import subprocess
import sys
import time
import urllib.request

# ---------------------------------------------------------------- config ----
POLL_S = 0.2              # main loop period
# ES re-reads the battery every 5s, so publishing faster buys nothing visible.
BATT_PUBLISH_S = 0.5      # how often to refresh the power_supply node
FAN_UPDATE_S = 2.0        # how often to re-evaluate the fan curve
SWITCH_DEBOUNCE_S = 1.5   # power switch must be held this long
LOW_BATT_PCT = 5          # clean shutdown below this charge
LOW_BATT_MV = 3150        # terminal-voltage floor, protects the cell
POWER_CONF = "/userdata/system/piboy-power.conf"
# low_battery_warning in piboy-power.conf -> warning levels while discharging
LOW_BATT_WARN_LEVELS = {"10": (10, 7), "15": (15, 10), "20": (20, 10), "0": ()}

# --------------------------------------------------------------- battery ----
# The MCU has no coulomb counter: its `percent` is a linear map of the
# *terminal* voltage, so it collapses under load and jumps when the charger is
# plugged in. Voltage alone cannot be both accurate and steady on this pack:
#   - the LiPo OCV curve is flat between ~3.60 and ~3.70V, where about a third
#     of the charge sits, so a linear map crawls in the middle and collapses
#     at the end;
#   - pack resistance runs from 50 mOhm full to 120+ mOhm near empty, and a
#     correct IR correction amplifies current noise (a 2A spike at 120 mOhm
#     moves the inferred OCV by 240mV).
#
# So the gauge is a hybrid, like a real fuel-gauge IC: charge is tracked by
# integrating current (smooth, monotonic, right rate), and its slow drift is
# corrected by pulling it towards the OCV curve (right absolute value).
# Replayed over the calibration log: rms error 1.5 points, worst 5.3.
#
# Capacity was coulomb-counted from a deep discharge: 3515 mAh between OCV
# 4047 and 3489 mV, plus ~300 mAh above and ~180 mAh below. The 4900 mAh on
# the cell label is never reached - the charger tops out around 4.12V.
BATT_CAPACITY_MAH = 4000.0
# OCV (mV) -> state of charge (%), measured by coulomb-counting a deep
# discharge. 0% is the 3400mV cell floor, 100% the 4100mV the charger actually
# delivers. 1% is ~40 mAh everywhere, so the gauge falls at a steady rate.
BATT_OCV_TABLE = (
    (3400, 0.0), (3489, 4.6), (3520, 9.0), (3549, 13.4), (3569, 17.8),
    (3593, 22.2), (3609, 26.6), (3625, 31.0), (3644, 35.4), (3661, 39.8),
    (3680, 44.2), (3704, 48.6), (3731, 53.0), (3762, 57.4), (3794, 61.7),
    (3826, 66.1), (3861, 70.5), (3901, 74.9), (3942, 79.3), (3980, 83.7),
    (4014, 88.1), (4047, 92.5), (4100, 100.0),
)
# State of charge (%) -> pack resistance (mOhm), from dV/dI across 20s load
# steps in the log. Rises as the pack empties.
BATT_R_TABLE = ((0, 140), (10, 120), (25, 100), (50, 80), (75, 55), (100, 50))
# Time constants of the pull towards the OCV curve. Slower on the way up so
# the gauge does not visibly climb while draining, but not so slow that a
# pessimistic seed can never be walked back and the console shuts down with
# charge to spare (6000s would have wasted 53 minutes of play in the 07-17 log).
BATT_ANCHOR_TAU_S = 600.0
BATT_ANCHOR_TAU_UP_S = 1800.0
# The OCV curve is only meaningful under a settled load: ignore charging
# (polarisation puts the terminal ~100mV above OCV) and samples straddling a
# load step.
BATT_ANCHOR_MIN_MA = 200
BATT_ANCHOR_STEP_MA = 300
# Seed the integrator from the median OCV over the first few seconds (a single
# sample is worth +-5 points, a short median about +-2).
BATT_SEED_S = 10.0
# While a charge is really flowing the terminal is inflated by IR and
# polarisation (10 min at ~1A lifted it 200mV, ~14 points on the table), so a
# saved count is the better starting value then.
BATT_STATE_MAX_AGE_S = 48 * 3600
# Below this current the IR term is negligible (200mA * 250mOhm = 50mV), so
# the terminal is read directly as OCV and beats any saved value. This is the
# normal end-of-charge state.
BATT_OCV_TRUST_MA = 200
# Charge termination: full when the charger has tapered off while holding the
# terminal high. The one moment absolute charge is known exactly, so it
# re-zeroes the integrator's drift.
BATT_FULL_MV = 4050
BATT_FULL_TAPER_MA = 150
BATT_FULL_HOLD_S = 60.0
# Charge-hold gives up if the pack is not actually filling. VBus alone is NOT
# proof of a charger (bit 0x80 once stayed asserted for over an hour with
# nothing plugged in). Without this, a low-battery shutdown would park the
# console "charging" with the screen off and run the cell flat.
CHARGE_HOLD_GIVEUP_S = 120.0
# Reject broken MCU reads (occasional 0mV and 4200mV glitch samples).
BATT_SANE_MIN_MV = 2500
BATT_SANE_MAX_MV = 4400
# Last known state of charge, written at shutdown and periodically. A seed
# fresher than BATT_STATE_FRESH_S carries the coulomb count across a quick
# reboot; an older one lets the boot log report how the pack changed while the
# console was off.
BATT_STATE_PATH = "/userdata/system/piboy-battery.state"
BATT_STATE_FRESH_S = 1800
BATT_STATE_SAVE_S = 600.0
# How long after the charger last pushed current in before the terminal
# voltage means anything again (polarisation and surface charge decay over
# minutes). Voltage-derived logic is gated on this rather than on VBus: what
# disturbs the terminal is the charger *delivering*, not a cable being
# plugged in, and the charger often delivers nothing while VBus stays
# asserted. Gating on VBus kept the anchor from ever running, so the count
# drifted for hours and survived restarts through the state file.
BATT_RELAX_S = 600.0
# Gross-error guard. V_terminal = OCV + I*R, so bounding R from above brackets
# the true charge without trusting the R table. 250mOhm is deliberately past
# everything measured (median 119, per-session fits 100-300), so the bracket
# is wide and only catches nonsense. The margin covers surface charge after a
# charge (worst observed excursion 7 points; the failure this catches was 34).
BATT_R_MAX_MOHM = 250.0
BATT_BRACKET_MARGIN = 12.0
BATT_BRACKET_LOG_S = 300.0
# Only act once the bracket has been violated continuously for this long: a
# single spurious +1100mA sample would otherwise yank the gauge down ten
# points. Real errors persist, glitches do not.
BATT_BRACKET_HOLD_S = 30.0

# Fan behaviour is chosen by a named profile in FAN_CONF_PATH (see
# FAN_PROFILES), re-read live. Above FAN_CRITICAL_C the fan is forced to full
# whatever the profile (the Pi4 soft-throttles at 80C).
# The bicolour POWER LED (not the screen): both channels are 0-255 and the
# driver re-sends them to the MCU every frame, so a write only lasts until
# reboot - hence this config, applied at start and live-reloaded. 2/2 is the
# driver's own resting value, i.e. the stock look.
LED_CONF_PATH = "/userdata/system/piboy-led.conf"
LED_DEFAULT_RED = 2
LED_DEFAULT_GREEN = 2
LED_DEFAULT_MODE = "static"     # static = red/green fixes ; battery = indicateur
# Couleurs de l'indicateur batterie (0-255 par canal). Volontairement moderees
# (the LED is bright: 2/2 = factory idle value). Adjust if needed.
LED_BATT_GREEN = 50             # > 50% : vert
LED_BATT_AMBER = (50, 22)       # 15-50% : ambre (rouge, vert)
LED_BATT_RED   = 60             # < 15% : rouge

FAN_CONF_PATH = "/userdata/system/piboy-fan.conf"
FAN_DEFAULT_PROFILE = "quiet"
FAN_HYST_C = 2.0
FAN_CRITICAL_C = 80
FAN_CRITICAL_DUTY = 255

# name -> (idle_duty, [(temp_c, duty_0_255), ...]). Anchored on Pi4 thermals:
# passive idle is fine into the 60s, throttling starts ~80C.
FAN_PROFILES = {
    # dead silent at rest, only spins up when it genuinely has to
    "silent":   (0,  [(68, 110), (74, 180), (80, 255)]),
    # off at idle, gentle ramp - quiet but keeps a margin
    "quiet":    (0,  [(60, 80), (67, 120), (73, 175), (79, 235)]),
    # always turning a little, comfortable temps
    "balanced": (60, [(52, 80), (60, 120), (67, 160), (74, 210), (80, 255)]),
    # the vendor fan.ini curve - coolest, loudest
    "cool":     (75, [(50, 75), (55, 90), (60, 110), (65, 147), (70, 194), (75, 242)]),
}

# ----------------------------------------------------------------- paths ----
XPI_KERNEL = "/sys/kernel/xpi_gamecon"
XPI_USER = "/run/xpi_gamecon"            # PiBoy XRS: xpi-user/xpi_user.py
XPI = XPI_USER if not os.path.isdir(XPI_KERNEL) and os.path.isdir(XPI_USER) else XPI_KERNEL
PSDIR = "/sys/class/power_supply"
BAT = os.path.join(PSDIR, "BAT0")
THERMAL = "/sys/class/thermal/thermal_zone0/temp"

_running = True


def log(msg):
    print("[piboy] %s %s" % (time.strftime("%m-%d %H:%M:%S"), msg), flush=True)


def read_int(path):
    try:
        with open(path) as f:
            return int(f.read().strip())
    except (OSError, ValueError):
        return None


def write_str(path, value):
    try:
        with open(path, "w") as f:
            f.write(str(value))
        return True
    except OSError:
        return False


def _mtime(path):
    try:
        return os.path.getmtime(path)
    except OSError:
        return None


def pin_builtin_audio_sink():
    """Keep the volume wheel aimed at the real speaker/jack.

    batocera-audio setSystemVolume acts on pipewire's @DEFAULT_SINK@, but any
    USB audio device (e.g. the M8 headless) grabs default the instant it
    enumerates, so the wheel would silently adjust that device instead (and
    ES audio drifts out of sync with it). m8c/m8c.sh pins at launch; this
    covers every other time. Only called when the wheel moves.
    """
    try:
        env = dict(os.environ, XDG_RUNTIME_DIR="/var/run")
        out = subprocess.run(["wpctl", "status"], env=env, capture_output=True,
                              text=True, timeout=2).stdout
        for line in out.splitlines():
            if "Built-in Audio Stereo" in line:
                # wpctl prefixes lines with a box-drawing char that \s does not
                # match -- take the first number on the line, not an anchored one.
                m = re.search(r"\d+", line)
                if m:
                    subprocess.run(["wpctl", "set-default", m.group()], env=env,
                                   stdout=subprocess.DEVNULL,
                                   stderr=subprocess.DEVNULL, timeout=2)
                break
    except (OSError, subprocess.SubprocessError):
        pass  # best-effort; never let this break the volume wheel


# ------------------------------------------------------------------ fan ----
def load_fan_config():
    """Return (profile_name, idle_duty, curve) from FAN_CONF_PATH.

    The file selects a named profile, or gives a custom curve. Anything
    missing or malformed falls back to FAN_DEFAULT_PROFILE.
    """
    profile = FAN_DEFAULT_PROFILE
    custom_curve = None
    custom_idle = None
    try:
        if os.path.isfile(FAN_CONF_PATH):
            cp = configparser.ConfigParser()
            cp.read(FAN_CONF_PATH)
            sec = cp["fan"] if cp.has_section("fan") else {}
            profile = sec.get("profile", FAN_DEFAULT_PROFILE).strip().lower()
            if "idle_duty" in sec:
                custom_idle = max(0, min(255, int(sec["idle_duty"])))
            if sec.get("curve", "").strip():
                # "60:80, 70:160, 80:255"
                pairs = []
                for chunk in sec["curve"].replace(";", ",").split(","):
                    t, d = chunk.split(":")
                    pairs.append((int(t), max(0, min(255, int(d)))))
                if pairs:
                    custom_curve = sorted(pairs)
    except (OSError, KeyError, ValueError) as e:
        log("fan config unreadable (%s), using '%s'" % (e, FAN_DEFAULT_PROFILE))
        profile = FAN_DEFAULT_PROFILE

    if profile == "custom" and custom_curve:
        idle = custom_idle if custom_idle is not None else 0
        return "custom", idle, custom_curve
    if profile not in FAN_PROFILES:
        log("fan profile '%s' unknown, using '%s'" % (profile, FAN_DEFAULT_PROFILE))
        profile = FAN_DEFAULT_PROFILE
    idle, curve = FAN_PROFILES[profile]
    if custom_idle is not None:
        idle = custom_idle
    return profile, idle, list(curve)


def load_led_config():
    """Return (mode, red, green) for the power LED from LED_CONF_PATH.

    `red` and `green` are the two channels of the bicolour power LED, not the
    screen. The kernel stores the raw int without clamping, so clamp to 0-255
    here.
    """
    mode = LED_DEFAULT_MODE
    red, green = LED_DEFAULT_RED, LED_DEFAULT_GREEN
    try:
        if os.path.isfile(LED_CONF_PATH):
            cp = configparser.ConfigParser()
            cp.read(LED_CONF_PATH)
            sec = cp["led"] if cp.has_section("led") else {}
            mode = sec.get("mode", mode).strip().lower()
            red = int(sec.get("red", red))
            green = int(sec.get("green", green))
    except Exception as exc:
        log("led config unreadable (%s), using defaults" % exc)
        mode, red, green = LED_DEFAULT_MODE, LED_DEFAULT_RED, LED_DEFAULT_GREEN
    if mode not in ("static", "battery"):
        mode = LED_DEFAULT_MODE
    red = max(0, min(255, red))
    green = max(0, min(255, green))
    return mode, red, green


def battery_led(percent, charging, t):
    """Couleur (red, green) de l'indicateur batterie.

    Green > 50%, amber 15-50%, red < 15%; while charging the LED pulses gently.
    """
    if percent > 50:
        r, g = 0, LED_BATT_GREEN
    elif percent >= 15:
        r, g = LED_BATT_AMBER
    else:
        r, g = LED_BATT_RED, 0
    if charging:
        k = 0.2 + 0.8 * (0.5 + 0.5 * math.sin(t * 2.0))   # pulsation ~3 s
        r, g = int(r * k), int(g * k)
    return max(0, min(255, r)), max(0, min(255, g))


def apply_led(red, green):
    """Write both LED channels, but only where the node disagrees.

    Compares against the node rather than a remembered value, so we converge
    back if anything else wrote to it.
    """
    for node, value in (("red", red), ("green", green)):
        path = os.path.join(XPI, node)
        if read_int(path) != value:
            write_str(path, value)


def target_duty(curve, idle_duty, temp_c, prev_band):
    """Pick a fan duty for `temp_c`, with hysteresis on the way down.

    Returns (band, duty). Band 0 is "below the first threshold"; band N is
    curve[N-1]. Stepping up is immediate; stepping down waits until the
    temperature is clearly below the current band, so a reading on a
    threshold does not make the fan surge. A hard critical override sits
    above any profile.
    """
    if temp_c >= FAN_CRITICAL_C:
        return len(curve), FAN_CRITICAL_DUTY
    band = 0
    for i, (threshold, _duty) in enumerate(curve, start=1):
        if temp_c >= threshold:
            band = i
    if prev_band and band < prev_band and prev_band <= len(curve):
        if temp_c > curve[prev_band - 1][0] - FAN_HYST_C:
            band = prev_band
    duty = idle_duty if band == 0 else curve[band - 1][1]
    return band, max(0, min(255, duty))


# -------------------------------------------------------------- battery ----
def power_supply_ready():
    """Overmount PSDIR with a tmpfs we can write into.

    sysfs is not writable from userspace, but PSDIR is an empty directory on
    this board, so shadowing it with a tmpfs hides nothing.
    """
    if os.path.isdir(BAT):
        return True
    try:
        existing = os.listdir(PSDIR)
    except OSError:
        log("battery: %s missing, not publishing" % PSDIR)
        return False
    if existing:
        # A real power supply showed up; leave the kernel's version alone.
        log("battery: %s not empty (%s), not publishing" % (PSDIR, existing))
        return False
    rc = subprocess.run(
        ["mount", "-t", "tmpfs", "-o", "size=64k", "tmpfs", PSDIR],
        stdout=subprocess.DEVNULL, stderr=subprocess.PIPE,
    )
    if rc.returncode != 0:
        log("battery: tmpfs mount failed: %s" % rc.stderr.decode().strip())
        return False
    os.makedirs(BAT, exist_ok=True)
    write_str(os.path.join(BAT, "type"), "Battery\n")
    write_str(os.path.join(BAT, "present"), "1\n")
    write_str(os.path.join(BAT, "technology"), "Li-ion\n")
    log("battery: publishing at %s" % BAT)
    return True


_soc = None               # the integrator: charge left, in percent
_seed = None              # (deadline, [samples]) while seeding from OCV
_batt_last = None         # (monotonic, milliamps) of the previous update
_full_since = None        # when the charge-termination condition first held
_last_charge = None       # monotonic time the charger last pushed current in
_bracket_logged = 0.0     # monotonic time the bracket guard last said so
_bracket_since = None     # when the bracket was first violated, or None


def _interp(x, table):
    """Linear interpolation over a sorted ((x, y), ...) table, clamped."""
    if x <= table[0][0]:
        return table[0][1]
    for (x0, y0), (x1, y1) in zip(table, table[1:]):
        if x <= x1:
            return y0 + (y1 - y0) * (x - x0) / (x1 - x0)
    return table[-1][1]


def soc_from_ocv(open_circuit):
    return max(0.0, min(100.0, _interp(open_circuit, BATT_OCV_TABLE)))


def pack_resistance(soc):
    """Ohms. Depends on how full the pack is, hence on the value we want."""
    return _interp(soc, BATT_R_TABLE) / 1000.0


def ocv_soc(millivolts, milliamps, charger_active=False):
    """State of charge implied by the voltage alone.

    V_terminal = OCV + I*R, but R depends on the state of charge, so solve by
    fixed point. On battery the iteration damps itself and settles in two or
    three passes. While the charger is delivering the signs flip and it runs
    away downwards (it once seeded a ~18% pack as 8%), so take a single pass
    there. `charger_active` means the charger is *delivering*, not that VBus
    is set.
    """
    soc = soc_from_ocv(millivolts)
    for _ in range(1 if (charger_active or milliamps >= 0) else 3):
        soc = soc_from_ocv(millivolts - milliamps * pack_resistance(soc))
    return soc


def soc_bracket(millivolts, milliamps):
    """(floor, ceiling) on the true state of charge, from the terminal alone.

    Uses only that pack resistance lies in 0..BATT_R_MAX_MOHM. Charging, the
    terminal sits above OCV, so the plain reading is a ceiling and the
    R-corrected one a floor; discharging, the two swap.
    """
    shifted = soc_from_ocv(millivolts - milliamps * BATT_R_MAX_MOHM / 1000.0)
    plain = soc_from_ocv(millivolts)
    return (shifted, plain) if milliamps > 0 else (plain, shifted)


def bracket_clamp(soc, millivolts, milliamps):
    """(corrected soc, floor, ceiling). Unchanged when it was already possible.

    The margin is applied outwards on both sides, and the low edge wins if
    they ever cross, so a nearly-full pack is pushed up rather than down.
    """
    floor, ceiling = soc_bracket(millivolts, milliamps)
    low = floor - BATT_BRACKET_MARGIN
    high = max(ceiling + BATT_BRACKET_MARGIN, low)
    return min(max(soc, low), high), floor, ceiling


def vbus_present():
    """Bit 0x80 of `status`. A hint only, NOT proof that a charger is attached.

    It has stayed asserted for over an hour with the cable unplugged
    (intermittent). The only proof of a charger is charge arriving, i.e. a
    positive `amps`, which is what the decisions in this file key on.
    """
    status = read_int(os.path.join(XPI, "status"))
    return bool(status is not None and status & 0x80)


def save_battery_state():
    if _soc is not None:
        # Fields: epoch, coulomb count, raw OCV reading at the same moment.
        # Only the OCV can be compared against the OCV taken at the next boot;
        # differencing a drifted coulomb count against a fresh OCV guess gives
        # misleading "gained while off" figures.
        mv = read_int(os.path.join(XPI, "battery"))
        ma = read_int(os.path.join(XPI, "amps"))
        # ocv_soc already single-passes on a positive current, so no charger
        # flag is needed.
        ocv = ("%.1f" % ocv_soc(mv, ma or 0)
               if mv is not None else "")
        write_str(BATT_STATE_PATH,
                  "%d %.1f %s\n" % (int(time.time()), _soc, ocv))


def load_battery_state():
    """(epoch, coulomb_soc, ocv_soc_or_None) from the last run, or None."""
    try:
        with open(BATT_STATE_PATH) as f:
            fields = f.read().split()
        epoch, soc = int(fields[0]), float(fields[1])
        ocv = float(fields[2]) if len(fields) > 2 else None
        return epoch, max(0.0, min(100.0, soc)), ocv
    except (OSError, ValueError, IndexError):
        return None


def publish_battery():
    """Refresh BAT0. Returns (percent, charging) so callers can act on it."""
    global _soc, _seed, _batt_last, _full_since, _last_charge
    global _bracket_logged, _bracket_since

    millivolts = read_int(os.path.join(XPI, "battery"))
    milliamps = read_int(os.path.join(XPI, "amps"))
    if millivolts is None or not (BATT_SANE_MIN_MV < millivolts < BATT_SANE_MAX_MV):
        # Glitch sample. Keep whatever we last published rather than letting it
        # into the integrator, where the error would never wash out.
        return (None if _soc is None else int(round(_soc))), True
    if milliamps is None:
        milliamps = 0

    # VBus (bit 0x80 of `status`) says whether a charger is attached; the sign
    # of `amps` says whether the pack is filling or draining. They differ: the
    # charger cannot cover the console's own draw (VBus present with the pack
    # still supplying 550mA), and VBus is occasionally stuck on.
    status = read_int(os.path.join(XPI, "status"))
    on_charger = bool(status is not None and status & 0x80)
    charging = milliamps >= 0
    now = time.monotonic()
    if milliamps > 0:
        _last_charge = now
    # True once the pack has shed the polarisation a charge leaves behind.
    # Voltage-derived logic is gated on this, not on VBus: a charger that is
    # attached but delivering nothing does not disturb the terminal.
    relaxed = _last_charge is None or now - _last_charge >= BATT_RELAX_S

    # --- seed the integrator from the OCV curve on the first few samples ---
    if _soc is None:
        if _seed is None:
            _seed = (now + BATT_SEED_S, [])
        _seed[1].append(ocv_soc(millivolts, milliamps, not relaxed))
        ordered = sorted(_seed[1])
        median = ordered[len(ordered) // 2]
        if now < _seed[0]:
            # Publish something so ES has a value, but report None to the
            # caller: a single OCV sample is worth +-5 points and must not be
            # allowed to trip the low-battery shutdown.
            write_str(os.path.join(BAT, "capacity"), "%d\n" % int(round(median)))
            write_str(os.path.join(BAT, "status"), "%s\n" % (
                "Discharging" if not on_charger
                else ("Charging" if charging else "Not charging")))
            write_str(os.path.join(BAT, "voltage_now"), "%d\n" % (millivolts * 1000))
            write_str(os.path.join(BAT, "current_now"), "%d\n" % (milliamps * 1000))
            return None, charging
        _soc = median
        _seed = None
        state = load_battery_state()
        age = None if state is None else time.time() - state[0]
        if abs(milliamps) <= BATT_OCV_TRUST_MA:
            # Barely any current: the terminal IS the open-circuit voltage, and
            # nothing beats a direct reading, so this outranks every saved
            # value (e.g. a pack back from a night on the charger at 4110mV
            # taking 100mA is simply full).
            log("battery: %dmA is small enough that %dmV is the open-circuit"
                " voltage - taking %.1f%% directly" % (milliamps, millivolts, _soc))
        elif state is not None and 0 <= age <= BATT_STATE_FRESH_S:
            # Same session, near enough: carry the coulomb count across the
            # restart rather than re-guessing it.
            log("battery: seeding from state file: %.1f%% saved %dmin ago"
                " (voltage guess was %.1f%%)" % (state[1], age // 60, _soc))
            _soc = state[1]
        elif state is not None and on_charger and 0 <= age <= BATT_STATE_MAX_AGE_S:
            # A real charge current is flowing, so the terminal is inflated and
            # the saved count is the better starting point. Carried over as-is:
            # a powered-off console on the charger does gain charge (measured
            # ~450mAh over 11.4h), so no standby-drain subtraction. The
            # bracket and the anchor correct any remaining error.
            _soc = state[1]
            log("battery: charging at %dmA so the terminal is inflated (it said"
                " %.1f%%); resuming the saved %.1f%% from %.1fh ago"
                % (milliamps, median, state[1], age / 3600.0))
        elif state is not None and state[2] is not None:
            # Off the charger the voltage is the honest estimate, so take it,
            # but log OCV-then vs OCV-now: the only apples-to-apples measure of
            # what the off period did to the pack.
            log("battery: %.1fh off, OCV %.1f%% -> %.1f%% (%+.1f points);"
                " coulomb count was %.1f%%"
                % (age / 3600.0, state[2], _soc, _soc - state[2], state[1]))
        # A saved count is only worth carrying forward if the pack could still
        # be there. When it is impossible, fall back to the voltage estimate
        # (a median over several seconds, at its best here) rather than to the
        # edge of the bracket: the edge is only a bound, and starting there
        # leaves the gauge ~20 points low with the anchor far too slow to
        # close the gap.
        clamped, floor, ceiling = bracket_clamp(_soc, millivolts, milliamps)
        if abs(clamped - _soc) > 0.05:
            fallback, _, _ = bracket_clamp(median, millivolts, milliamps)
            log("battery: %.1f%% is impossible at %dmV/%dmA (%.0f-%.0f%%);"
                " starting from the voltage estimate %.1f%% instead"
                % (_soc, millivolts, milliamps, floor, ceiling, fallback))
            _soc = fallback
        log("battery: seeded at %.1f%% (%dmV, %dmA)" % (_soc, millivolts, milliamps))

    # --- integrate current: this is what gives the gauge its rate ---
    if _batt_last is None:
        dt, last_ma = BATT_PUBLISH_S, milliamps
    else:
        dt, last_ma = min(now - _batt_last[0], 5.0), _batt_last[1]
        _soc += (last_ma + milliamps) / 2.0 * dt / 3600.0 / BATT_CAPACITY_MAH * 100.0
    _batt_last = (now, milliamps)

    # --- correct its drift against the OCV curve ---
    # Needs the charger to have stopped delivering (not to be unplugged): what
    # holds the terminal high is charge polarisation, which BATT_RELAX_S waits
    # out. Samples straddling a load step are discarded while the pack settles.
    settled = (relaxed and milliamps < -BATT_ANCHOR_MIN_MA
               and abs(milliamps - last_ma) < BATT_ANCHOR_STEP_MA)
    if settled:
        target = ocv_soc(millivolts, milliamps)
        tau = BATT_ANCHOR_TAU_S if target < _soc else BATT_ANCHOR_TAU_UP_S
        _soc += (1.0 - math.exp(-dt / tau)) * (target - _soc)

    # --- catch the gross errors the anchor is too slow to walk back ---
    # The anchor's 10-30 minute time constant suits drift, not a count that is
    # 30 points out. The bracket only asks whether the count is physically
    # possible given the terminal, and snaps it to the nearest possible value.
    corrected, floor, ceiling = bracket_clamp(_soc, millivolts, milliamps)
    if abs(corrected - _soc) > 0.05:
        if _bracket_since is None:
            _bracket_since = now
        elif now - _bracket_since >= BATT_BRACKET_HOLD_S:
            if now - _bracket_logged >= BATT_BRACKET_LOG_S:
                log("battery: %.1f%% is outside what %dmV at %dmA allows"
                    " (%.0f-%.0f%%); correcting to %.1f%%"
                    % (_soc, millivolts, milliamps, floor, ceiling, corrected))
                _bracket_logged = now
            _soc = corrected
    else:
        _bracket_since = None

    # --- charge termination: the one point where charge is known exactly ---
    # Keyed on VBus rather than current sign, since at the end of a charge the
    # pack current hovers around zero and would keep resetting the timer. The
    # window must be symmetric: a finished charge is current *small either
    # way* with the terminal held high, not merely `<= taper` (true at
    # -500mA, a visibly draining pack).
    if (on_charger and millivolts >= BATT_FULL_MV
            and abs(milliamps) <= BATT_FULL_TAPER_MA):
        if _full_since is None:
            _full_since = now
        elif now - _full_since >= BATT_FULL_HOLD_S:
            _soc = 100.0
    else:
        _full_since = None

    _soc = max(0.0, min(100.0, _soc))
    percent = int(round(_soc))

    # "Not charging" is the standard value for plugged-in-but-not-filling, and
    # is worth surfacing: it is the normal state while playing on the charger.
    # `relaxed` plus a draining pack means battery, whatever VBus claims.
    if not on_charger or (relaxed and milliamps < 0):
        state = "Discharging"
    elif percent >= 100:
        state = "Full"
    elif charging:
        state = "Charging"
    else:
        state = "Not charging"

    write_str(os.path.join(BAT, "capacity"), "%d\n" % percent)
    write_str(os.path.join(BAT, "status"), "%s\n" % state)
    write_str(os.path.join(BAT, "voltage_now"), "%d\n" % (millivolts * 1000))
    write_str(os.path.join(BAT, "current_now"), "%d\n" % (milliamps * 1000))
    write_str(os.path.join(BAT, "current_avg"), "%d\n" % (milliamps * 1000))
    write_str(os.path.join(BAT, "charge_full"),
              "%d\n" % int(BATT_CAPACITY_MAH * 1000))
    write_str(os.path.join(BAT, "charge_now"),
              "%d\n" % int(BATT_CAPACITY_MAH * 1000 * _soc / 100.0))
    return percent, charging


# ----------------------------------------------------------------- power ----
def charge_hold():
    """Park the console to charge instead of powering off.

    Charging is much faster with the Pi running (+850..1050mA, a full charge
    in ~4h) than switched off (slow taper, but it does still charge). So a
    shutdown requested with a charger actually delivering stops ES and stays
    resident instead.

    ONLY valid while the power slider is still on. With the slider off the MCU
    cuts the rail on its own regardless of the Pi (measured: 44 seconds after
    engaging), turning a clean poweroff into a power cut mid-write; the
    caller must not enter this on the switch path.

    Leaves when the charger is unplugged or the slider is switched off (-> poweroff).

    Returns "poweroff" or "exit" (daemon stopped externally).
    """
    subprocess.run(["/etc/init.d/S31emulationstation", "stop"],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    subprocess.run(["sync"])
    # Screen off, like the veille standby: with the Pi running (120Hz
    # heartbeat alive) flags=0 only cuts the LCD rail (~440mA), it does NOT
    # let the MCU drop board power. That frees charger budget for the pack and
    # makes the console look off.
    write_str(os.path.join(XPI, "flags"), "0")
    fan_band = 0
    next_fan = next_log = next_save = 0.0
    draining_since = None
    while _running:
        if not vbus_present():
            log("charge-hold: charger unplugged")
            return "poweroff"
        status = read_int(os.path.join(XPI, "status"))
        if status is not None and not status & 0x40:
            log("charge-hold: power switch turned off")
            return "poweroff"
        now = time.monotonic()

        # Charge arriving is the only proof of a charger. Give up if it does
        # not, or at the cell floor - the pack was already low, so there is no
        # margin to spend on optimism about VBus.
        millivolts = read_int(os.path.join(XPI, "battery"))
        milliamps = read_int(os.path.join(XPI, "amps"))
        if millivolts is not None and millivolts <= LOW_BATT_MV:
            log("charge-hold: %dmV, at the cell floor - powering off"
                % millivolts)
            return "poweroff"
        if milliamps is not None and milliamps < 0:
            if draining_since is None:
                draining_since = now
            elif now - draining_since >= CHARGE_HOLD_GIVEUP_S:
                log("charge-hold: still draining (%dmA) after %.0fs with the"
                    " screen off - VBus is lying, powering off"
                    % (milliamps, CHARGE_HOLD_GIVEUP_S))
                return "poweroff"
        else:
            draining_since = None

        publish_battery()  # keeps the gauge live and lets Full latch 100%
        if now >= next_save:
            next_save = now + 60.0
            save_battery_state()
        if now >= next_fan:  # ES is gone; keep the thermal safety net alive
            next_fan = now + FAN_UPDATE_S
            raw = read_int(THERMAL)
            if raw is not None:
                temp = raw / 1000.0 if raw > 1000 else float(raw)
                fan_band, duty = target_duty(FAN_PROFILES["quiet"][1],
                                             FAN_PROFILES["quiet"][0],
                                             temp, fan_band)
                if read_int(os.path.join(XPI, "fan")) != duty:
                    write_str(os.path.join(XPI, "fan"), duty)
        time.sleep(1.0)
    write_str(os.path.join(XPI, "flags"), "1")  # leave the console usable
    return "exit"


# ------------------------------------------------------- user messages ----
def load_power_config():
    """User options from piboy-power.conf (also set from the System Settings
    menu): save_on_shutdown (1/0) and low_battery_warning (10/15/20/0)."""
    cfg = {"save_on_shutdown": "1", "low_battery_warning": "10"}
    try:
        with open(POWER_CONF) as f:
            for line in f:
                m = re.match(r"\s*(save_on_shutdown|low_battery_warning)\s*=\s*(\S+)", line)
                if m:
                    cfg[m.group(1)] = m.group(2)
    except OSError:
        pass
    return (cfg["save_on_shutdown"] != "0",
            LOW_BATT_WARN_LEVELS.get(cfg["low_battery_warning"], (10, 7)))


# font renders plain ASCII.
MESSAGES = {
    "low": ("Battery low: %d%%", "Batterie faible : %d%%"),
    "empty": ("Battery empty: saving", "Batterie vide : sauvegarde"),
    "shutdown": ("Shutting down...", "Extinction..."),
    "saved": ("Game saved", "Partie sauvegardee"),
}

def shutdown(reason):
    """Stop ES first so game saves flush, then let the MCU cut power.

    Writing 0 to `flags` tells the MCU it may drop the rail, so it must be the
    last thing before poweroff. Deliberately NOT done on reboot: the MCU would
    cut power instead of letting the board come back up.

    If the charger is attached AND the slider is still on (the low-battery
    path, not the switch path), charge instead of powering off - see
    charge_hold.
    """
    global _running
    log("shutdown: %s" % reason)
    action = "poweroff"
    status = read_int(os.path.join(XPI, "status"))
    switch_on = bool(status is not None and status & 0x40)
    if vbus_present():
        if switch_on:
            log("charge-hold: %s with charger attached - staying up to charge"
                % reason)
            action = charge_hold()
        else:
            # It still charges switched off, just much more slowly than with
            # the Pi resident; tell the user to leave it on to charge quickly.
            log("note: powering off on the charger - it will still charge, but"
                " slowly; leave it switched on to charge at ~1A")
    _running = False
    save_battery_state()
    if action == "exit":
        return  # daemon stopped from outside; not ours to halt the system
    subprocess.run(["/etc/init.d/S31emulationstation", "stop"],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    subprocess.run(["sync"])
    if XPI == XPI_USER:
        # Tells the user-space driver and the boot hook that this is a real
        # poweroff: keep flags=0, and do not start a shutdown of its own.
        write_str(os.path.join(XPI, "poweroff"), "")
    write_str(os.path.join(XPI, "flags"), "0")
    subprocess.run(["poweroff"])
    time.sleep(30)


# ------------------------------------------------------------------ main ----
def main():
    def on_signal(signum, _frame):
        global _running
        _running = False
        save_battery_state()
        log("caught signal %d, exiting" % signum)

    signal.signal(signal.SIGTERM, on_signal)
    signal.signal(signal.SIGINT, on_signal)

    if not os.path.isdir(XPI):
        log("FATAL: %s missing - is xpi_gamecon loaded?" % XPI)
        return 1
    if XPI == XPI_USER:
        # The user-space driver runs its own fan, volume and power-switch
        # handling only while no daemon claims them: this pid is the claim.
        write_str(os.path.join(XPI, "managed"), "%d" % os.getpid())

    fan_profile, fan_idle, fan_curve = load_fan_config()
    fan_conf_mtime = _mtime(FAN_CONF_PATH)
    led_mode, led_red, led_green = load_led_config()
    led_conf_mtime = _mtime(LED_CONF_PATH)
    apply_led(led_red, led_green)
    bat_percent, bat_charging = None, False
    have_battery = power_supply_ready()
    fan_node = os.path.join(XPI, "fan")
    status_node = os.path.join(XPI, "status")
    volume_node = os.path.join(XPI, "volume")

    fan_band = 0
    last_volume = None
    switch_held_since = None
    next_battery_publish = 0.0
    next_fan_update = 0.0
    next_battery_log = 0.0
    next_state_save = 0.0
    warned = set()
    _save, warn_levels = load_power_config()
    power_conf_mtime = _mtime(POWER_CONF)

    log("started on %s (fan profile=%s idle=%d curve=%s, battery=%s, led=%s %d/%d)"
        % (XPI, fan_profile, fan_idle, fan_curve, "yes" if have_battery else "no",
           led_mode, led_red, led_green))

    while _running:
        now = time.monotonic()

        # --- power switch: bit 0x40 clear means the slider is off ---
        status = read_int(status_node)
        if status is not None:
            if not status & 0x40:
                if switch_held_since is None:
                    switch_held_since = now
                elif now - switch_held_since >= SWITCH_DEBOUNCE_S:
                    shutdown("power switch")
                    break
            else:
                switch_held_since = None

        # --- battery ---
        if have_battery and now >= next_battery_publish:
            next_battery_publish = now + BATT_PUBLISH_S
            percent, charging = publish_battery()
            bat_percent, bat_charging = percent, charging
            if percent is not None:
                if not warn_levels or charging or percent > max(warn_levels) + 2:
                    warned.clear()
                elif any(percent <= lvl and lvl not in warned for lvl in warn_levels):
                    warned.update(lvl for lvl in warn_levels if percent <= lvl)
            if percent is not None and not charging:
                millivolts = read_int(os.path.join(XPI, "battery"))
                if percent <= LOW_BATT_PCT:
                    shutdown("battery %d%%" % percent)
                    break
                # Backstop on the measured terminal voltage: the percentage is
                # inferred, and the cell must not be dragged down regardless.
                if millivolts is not None and millivolts < LOW_BATT_MV:
                    shutdown("battery terminal %dmV" % millivolts)
                    break

        # --- persist the coulomb count for the next boot's seed ---
        if now >= next_state_save:
            next_state_save = now + BATT_STATE_SAVE_S
            save_battery_state()

        # --- volume wheel ---
        volume = read_int(volume_node)
        if volume is not None:
            volume = max(0, min(100, volume))
            if last_volume is None or abs(volume - last_volume) >= 2:
                pin_builtin_audio_sink()
                subprocess.run(["batocera-audio", "setSystemVolume", str(volume)],
                               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                last_volume = volume

        # --- fan (and the LED config, which rides the same slow tick) ---
        if now >= next_fan_update:
            next_fan_update = now + FAN_UPDATE_S
            m = _mtime(LED_CONF_PATH)
            if m != led_conf_mtime:
                led_conf_mtime = m
                led_mode, led_red, led_green = load_led_config()
                log("led reloaded: mode=%s red=%d green=%d"
                    % (led_mode, led_red, led_green))
            m = _mtime(POWER_CONF)
            if m != power_conf_mtime:
                power_conf_mtime = m
                _save, warn_levels = load_power_config()
                log("power options reloaded: warn levels %s" % (warn_levels,))
            # Live-reload the profile if the user edited the config file.
            m = _mtime(FAN_CONF_PATH)
            if m != fan_conf_mtime:
                fan_conf_mtime = m
                new_profile, fan_idle, fan_curve = load_fan_config()
                fan_band = 0
                log("fan profile reloaded: %s idle=%d curve=%s"
                    % (new_profile, fan_idle, fan_curve))
            raw = read_int(THERMAL)
            if raw is not None:
                temp = raw / 1000.0 if raw > 1000 else float(raw)
                fan_band, duty = target_duty(fan_curve, fan_idle, temp, fan_band)
                # Compare against the node itself rather than a remembered
                # value, so we converge back if anything else wrote to it.
                if read_int(fan_node) != duty:
                    write_str(fan_node, duty)

        # --- LED ---
        # "battery" mode follows the level (pulsing while charging) and is
        # re-evaluated every loop; "static" mode only writes on change.
        if led_mode == "battery" and bat_percent is not None:
            apply_led(*battery_led(bat_percent, bat_charging, now))
        else:
            apply_led(led_red, led_green)

        time.sleep(POLL_S)

    return 0


if __name__ == "__main__":
    sys.exit(main())
