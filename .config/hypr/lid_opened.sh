#!/bin/bash

CONNECTED_MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

INTERNAL_MONITOR="eDP-1" 
EXTERNAL_MONITOR="HDMI-A-1|DP-2|DP-1"

# If external monitor is connected, then disable internal monitor, otherwise suspend
if echo "$CONNECTED_MONITORS" | grep -E "$EXTERNAL_MONITOR"; then
    hyprctl keyword monitor "$INTERNAL_MONITOR",disable
    hyprctl keyword monitor "$EXTERNAL_MONITOR",highrr,auto,auto # Example config for external
else
    # back to normal
    hyprctl reload
fi
