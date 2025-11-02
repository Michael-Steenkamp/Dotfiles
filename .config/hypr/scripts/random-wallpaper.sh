#!/bin/bash

# Path to your wallpaper directory
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Pick a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Create hyprpaper config file
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Write hyprpaper config dynamically
cat > "$CONFIG_FILE" <<EOF
preload = $WALLPAPER
wallpaper = ,$WALLPAPER
EOF

# Start hyprpaper
hyprpaper &
echo "[LOG] Wallpaper set to: $WALLPAPER"

