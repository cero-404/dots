#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Use wofi to select a wallpaper file
selected=$(ls "$WALLPAPER_DIR" | wofi --dmenu -i -p "Select wallpaper:")

# If something is selected, set it as wallpaper using swaybg
if [ -n "$selected" ]; then
    echo "Setting wallpaper to $WALLPAPER_DIR/$selected"
    # Kill any existing swaybg processes to avoid multiple wallpapers
    pkill swaybg
    # Set the wallpaper with 'fill' mode (you can change mode if you want)
    swaybg -i "$WALLPAPER_DIR/$selected" -m fill &
fi
