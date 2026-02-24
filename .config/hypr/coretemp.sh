#!/usr/bin/env bash

LINK_PATH="/tmp/coretemp_hwmon"

for hwmon in /sys/class/hwmon/hwmon*; do
    if [[ -f "$hwmon/name" ]] && grep -qx "coretemp" "$hwmon/name"; then
        if [[ -f "$hwmon/temp1_input" ]]; then
            ln -sf "$hwmon/temp1_input" "$LINK_PATH"
            exit 0
        fi
    fi
done
exit 1
