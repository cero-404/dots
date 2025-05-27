#!/bin/bash

# Created by Varrxy (Modified for PipeWire + wpctl by ChatGPT)

# Volume increment/decrement step
INCREMENT=5
SINK="@DEFAULT_AUDIO_SINK@"

# Function to get current volume (as percentage without % sign)
get_volume() {
    wpctl get-volume "$SINK" | awk '{print int($2 * 100)}'
}

# Function to check if the sink is muted
is_muted() {
    wpctl get-volume "$SINK" | grep -q MUTED && echo "yes" || echo "no"
}

# Function to set volume to a clamped percentage (0–100)
set_volume() {
    local new_volume=$1
    if (( new_volume > 100 )); then
        new_volume=100
    elif (( new_volume < 0 )); then
        new_volume=0
    fi
    wpctl set-volume "$SINK" "${new_volume}%"
}

# Main control logic
case "$1" in
    --inc)
        current=$(get_volume)
        set_volume $((current + INCREMENT))
        ;;
    --dec)
        current=$(get_volume)
        set_volume $((current - INCREMENT))
        ;;
    --toggle)
        wpctl set-mute "$SINK" toggle
        ;;
    *)
        echo "Usage: $0 --inc | --dec | --toggle"
        exit 1
        ;;
esac
