#!/usr/bin/python
# -*- coding: utf-8 -*-
import time
import sys
import os.path

# Configuration
WAIT_TIME = 5  # [s] Time to wait between each refresh
hyst = 1
# Fan Control
cpuTemp = 0
cpuTempOld = 0
fphihi = 242
fphi = 194
fpmed = 147
fplo = 110
fplolo = 90
fpdefault = 75
# Battery Control
battctrl = 100
battctrlOld = 100

#Read Fan.ini file
if os.path.isfile('/boot/fan.ini'):
	from configparser import ConfigParser
	config_object = ConfigParser()
	config_object.read("/boot/fan.ini")

	userinfo = config_object["FAN"]

	fphihi = (userinfo["75DegC"])
	fphi = (userinfo["70DegC"])
	fpmed = (userinfo["65DegC"])
	fplo = (userinfo["60DegC"])
	fplolo = (userinfo["55DegC"])
	fpdefault = (userinfo["50DegC"])

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
                fanFile.write(str(fphihi))
                fanFile.close()
            elif cpuTemp >= 70:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write(str(fphi))
                fanFile.close()
            elif cpuTemp >= 65:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write(str(fpmed))
                fanFile.close()
            elif cpuTemp >= 60:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write(str(fplo))
                fanFile.close()
            elif cpuTemp >= 55:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write(str(fplolo))
                fanFile.close()
            else:
                fanFile = open("/sys/kernel/xpi_gamecon/fan", "w")
                fanFile.write(str(fpdefault))
                fanFile.close()
        cpuTempOld = cpuTemp

        # Read Battery < 5% shutdown
        battctrlFile = open("/sys/kernel/xpi_gamecon/percent", "r")
        battctrl = int(battctrlFile.read())
        battctrlFile.close()

        if battctrl <= 10:
            WAIT_TIME = 1
            os.system("echo 20 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.2)
            os.system("echo 100 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.2)
            os.system("echo 20 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.2)
            os.system("echo 100 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.2)
            os.system("echo 20 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.2)
            os.system("echo 100 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.2)
            os.system("echo 20 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.4)
            os.system("echo 100 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.4)
            os.system("echo 20 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.4)
            os.system("echo 100 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.4)
            os.system("echo 20 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.4)
            os.system("echo 100 > /sys/kernel/xpi_gamecon/green")
            time.sleep(0.4)

        if battctrl <= 5:
            os.system("touch /tmp/shutdown.please")
            os.system("/usr/bin/batocera-es-swissknife --shutdown")

        # Wait until next refresh
        time.sleep(WAIT_TIME)

# If a keyboard interrupt occurs (ctrl   c)
except KeyboardInterrupt:
    sys.exit()
