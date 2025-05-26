#!/bin/bash

# Check dependencies
for cmd in grim slurp wl-copy notify-send dmenu; do
    if ! command -v $cmd &> /dev/null; then
        notify-send "❌ Missing Dependency" "$cmd is not installed"
        exit 1
    fi
done

# Screenshot save path
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
TIMESTAMP=$(date +'%Y%m%d-%H%M%S')
FILENAME="screenshot-$TIMESTAMP.png"
FILEPATH="$DIR/$FILENAME"

# Show dmenu prompt
CHOICE=$(printf "Fullscreen\nArea\nFullscreen (Clipboard)\nArea (Clipboard)" | dmenu -i -p "📸 Screenshot mode:")

# Handle choice
case "$CHOICE" in
    "Fullscreen")
        grim "$FILEPATH"
        notify-send "󱣪 Screenshot Saved" "Saved to $FILEPATH"
        ;;

    "Area")
        grim -g "$(slurp)" "$FILEPATH"
        notify-send "󱣪 Screenshot Saved" "Saved to $FILEPATH"
        ;;

    "Fullscreen (Clipboard)")
        grim "$FILEPATH"
        wl-copy < "$FILEPATH"
        notify-send " Screenshot Copied" "Fullscreen copied to clipboard"
        ;;

    "Area (Clipboard)")
        grim -g "$(slurp)" "$FILEPATH"
        wl-copy < "$FILEPATH"
        notify-send " Screenshot Copied" "Area copied to clipboard"
        ;;

    *)
        notify-send "󰜺 Screenshot cancelled" "No option selected"
        exit 1
        ;;
esac
