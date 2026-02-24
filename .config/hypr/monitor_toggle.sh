#!/bin/bash

# Get connected monitors
CONNECTED_MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Define your internal and external monitor names (adjust as needed, use `hyprctl monitors` to find yours)
INTERNAL_MONITOR="eDP-1" 
EXTERNAL_MONITOR="HDMI-A-1|DP-2|DP-1"

# Check if external monitor is connected
MATCHED_MONITOR=$(echo "$CONNECTED_MONITORS" | grep -oE "$EXTERNAL_MONITOR" | head -1)

if [ -n "$MATCHED_MONITOR" ]; then
    hyprctl keyword monitor "$MATCHED_MONITOR",disable
    hyprctl keyword monitor "$INTERNAL_MONITOR",disable
    sleep 1
    hyprctl keyword monitor "$MATCHED_MONITOR",highrr,auto,1 # Example config for external
fi
