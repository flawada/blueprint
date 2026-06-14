#!/bin/bash
# Emulated Scroll for MangoWC using ydotool
# Works like Hyprland emulate_scroll
# Hold middle mouse button and move mouse to scroll

# Sensitivity multiplier (adjust if needed)
SENS=40

# Kill previous instance to avoid duplicates
pkill -f "emulated-scroll.sh" 2>/dev/null

# Determine the pointer device
POINTER=$(libinput list-devices | awk '/pointer/ {print $2; exit}')

# Start reading events
libinput debug-events --device "$POINTER" |
while read -r line; do

    # Stop when middle button is released
    if echo "$line" | grep -q "BTN_MIDDLE.*released"; then
        exit 0
    fi

    # Detect relative motion
    if echo "$line" | grep -q "REL_Y"; then
        dy=$(echo "$line" | grep -oE 'value [+-]?[0-9]+' | awk '{print $2}')

        # Scroll down
        if [[ "$dy" -gt 2 ]]; then
            ydotool wheel $((SENS * (-dy)))
        fi

        # Scroll up
        if [[ "$dy" -lt -2 ]]; then
            ydotool wheel $((SENS * (-dy)))
        fi
    fi
done
