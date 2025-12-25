#!/bin/bash

# Get connected monitors
CONNECTED_MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Define your internal and external monitor names (adjust as needed, use `hyprctl monitors` to find yours)
INTERNAL_MONITOR="eDP-1" 
EXTERNAL_MONITOR="HDMI-A-1"

# Check if external monitor is connected
if echo "$CONNECTED_MONITORS" | grep -q "$EXTERNAL_MONITOR"; then
    # External connected: disable internal
    hyprctl keyword monitor "$INTERNAL_MONITOR",disable
    hyprctl keyword monitor "$EXTERNAL_MONITOR",highrr,auto,auto # Example config for external
else
    # External disconnected: enable internal (and disable external if it was on)
    # hyprctl keyword monitor "$INTERNAL_MONITOR",1920x1080@60,0x0,1.25
    # hyprctl keyword monitor "$EXTERNAL_MONITOR",disable

    # We can't toggle when there is no monitor, so before we unplug the external
    # reload the hyprland to get back to default config.
fi
