#!/bin/bash

# Define the directory for screenshots
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Create the screenshot directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Define notification function
notify() {
    notify-send "Screenshot" "$1" -i camera-photo
}

# Screenshot options
options=(
    "󰹑  Clipboard"
    "󰹑  Clipboard + File"
)

# Show rofi menu
selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Screenshot" -theme "$HOME/.config/rofi/screenshot.rasi")

# Handle selection
case "$selected" in
    "󰹑  Clipboard")
        grim -g "$(slurp)" - | wl-copy && \
        notify "Copied to clipboard"
        ;;
    "󰹑  Clipboard + File")
        filename="$SCREENSHOT_DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
        grim -g "$(slurp)" - | tee "$filename" | wl-copy && \
        notify "Saved and copied"
        ;;
esac
