#!/usr/bin/env python3
"""PiBoy DMG control daemon for Batocera.

Based upon https://github.com/Sblawx/piboy-dmg-batocera.git (credits to Sblawx)

Sits on top of the xpi_gamecon kernel module (/sys/kernel/xpi_gamecon/), or on
xpi-user/xpi_user.py (/run/xpi_gamecon/) for the PiBoy XRS.

  battery - mirrors the MCU into /sys/class/power_supply/BAT0 for ES
  fan     - temperature curve (the `fan` node is a 0-255 PWM duty)
  volume  - volume wheel -> system volume
  power   - power switch / low battery -> clean shutdown
  led     - power LED, static colour or battery indicator
"""

import configparser
import math
import os
import re
import signal
import subprocess
import sys
import time

# ---------------------------------------------------------------- config ----
POLL_S = 0.25             # main loop period
BATT_PUBLISH_S = 1.0      # battery sample/integrate period
BATT_NODE_S = 2.0         # BAT0 rewrite period (ES reads every 5s)
NICE = 5                  # CPU priority, so games win under load
FAN_UPDATE_S = 2.0        # fan curve / config reload period
SWITCH_DEBOUNCE_S = 1.5   # power switch must be off this long to trigger
LOW_BATT_PCT = 5          # clean shutdown below this charge
LOW_BATT_MV = 3150        # terminal-voltage floor, protects the cell
POWER_CONF = "/userdata/system/piboy-power.conf"
# low_battery_warning in piboy-power.conf -> warning levels while discharging
LOW_BATT_WARN_LEVELS = {"10": (10, 7), "15": (15, 10), "20": (20, 10), "0": ()}

# --------------------------------------------------------------- battery ----
# The MCU percent is a linear map of terminal voltage (sags under load), so the
# gauge is a hybrid: coulomb counting for rate, slowly anchored to the OCV
# curve for absolute value. Replayed over the calibration log: rms error 1.5
# points, worst 5.3.
BATT_CAPACITY_MAH = 4000.0   # coulomb-counted; the charger tops out ~4.12V
# OCV (mV) -> state of charge (%). 0% = 3400mV floor, 100% = 4100mV.
BATT_OCV_TABLE = (
    (3400, 0.0), (3489, 4.6), (3520, 9.0), (3549, 13.4), (3569, 17.8),
    (3593, 22.2), (3609, 26.6), (3625, 31.0), (3644, 35.4), (3661, 39.8),
    (3680, 44.2), (3704, 48.6), (3731, 53.0), (3762, 57.4), (3794, 61.7),
    (3826, 66.1), (3861, 70.5), (3901, 74.9), (3942, 79.3), (3980, 83.7),
    (4014, 88.1), (4047, 92.5), (4100, 100.0),
)
# State of charge (%) -> pack resistance (mOhm).
BATT_R_TABLE = ((0, 140), (10, 120), (25, 100), (50, 80), (75, 55), (100, 50))
# Anchor time constants towards the OCV curve (slower upwards).
BATT_ANCHOR_TAU_S = 600.0
BATT_ANCHOR_TAU_UP_S = 1800.0
# Anchor only under a settled discharge load.
BATT_ANCHOR_MIN_MA = 200
BATT_ANCHOR_STEP_MA = 300
BATT_SEED_S = 10.0               # median-OCV seeding window
BATT_STATE_MAX_AGE_S = 48 * 3600  # max age of a saved count usable on charger
BATT_OCV_TRUST_MA = 200          # below this, terminal is read directly as OCV
# Charge termination re-zeroes the integrator.
BATT_FULL_MV = 4050
BATT_FULL_TAPER_MA = 150
BATT_FULL_HOLD_S = 60.0
# VBus alone is not proof of a charger; give up holding if not filling.
CHARGE_HOLD_GIVEUP_S = 120.0
# Reject broken MCU reads.
BATT_SANE_MIN_MV = 2500
BATT_SANE_MAX_MV = 4400
BATT_STATE_PATH = "/userdata/system/piboy-battery.state"
BATT_STATE_FRESH_S = 1800
BATT_STATE_SAVE_S = 600.0
# Terminal voltage is only meaningful this long after the charger last
# delivered current (gated on current, not VBus).
BATT_RELAX_S = 600.0
# Gross-error guard: bracket the true charge assuming R in 0..250 mOhm.
BATT_R_MAX_MOHM = 250.0
BATT_BRACKET_MARGIN = 12.0
BATT_BRACKET_LOG_S = 300.0
BATT_BRACKET_HOLD_S = 30.0       # violation must persist this long to act

# ------------------------------------------------------------------ LED ----
# Bicolour power LED, channels 0-255. Not persistent across reboot, so the
# config is applied at start and live-reloaded. 2/2 is the stock look.
LED_CONF_PATH = "/userdata/system/piboy-led.conf"
LED_DEFAULT_RED = 2
LED_DEFAULT_GREEN = 2
LED_DEFAULT_MODE = "static"     # static | battery
LED_BATT_GREEN = 50             # > 50%
LED_BATT_AMBER = (50, 22)       # 15-50% (red, green)
LED_BATT_RED = 60               # < 15%

# ------------------------------------------------------------------ fan ----
# Profile chosen in FAN_CONF_PATH, live-reloaded. At FAN_CRITICAL_C the fan is
# forced to full (the Pi4 soft-throttles at 80C).
FAN_CONF_PATH = "/userdata/system/piboy-fan.conf"
FAN_DEFAULT_PROFILE = "quiet"
FAN_HYST_C = 2.0
FAN_CRITICAL_C = 80
FAN_CRITICAL_DUTY = 255

# name -> (idle_duty, [(temp_c, duty_0_255), ...])
FAN_PROFILES = {
    "silent":   (0,  [(68, 110), (74, 180), (80, 255)]),
    "quiet":    (0,  [(60, 80), (67, 120), (73, 175), (79, 235)]),
    "balanced": (60, [(52, 80), (60, 120), (67, 160), (74, 210), (80, 255)]),
    "cool":     (75, [(50, 75), (55, 90), (60, 110), (65, 147), (70, 194), (75, 242)]),
}

# ----------------------------------------------------------------- paths ----
XPI_KERNEL = "/sys/kernel/xpi_gamecon"
XPI_USER = "/run/xpi_gamecon"            # PiBoy XRS
XPI = XPI_USER if not os.path.isdir(XPI_KERNEL) and os.path.isdir(XPI_USER) else XPI_KERNEL
PSDIR = "/sys/class/power_supply"
BAT = os.path.join(PSDIR, "BAT0")
THERMAL = "/sys/class/thermal/thermal_zone0/temp"
ES_INIT = "/etc/init.d/S31emulationstation"


def xpi(name):
    return os.path.join(XPI, name)


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


def _quiet(cmd, **kw):
    return subprocess.run(cmd, stdout=subprocess.DEVNULL,
                          stderr=subprocess.DEVNULL, **kw)


def stop_es():
    """Stop ES so game saves flush, then sync."""
    _quiet([ES_INIT, "stop"])
    subprocess.run(["sync"])


def pin_builtin_audio_sink():
    """Keep the volume wheel on the built-in sink (USB audio grabs default)."""
    try:
        env = dict(os.environ, XDG_RUNTIME_DIR="/var/run")
        out = subprocess.run(["wpctl", "status"], env=env, capture_output=True,
                             text=True, timeout=2).stdout
        for line in out.splitlines():
            if "Built-in Audio Stereo" in line:
                # Lines start with a box-drawing char: take the first number.
                m = re.search(r"\d+", line)
                if m:
                    _quiet(["wpctl", "set-default", m.group()], env=env, timeout=2)
                break
    except (OSError, subprocess.SubprocessError):
        pass


# ------------------------------------------------------------------ fan ----
def _clamp(v, lo=0, hi=255):
    return max(lo, min(hi, v))


def load_fan_config():
    """Return (profile_name, idle_duty, curve); bad config -> default profile."""
    profile = FAN_DEFAULT_PROFILE
    custom_curve = custom_idle = None
    try:
        if os.path.isfile(FAN_CONF_PATH):
            cp = configparser.ConfigParser()
            cp.read(FAN_CONF_PATH)
            sec = cp["fan"] if cp.has_section("fan") else {}
            profile = sec.get("profile", FAN_DEFAULT_PROFILE).strip().lower()
            if "idle_duty" in sec:
                custom_idle = _clamp(int(sec["idle_duty"]))
            if sec.get("curve", "").strip():
                # format: "60:80, 70:160, 80:255"
                pairs = []
                for chunk in sec["curve"].replace(";", ",").split(","):
                    t, d = chunk.split(":")
                    pairs.append((int(t), _clamp(int(d))))
                custom_curve = sorted(pairs) or None
    except (OSError, KeyError, ValueError) as e:
        log("fan config unreadable (%s), using '%s'" % (e, FAN_DEFAULT_PROFILE))
        profile = FAN_DEFAULT_PROFILE

    if profile == "custom" and custom_curve:
        return "custom", custom_idle or 0, custom_curve
    if profile not in FAN_PROFILES:
        log("fan profile '%s' unknown, using '%s'" % (profile, FAN_DEFAULT_PROFILE))
        profile = FAN_DEFAULT_PROFILE
    idle, curve = FAN_PROFILES[profile]
    return profile, (idle if custom_idle is None else custom_idle), list(curve)


def target_duty(curve, idle_duty, temp_c, prev_band):
    """Return (band, duty). Steps up immediately, down only with hysteresis."""
    if temp_c >= FAN_CRITICAL_C:
        return len(curve), FAN_CRITICAL_DUTY
    band = 0
    for i, (threshold, _duty) in enumerate(curve, start=1):
        if temp_c >= threshold:
            band = i
    if prev_band and band < prev_band <= len(curve):
        if temp_c > curve[prev_band - 1][0] - FAN_HYST_C:
            band = prev_band
    return band, _clamp(idle_duty if band == 0 else curve[band - 1][1])


def read_temp():
    raw = read_int(THERMAL)
    if raw is None:
        return None
    return raw / 1000.0 if raw > 1000 else float(raw)


def set_fan(duty):
    # Compare against the node so we converge if anything else wrote to it.
    if read_int(xpi("fan")) != duty:
        write_str(xpi("fan"), duty)


# ------------------------------------------------------------------ LED ----
def load_led_config():
    """Return (mode, red, green), clamped to 0-255."""
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
    return mode, _clamp(red), _clamp(green)


def battery_led(percent, charging, t):
    """(red, green): green > 50%, amber 15-50%, red < 15%; pulses on charge."""
    if percent > 50:
        r, g = 0, LED_BATT_GREEN
    elif percent >= 15:
        r, g = LED_BATT_AMBER
    else:
        r, g = LED_BATT_RED, 0
    if charging:
        k = 0.2 + 0.8 * (0.5 + 0.5 * math.sin(t * 2.0))   # ~3 s pulse
        r, g = int(r * k), int(g * k)
    return _clamp(r), _clamp(g)


def apply_led(red, green):
    for node, value in (("red", red), ("green", green)):
        if read_int(xpi(node)) != value:
            write_str(xpi(node), value)


# -------------------------------------------------------------- battery ----
def power_supply_ready():
    """Overmount the (empty) PSDIR with a writable tmpfs and create BAT0."""
    if os.path.isdir(BAT):
        return True
    try:
        existing = os.listdir(PSDIR)
    except OSError:
        log("battery: %s missing, not publishing" % PSDIR)
        return False
    if existing:
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
    _bat_write(type="Battery", present=1, technology="Li-ion")
    log("battery: publishing at %s" % BAT)
    return True


def _bat_write(**nodes):
    for name, value in nodes.items():
        write_str(os.path.join(BAT, name), "%s\n" % value)


_bat_key = None           # (capacity, status) last written to BAT0
_bat_nodes_at = 0.0       # monotonic time of the last full BAT0 write


def _bat_update(now, **nodes):
    """Write BAT0 only when capacity/status change or BATT_NODE_S has passed."""
    global _bat_key, _bat_nodes_at
    key = (nodes["capacity"], nodes["status"])
    if key == _bat_key and now - _bat_nodes_at < BATT_NODE_S:
        return
    _bat_key, _bat_nodes_at = key, now
    _bat_write(**nodes)


_soc = None               # integrator: charge left, percent
_seed = None              # (deadline, [samples]) while seeding from OCV
_batt_last = None         # (monotonic, mA) of the previous update
_full_since = None        # when the charge-termination condition first held
_last_charge = None       # monotonic time the charger last pushed current in
_bracket_logged = 0.0
_bracket_since = None     # when the bracket was first violated


def _interp(x, table):
    """Clamped linear interpolation over a sorted ((x, y), ...) table."""
    if x <= table[0][0]:
        return table[0][1]
    for (x0, y0), (x1, y1) in zip(table, table[1:]):
        if x <= x1:
            return y0 + (y1 - y0) * (x - x0) / (x1 - x0)
    return table[-1][1]


def soc_from_ocv(open_circuit):
    return _clamp(_interp(open_circuit, BATT_OCV_TABLE), 0.0, 100.0)


def pack_resistance(soc):
    """Ohms."""
    return _interp(soc, BATT_R_TABLE) / 1000.0


def ocv_soc(millivolts, milliamps, charger_active=False):
    """State of charge implied by voltage alone, solving V = OCV + I*R(soc).

    Fixed-point on discharge; a single pass while charging, where it diverges.
    """
    soc = soc_from_ocv(millivolts)
    for _ in range(1 if (charger_active or milliamps >= 0) else 3):
        soc = soc_from_ocv(millivolts - milliamps * pack_resistance(soc))
    return soc


def soc_bracket(millivolts, milliamps):
    """(floor, ceiling) on the true charge assuming R in 0..BATT_R_MAX_MOHM."""
    shifted = soc_from_ocv(millivolts - milliamps * BATT_R_MAX_MOHM / 1000.0)
    plain = soc_from_ocv(millivolts)
    return (shifted, plain) if milliamps > 0 else (plain, shifted)


def bracket_clamp(soc, millivolts, milliamps):
    """(corrected soc, floor, ceiling). The low edge wins if the margins cross."""
    floor, ceiling = soc_bracket(millivolts, milliamps)
    low = floor - BATT_BRACKET_MARGIN
    high = max(ceiling + BATT_BRACKET_MARGIN, low)
    return min(max(soc, low), high), floor, ceiling


def vbus_present():
    """Status bit 0x80: a hint only, can stay set with nothing plugged in."""
    status = read_int(xpi("status"))
    return bool(status is not None and status & 0x80)


def save_battery_state():
    """Write 'epoch coulomb_soc ocv_soc' for the next boot."""
    if _soc is not None:
        mv = read_int(xpi("battery"))
        ma = read_int(xpi("amps"))
        ocv = "%.1f" % ocv_soc(mv, ma or 0) if mv is not None else ""
        write_str(BATT_STATE_PATH, "%d %.1f %s\n" % (int(time.time()), _soc, ocv))


def load_battery_state():
    """(epoch, coulomb_soc, ocv_soc_or_None) from the last run, or None."""
    try:
        with open(BATT_STATE_PATH) as f:
            fields = f.read().split()
        epoch, soc = int(fields[0]), float(fields[1])
        ocv = float(fields[2]) if len(fields) > 2 else None
        return epoch, _clamp(soc, 0.0, 100.0), ocv
    except (OSError, ValueError, IndexError):
        return None


def _seed_soc(median, millivolts, milliamps, on_charger):
    """Pick the starting charge once the seeding window has elapsed."""
    soc = median
    state = load_battery_state()
    age = None if state is None else time.time() - state[0]
    if abs(milliamps) <= BATT_OCV_TRUST_MA:
        # Near-zero current: the terminal is the OCV, beats any saved value.
        log("battery: %dmA is small enough that %dmV is the open-circuit"
            " voltage - taking %.1f%% directly" % (milliamps, millivolts, soc))
    elif state is not None and 0 <= age <= BATT_STATE_FRESH_S:
        log("battery: seeding from state file: %.1f%% saved %dmin ago"
            " (voltage guess was %.1f%%)" % (state[1], age // 60, soc))
        soc = state[1]
    elif state is not None and on_charger and 0 <= age <= BATT_STATE_MAX_AGE_S:
        # Terminal is inflated by charging; the saved count is better.
        log("battery: charging at %dmA so the terminal is inflated (it said"
            " %.1f%%); resuming the saved %.1f%% from %.1fh ago"
            % (milliamps, median, state[1], age / 3600.0))
        soc = state[1]
    elif state is not None and state[2] is not None:
        log("battery: %.1fh off, OCV %.1f%% -> %.1f%% (%+.1f points);"
            " coulomb count was %.1f%%"
            % (age / 3600.0, state[2], soc, soc - state[2], state[1]))
    # An impossible saved count falls back to the voltage estimate, not the
    # bracket edge (which would leave the gauge ~20 points low).
    clamped, floor, ceiling = bracket_clamp(soc, millivolts, milliamps)
    if abs(clamped - soc) > 0.05:
        fallback, _, _ = bracket_clamp(median, millivolts, milliamps)
        log("battery: %.1f%% is impossible at %dmV/%dmA (%.0f-%.0f%%);"
            " starting from the voltage estimate %.1f%% instead"
            % (soc, millivolts, milliamps, floor, ceiling, fallback))
        soc = fallback
    log("battery: seeded at %.1f%% (%dmV, %dmA)" % (soc, millivolts, milliamps))
    return soc


def publish_battery():
    """Refresh BAT0. Returns (percent, charging); percent is None until seeded."""
    global _soc, _seed, _batt_last, _full_since, _last_charge
    global _bracket_logged, _bracket_since

    millivolts = read_int(xpi("battery"))
    milliamps = read_int(xpi("amps"))
    if millivolts is None or not (BATT_SANE_MIN_MV < millivolts < BATT_SANE_MAX_MV):
        # Glitch sample: keep the last published value.
        return (None if _soc is None else int(round(_soc))), True
    if milliamps is None:
        milliamps = 0

    # VBus says a charger is attached; the sign of `amps` says whether the
    # pack is filling. They can differ.
    status = read_int(xpi("status"))
    on_charger = bool(status is not None and status & 0x80)
    charging = milliamps >= 0
    now = time.monotonic()
    if milliamps > 0:
        _last_charge = now
    relaxed = _last_charge is None or now - _last_charge >= BATT_RELAX_S

    # --- seed from the median OCV over the first few seconds ---
    if _soc is None:
        if _seed is None:
            _seed = (now + BATT_SEED_S, [])
        _seed[1].append(ocv_soc(millivolts, milliamps, not relaxed))
        median = sorted(_seed[1])[len(_seed[1]) // 2]
        if now < _seed[0]:
            # Publish for ES but return None: one sample must not trip shutdown.
            _bat_write(capacity=int(round(median)),
                       status=("Discharging" if not on_charger
                               else "Charging" if charging else "Not charging"),
                       voltage_now=millivolts * 1000,
                       current_now=milliamps * 1000)
            return None, charging
        _seed = None
        _soc = _seed_soc(median, millivolts, milliamps, on_charger)

    # --- integrate current: gives the gauge its rate ---
    if _batt_last is None:
        dt, last_ma = BATT_PUBLISH_S, milliamps
    else:
        dt, last_ma = min(now - _batt_last[0], 5.0), _batt_last[1]
        _soc += (last_ma + milliamps) / 2.0 * dt / 3600.0 / BATT_CAPACITY_MAH * 100.0
    _batt_last = (now, milliamps)

    # --- anchor drift to the OCV curve (settled discharge only) ---
    if (relaxed and milliamps < -BATT_ANCHOR_MIN_MA
            and abs(milliamps - last_ma) < BATT_ANCHOR_STEP_MA):
        target = ocv_soc(millivolts, milliamps)
        tau = BATT_ANCHOR_TAU_S if target < _soc else BATT_ANCHOR_TAU_UP_S
        _soc += (1.0 - math.exp(-dt / tau)) * (target - _soc)

    # --- catch gross errors the anchor is too slow to fix ---
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

    # --- charge termination: keyed on VBus, with a symmetric current window ---
    if (on_charger and millivolts >= BATT_FULL_MV
            and abs(milliamps) <= BATT_FULL_TAPER_MA):
        if _full_since is None:
            _full_since = now
        elif now - _full_since >= BATT_FULL_HOLD_S:
            _soc = 100.0
    else:
        _full_since = None

    _soc = _clamp(_soc, 0.0, 100.0)
    percent = int(round(_soc))

    # A relaxed, draining pack means battery whatever VBus claims.
    if not on_charger or (relaxed and milliamps < 0):
        state = "Discharging"
    elif percent >= 100:
        state = "Full"
    elif charging:
        state = "Charging"
    else:
        state = "Not charging"

    _bat_update(now, capacity=percent, status=state,
                voltage_now=millivolts * 1000,
                current_now=milliamps * 1000,
                current_avg=milliamps * 1000,
                charge_full=int(BATT_CAPACITY_MAH * 1000),
                charge_now=int(BATT_CAPACITY_MAH * 1000 * _soc / 100.0))
    return percent, charging


# ----------------------------------------------------------------- power ----
def charge_hold():
    """Stay resident (screen off) to charge at ~1A instead of powering off.

    Only valid while the power slider is on: with it off the MCU cuts the rail
    on its own. Returns "poweroff" or "exit" (daemon stopped externally).
    """
    stop_es()
    # flags=0 with the Pi alive only cuts the LCD rail, freeing charger budget.
    write_str(xpi("flags"), "0")
    quiet_idle, quiet_curve = FAN_PROFILES["quiet"]
    fan_band = 0
    next_fan = next_save = 0.0
    draining_since = None
    while _running:
        if not vbus_present():
            log("charge-hold: charger unplugged")
            return "poweroff"
        status = read_int(xpi("status"))
        if status is not None and not status & 0x40:
            log("charge-hold: power switch turned off")
            return "poweroff"
        now = time.monotonic()

        # Only arriving charge proves a charger; give up if none, or at the floor.
        millivolts = read_int(xpi("battery"))
        milliamps = read_int(xpi("amps"))
        if millivolts is not None and millivolts <= LOW_BATT_MV:
            log("charge-hold: %dmV, at the cell floor - powering off" % millivolts)
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

        publish_battery()  # keeps the gauge live and lets Full latch
        if now >= next_save:
            next_save = now + 60.0
            save_battery_state()
        if now >= next_fan:  # thermal safety net while ES is gone
            next_fan = now + FAN_UPDATE_S
            temp = read_temp()
            if temp is not None:
                fan_band, duty = target_duty(quiet_curve, quiet_idle, temp, fan_band)
                set_fan(duty)
        time.sleep(1.0)
    write_str(xpi("flags"), "1")  # leave the console usable
    return "exit"


def load_power_config():
    """Read piboy-power.conf (also set from the System Settings menu).

    Options: save_on_shutdown (1/0), low_battery_warning (10/15/20/0).
    Returns (save_on_shutdown, warn_levels).
    """
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


# (English, French); the font renders plain ASCII only.
MESSAGES = {
    "low": ("Battery low: %d%%", "Batterie faible : %d%%"),
    "empty": ("Battery empty: saving", "Batterie vide : sauvegarde"),
    "shutdown": ("Shutting down...", "Extinction..."),
    "saved": ("Game saved", "Partie sauvegardee"),
}


def shutdown(reason):
    """Stop ES, then let the MCU cut power (flags=0 must come last).

    Not used for reboot: the MCU would cut power instead of rebooting. With a
    charger attached and the slider still on, charge_hold runs first.
    """
    global _running
    log("shutdown: %s" % reason)
    action = "poweroff"
    status = read_int(xpi("status"))
    if vbus_present():
        if status is not None and status & 0x40:
            log("charge-hold: %s with charger attached - staying up to charge"
                % reason)
            action = charge_hold()
        else:
            log("note: powering off on the charger - it will still charge, but"
                " slowly; leave it switched on to charge at ~1A")
    _running = False
    save_battery_state()
    if action == "exit":
        return
    stop_es()
    if XPI == XPI_USER:
        # Tells the user-space driver this is a real poweroff.
        write_str(xpi("poweroff"), "")
    write_str(xpi("flags"), "0")
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
    try:
        os.nice(NICE)
    except OSError:
        pass

    if not os.path.isdir(XPI):
        log("FATAL: %s missing - is xpi_gamecon loaded?" % XPI)
        return 1
    if XPI == XPI_USER:
        # This pid claims fan/volume/power handling from the user-space driver.
        write_str(xpi("managed"), "%d" % os.getpid())

    fan_profile, fan_idle, fan_curve = load_fan_config()
    fan_conf_mtime = _mtime(FAN_CONF_PATH)
    led_mode, led_red, led_green = load_led_config()
    led_conf_mtime = _mtime(LED_CONF_PATH)
    apply_led(led_red, led_green)
    bat_percent, bat_charging = None, False
    have_battery = power_supply_ready()
    status_node = xpi("status")
    volume_node = xpi("volume")

    fan_band = 0
    last_volume = None
    switch_held_since = None
    next_battery_publish = next_fan_update = next_state_save = next_led = 0.0
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
            if status & 0x40:
                switch_held_since = None
            elif switch_held_since is None:
                switch_held_since = now
            elif now - switch_held_since >= SWITCH_DEBOUNCE_S:
                shutdown("power switch")
                break

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
                if percent <= LOW_BATT_PCT:
                    shutdown("battery %d%%" % percent)
                    break
                # Backstop on measured voltage: the percentage is inferred.
                millivolts = read_int(xpi("battery"))
                if millivolts is not None and millivolts < LOW_BATT_MV:
                    shutdown("battery terminal %dmV" % millivolts)
                    break

        if now >= next_state_save:
            next_state_save = now + BATT_STATE_SAVE_S
            save_battery_state()

        # --- volume wheel ---
        volume = read_int(volume_node)
        if volume is not None:
            volume = _clamp(volume, 0, 100)
            if last_volume is None or abs(volume - last_volume) >= 2:
                pin_builtin_audio_sink()
                _quiet(["batocera-audio", "setSystemVolume", str(volume)])
                last_volume = volume

        # --- fan and config reloads (slow tick) ---
        if now >= next_fan_update:
            next_fan_update = now + FAN_UPDATE_S
            m = _mtime(LED_CONF_PATH)
            if m != led_conf_mtime:
                led_conf_mtime = m
                next_led = 0.0
                led_mode, led_red, led_green = load_led_config()
                log("led reloaded: mode=%s red=%d green=%d"
                    % (led_mode, led_red, led_green))
            m = _mtime(POWER_CONF)
            if m != power_conf_mtime:
                power_conf_mtime = m
                _save, warn_levels = load_power_config()
                log("power options reloaded: warn levels %s" % (warn_levels,))
            m = _mtime(FAN_CONF_PATH)
            if m != fan_conf_mtime:
                fan_conf_mtime = m
                new_profile, fan_idle, fan_curve = load_fan_config()
                fan_band = 0
                log("fan profile reloaded: %s idle=%d curve=%s"
                    % (new_profile, fan_idle, fan_curve))
            temp = read_temp()
            if temp is not None:
                fan_band, duty = target_duty(fan_curve, fan_idle, temp, fan_band)
                set_fan(duty)

        # --- LED: every loop only while pulsing, else on the slow tick ---
        if led_mode == "battery" and bat_percent is not None and bat_charging:
            apply_led(*battery_led(bat_percent, True, now))
        elif now >= next_led:
            next_led = now + FAN_UPDATE_S
            if led_mode == "battery" and bat_percent is not None:
                apply_led(*battery_led(bat_percent, False, now))
            else:
                apply_led(led_red, led_green)

        time.sleep(POLL_S)

    return 0


if __name__ == "__main__":
    sys.exit(main())
