#!/usr/bin/python
# -*- coding: utf-8 -*-
import time
import sys
import os
# Configuration
WAIT_TIME = 1.0  # [s] Time to wait between each refresh
pwrctrl = 0
pwrctrlOld = 0
battctrl = 100
battctrlOld = 100
hyst = 1
# Power Switch
try:
    while 1:
        # Read Power Switch
        pwrctrlFile = open("/sys/kernel/xpi_gamecon/status", "r")
        pwrctrl = int(pwrctrlFile.read())
        pwrctrlFile.close()
        if abs(pwrctrl - pwrctrlOld) > hyst:
            if pwrctrl == 6:
                os.system("shutdown -h now")
                os.system("echo 0 > /sys/kernel/xpi_gamecon/flags")
                os.system("/sbin/rmmod xpi_gamecon")
            if pwrctrl == 134:
                os.system("shutdown -h now")
                os.system("echo 0 > /sys/kernel/xpi_gamecon/flags")
                os.system("/sbin/rmmod xpi_gamecon")
        pwrctrlOld = pwrctrl
        # Read Battery
        battctrlFile = open("/sys/kernel/xpi_gamecon/percent", "r")
        battctrl = int(pwrctrlFile.read())
        battctrlFile.close()
        if abs(battctrl - battctrlOld) > hyst:
            if battctrl == 5:
                os.system("shutdown -h now")
                os.system("echo 0 > /sys/kernel/xpi_gamecon/flags")
                os.system("/sbin/rmmod xpi_gamecon")
        battctrlOld = battctrl           
        # Wait until next refresh
        time.sleep(WAIT_TIME)

# If a keyboard interrupt occurs (ctrl   c)
except KeyboardInterrupt:
    sys.exit()
