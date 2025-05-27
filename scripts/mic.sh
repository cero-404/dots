#!/bin/bash

# Created by Varrxy (Modified for PipeWire + wpctl by ChatGPT)

# Volume change step
VOLUME_CHANGE=5
SOURCE="@DEFAULT_AUDIO_SOURCE@"

# Function to get current mic volume as a plain integer (e.g. 42)
get_volume() {
    wpctl get-volume "$SOURCE" | awk '{print int($2 * 100)}'
}

# Function to check if mic is muted
is_muted() {
    wpctl get-volume "$SOURCE" | grep -q MUTED && echo "yes" || echo "no"
}

# Function to clamp and set volume
set_volume() {
    local new_volume=$1
    if (( new_volume > 100 )); then
        new_volume=100
    elif (( new_volume < 0 )); then
        new_volume=0
    fi
    wpctl set-volume "$SOURCE" "${new_volume}%"
}

# Main logic
case "$1" in
    --inc)
        current=$(get_volume)
        set_volume $((current + VOLUME_CHANGE))
        ;;
    --dec)
        current=$(get_volume)
        set_volume $((current - VOLUME_CHANGE))
        ;;
    --toggle)
        wpctl set-mute "$SOURCE" toggle
        ;;
    *)
        echo "Usage: $0 --inc | --dec | --toggle"
        exit 1
        ;;
esac
