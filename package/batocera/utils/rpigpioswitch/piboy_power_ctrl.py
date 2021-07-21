#!/usr/bin/python
# -*- coding: utf-8 -*-
import time
import sys
import os
# Configuration
WAIT_TIME = 1.0  # [s] Time to wait between each refresh
pwrctrl = 0
pwrctrlOld = 0
hyst = 1
# Volume Controller
try:
    while 1:
        # Read Volume
        pwrctrlFile = open("/sys/kernel/xpi_gamecon/status", "r")
        pwrctrl = int(pwrctrlFile.read())
        pwrctrlFile.close()
        if abs(pwrctrl - pwrctrlOld) > hyst:
            if pwrctrl == 6:
                os.system("shutdown -h now")
            if pwrctrl == 134:
                os.system("shutdown -h now")

        pwrctrlOld = pwrctrl
        # Wait until next refresh
        time.sleep(WAIT_TIME)

# If a keyboard interrupt occurs (ctrl   c)
except KeyboardInterrupt:
    sys.exit()
