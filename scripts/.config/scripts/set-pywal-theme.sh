#!/usr/bin/env bash
#           _                                  _       _   _                               _
#  ___  ___| |_      _ __  _   ___      ____ _| |     | |_| |__   ___ _ __ ___   ___   ___| |__
# / __|/ _ \ __|____| '_ \| | | \ \ /\ / / _` | |_____| __| '_ \ / _ \ '_ ` _ \ / _ \ / __| '_ \
# \__ \  __/ ||_____| |_) | |_| |\ V  V / (_| | |_____| |_| | | |  __/ | | | | |  __/_\__ \ | | |
# |___/\___|\__|    | .__/ \__, | \_/\_/ \__,_|_|      \__|_| |_|\___|_| |_| |_|\___(_)___/_| |_|
#                   |_|    |___/

if [ $# -ne 1 ]; then
  echo "Usage: $0 /path/to/your/wallpaper.png"
  exit 1
fi

wallpaper_path=$1

# echo $wallpaper_path
wal -i "$wallpaper_path" -t -s
swww img "$wallpaper_path" --transition-type outer --transition-fps 30 --transition-duration 2
$HOME/.config/scripts/mako-config.sh
notify-send -i "$wallpaper_path" "The wallpaper has changed!"
