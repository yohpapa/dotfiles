#!/usr/bin/env bash

#                            _       _   _                                                   _                       _
#  _ __  _   ___      ____ _| |     | |_| |__   ___ _ __ ___   ___       _ __ __ _ _ __   __| | ___  _ __ ___    ___| |__
# | '_ \| | | \ \ /\ / / _` | |_____| __| '_ \ / _ \ '_ ` _ \ / _ \_____| '__/ _` | '_ \ / _` |/ _ \| '_ ` _ \  / __| '_ \
# | |_) | |_| |\ V  V / (_| | |_____| |_| | | |  __/ | | | | |  __/_____| | | (_| | | | | (_| | (_) | | | | | |_\__ \ | | |
# | .__/ \__, | \_/\_/ \__,_|_|      \__|_| |_|\___|_| |_| |_|\___|     |_|  \__,_|_| |_|\__,_|\___/|_| |_| |_(_)___/_| |_|
# |_|    |___/

source "${HOME}/.config/hypr/scripts/mako-config.sh"

walpaper_directory=$HOME/pictures/wallpapers
wallpaper_path=$(find "$walpaper_directory" -type f -print0 | shuf -z -n 1)

if [[ -z "$wallpaper_path" ]]; then
  echo "Usage: $0 /path/to/your/wallpaper.png"
  exit 1
fi

wal -i "$wallpaper_path" -t -s
swww img "$wallpaper_path" --transition-type outer --transition-fps 30 --transition-duration 2
update_mako_config

notify-send -i "$wallpaper_path" "The wallpaper has changed!"
