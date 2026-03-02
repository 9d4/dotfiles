#!/usr/bin/env bash
#
# display-mode.sh — Rofi display mode selector for Hyprland
# Step 1: pick a monitor  →  Step 2: pick a mode  →  apply via hyprctl
#

HYPRCTL_OUTPUT=$(hyprctl monitors all)

# ---------------------------------------------------------------------------
# Step 1: Build monitor list  "NAME — description"
# ---------------------------------------------------------------------------
MONITOR_LIST=$(awk '
    /^Monitor / {
        name = $2
        desc = ""
    }
    /^\tdescription:/ {
        sub(/^\tdescription: /, "")
        desc = $0
        print name " — " desc
    }
' <<< "$HYPRCTL_OUTPUT")

SELECTED_MONITOR=$(echo "$MONITOR_LIST" | rofi -dmenu -p " Monitor" -i)

[[ -z "$SELECTED_MONITOR" ]] && exit 0

# Extract the connector name (everything before " — ")
MONITOR_NAME="${SELECTED_MONITOR%% — *}"

# ---------------------------------------------------------------------------
# Step 2: Get available modes + disable option for the chosen monitor
# ---------------------------------------------------------------------------
MODES=$(awk -v mon="$MONITOR_NAME" '
    /^Monitor / { current = $2 }
    /^\tavailableModes:/ && current == mon {
        sub(/^\tavailableModes: /, "")
        n = split($0, arr, " ")
        for (i = 1; i <= n; i++) print arr[i]
    }
' <<< "$HYPRCTL_OUTPUT")

SELECTED_MODE=$(printf " Disable\n%s" "$MODES" | rofi -dmenu -p " Mode" -i)

[[ -z "$SELECTED_MODE" ]] && exit 0

# ---------------------------------------------------------------------------
# Step 3: Apply mode or disable the monitor
# ---------------------------------------------------------------------------
if [[ "$SELECTED_MODE" == " Disable" ]]; then
    hyprctl keyword monitor "${MONITOR_NAME},disable"
else
    hyprctl keyword monitor "${MONITOR_NAME},${SELECTED_MODE},auto,auto"
fi
