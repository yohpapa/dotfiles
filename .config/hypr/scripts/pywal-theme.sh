#!/usr/bin/env bash

walpaper_directory=$HOME/pictures/wallpapers
wallpaper_path=$(find "$walpaper_directory" -type f -print0 | shuf -z -n 1)

if [[ -z "$wallpaper_path" ]]; then
  echo "Usage: $0 /path/to/your/wallpaper.png"
  exit 1
fi

# Run pywal to generate the theme and save the wallpaper path
wal -i "$wallpaper_path"

# Set the wallpaper using swww
swww img "$wallpaper_path" --transition-type outer --transition-fps 30 --transition-duration 2

# Optional: reload Waybar and other applications that depend on pywal's theme
# killall -SIGUSR1 waybar
