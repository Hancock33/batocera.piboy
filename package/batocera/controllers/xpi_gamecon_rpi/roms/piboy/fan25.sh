#!/bin/bash
PID=$(pgrep -f  piboy_fan_ctrl.py)
kill $PID
echo 60 >/sys/kernel/xpi_gamecon/fan
