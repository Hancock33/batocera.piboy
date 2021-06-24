#!/bin/bash
PID=$(pgrep -f piboy_fan_ctrl.py)
kill $PID
python /usr/bin/piboy_fan_ctrl.py &
PID=$(pgrep -f fanauto.sh)
kill $PID