#!/usr/bin/env python3
"""
Volume controller for xpi_gamecon hardware.
"""
from __future__ import annotations

import os
import pathlib
import sys
import time

# --- Configuration ---
WAIT_TIME = 0.5  # [s] Time to wait between each refresh
VOLUME_HYSTERESIS = 1

VOLUME_PATH = "/sys/kernel/xpi_gamecon/volume"

def read_int(path):
    with pathlib.Path(path).open() as f:
        return int(f.read().strip())

def set_system_volume(volume):
    os.system(f"batocera-audio setSystemVolume {volume}")


def main():
    last_volume = 0

    while True:
        try:
            volume = read_int(VOLUME_PATH)
            if abs(volume - last_volume) > VOLUME_HYSTERESIS:
                set_system_volume(volume)
            last_volume = volume

        except (OSError, ValueError) as e:
            print(f"Warning: failed to read volume ({e})", file=sys.stderr)

        time.sleep(WAIT_TIME)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("Sound ctrl interrupted by keyboard")
        sys.exit(0)
