#!/bin/bash

if command -v grim $> /dev/null; then
        grim -o eDP-1 /tmp/lockscreen_monitor_1.png &
        grim -o DP-1  /tmp/lockscreen_monitor_2.png &

        wait

        hyprlock -q > /dev/null 2>&1 &
else
        echo "Grim not found"
        exit 1
fi


