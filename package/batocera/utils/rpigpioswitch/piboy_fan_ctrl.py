#!/usr/bin/python
# -*- coding: utf-8 -*-
import time
import sys

# Configuration
WAIT_TIME = 5  # [s] Time to wait between each refresh
cpuTemp = 0
cpuTempOld = 0
hyst = 1
# Fan Controller
try:
    while 1:
        # Read CPU temperature
        cpuTempFile = open("/sys/class/thermal/thermal_zone0/temp", "r")
        cpuTemp = float(cpuTempFile.read()) / 1000
        cpuTempFile.close()
        if abs(cpuTemp - cpuTempOld) > hyst:
            # Calculate desired fan speed
            if cpuTemp >= 75:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write("242")
                fanFile.close()
            elif cpuTemp >= 70:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write("194")
                fanFile.close()
            elif cpuTemp >= 65:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write("147")
                fanFile.close()
            elif cpuTemp >= 60:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write("110")
                fanFile.close()
            elif cpuTemp >= 55:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write("75")
                fanFile.close()
            else:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write("20")
                fanFile.close()
        cpuTempOld = cpuTemp
        # Wait until next refresh
        time.sleep(WAIT_TIME)

# If a keyboard interrupt occurs (ctrl   c)
except KeyboardInterrupt:
    sys.exit()
