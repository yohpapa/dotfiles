#!/usr/bin/env bash
#                                   _           _         _
#  ___  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_   ___| |__
# / __|/ __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __| / __| '_ \
# \__ \ (__| | |  __/  __/ | | \__ \ | | | (_) | |_ _\__ \ | | |
# |___/\___|_|  \___|\___|_| |_|___/_| |_|\___/ \__(_)___/_| |_|
#

use_swappy=false
capture_active_window=false

# Process command-line options
while getopts "sw" opt; do
  case $opt in
    s)
      use_swappy=true
      ;;
    w)
      capture_active_window=true
      ;;
    \?) # Handle unrecognized options
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

compositor=$(~/.config/scripts/check_compositor.sh)
temp_file=$(mktemp --suffix=.png)

target_window_addr=""
window_geometry=""
if [ "$capture_active_window" = true ]; then
  if [ "$compositor" = "hyprland" ]; then
    target_window_addr=$(hyprctl activewindow -j | jq -r '.address')
    window_geometry=$(hyprctl clients -j | jq -r --arg addr "$target_window_addr" 'map(select(.address == $addr)) | .[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    grim -g "$window_geometry" - > "$temp_file"
  elif [ "$compositor" = "niri" ]; then
    selected_window_id=$(niri msg --json pick-window | jq -r '.id')
    niri msg action screenshot-window --id="$selected_window_id" --write-to-disk=false
    sleep 0.1
    wl-paste -t image/png > "$temp_file"
  fi
else
  grim -g "$(slurp -d)" -> "$temp_file"
fi

# Process the screenshot based on the option
if [ "$use_swappy" = true ]; then
  swappy -f "$temp_file" & disown
  notify-send \
      -i "$temp_file" \
      "Screenshot Captured" \
      "Specified window sent to Swappy."
else
  wl-copy --type image/png < "$temp_file"
  notify-send \
      -i "$temp_file" \
      "Screenshot Copied" \
      "Specified window copied to clipboard."
fi
 
sleep 1 && rm "$temp_file"
