#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Fan and battery controller for xpi_gamecon hardware (Piboy variants).
Reads CPU temperature and adjusts fan speed accordingly; monitors
battery percentage and blinks a warning LED when it's low.
"""

import time
import subprocess
import sys
import os
from configparser import ConfigParser

# --- Configuration ---
WAIT_TIME = 5  # [s] Time to wait between each refresh
TEMP_HYSTERESIS = 1
LOW_BATTERY_THRESHOLD = 10
LOW_BATTERY_WAIT_TIME = 1

CPU_TEMP_PATH = "/sys/class/thermal/thermal_zone0/temp"
FAN_PATH = "/sys/kernel/xpi_gamecon/fan"
BATTERY_PATH = "/sys/kernel/xpi_gamecon/percent"
GREEN_LED_PATH = "/sys/kernel/xpi_gamecon/green"

FAN_CONFIG_DIRS = ["/userdata/system/configs/fan/", "/boot/"]

# Default fan speed steps, keyed by temperature threshold (°C)
DEFAULT_FAN_CURVE = {
    75: 242,
    70: 194,
    65: 147,
    60: 110,
    55: 90,
    0:  75,  # fallback / "default" tier
}

def get_boot_setting(key):
    result = subprocess.run(
        ["batocera-settings-get", "-f", "/boot/batocera-boot.conf", "key", key],
        stdout=subprocess.PIPE, text=True,
    ).stdout.splitlines()
    return result[0] if result else None

def detect_fan_filename():
    if get_boot_setting("piboy.enabled") == "1":
        return "fan.piboy.ini"
    if get_boot_setting("piboyxrs.enabled") == "1":
        return "fan.piboyxrs.ini"
    return None

def load_fan_curve(fan_filename):
    """Load fan speed overrides from an ini file, if present. Falls back to defaults."""
    curve = dict(DEFAULT_FAN_CURVE)
    if not fan_filename:
        return curve

    for directory in FAN_CONFIG_DIRS:
        path = os.path.join(directory, fan_filename)
        if os.path.isfile(path):
            config = ConfigParser()
            config.read(path)
            section = config["FAN"]
            curve = {
                75: int(section["75DegC"]),
                70: int(section["70DegC"]),
                65: int(section["65DegC"]),
                60: int(section["60DegC"]),
                55: int(section["55DegC"]),
                0:  int(section["50DegC"]),
            }
            break
    return curve

def read_value(path, cast=str):
    with open(path, "r") as f:
        return cast(f.read().strip())

def write_value(path, value):
    with open(path, "w") as f:
        f.write(str(value))

def fan_speed_for_temp(temp_c, curve):
    for threshold in sorted(curve.keys(), reverse=True):
        if temp_c >= threshold:
            return curve[threshold]
    return curve[0]

def blink_low_battery_led():
    """Blink the green LED in a fast-then-slow pattern to warn of low battery."""
    pattern = [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4]
    state = 20
    for delay in pattern:
        write_value(GREEN_LED_PATH, state)
        time.sleep(delay)
        state = 100 if state == 20 else 20


def main():
    global WAIT_TIME

    fan_filename = detect_fan_filename()
    fan_curve = load_fan_curve(fan_filename)

    last_temp = 0.0

    while True:
        try:
            # --- Fan control ---
            temp_c = read_value(CPU_TEMP_PATH, float) / 1000
            if abs(temp_c - last_temp) > TEMP_HYSTERESIS:
                write_value(FAN_PATH, fan_speed_for_temp(temp_c, fan_curve))
            last_temp = temp_c

            # --- Battery control ---
            battery_pct = read_value(BATTERY_PATH, int)
            if battery_pct <= LOW_BATTERY_THRESHOLD:
                WAIT_TIME = LOW_BATTERY_WAIT_TIME
                blink_low_battery_led()

        except (OSError, ValueError, KeyError) as e:
            print(f"Warning: sensor read/config error ({e})", file=sys.stderr)

        time.sleep(WAIT_TIME)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(0)
