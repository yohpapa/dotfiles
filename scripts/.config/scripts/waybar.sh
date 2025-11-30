#!/usr/bin/env bash

#                      _                    _
# __      ____ _ _   _| |__   __ _ _ __ ___| |__
# \ \ /\ / / _` | | | | '_ \ / _` | '__/ __| '_ \
#  \ V  V / (_| | |_| | |_) | (_| | | _\__ \ | | |
#   \_/\_/ \__,_|\__, |_.__/ \__,_|_|(_)___/_| |_|
#                |___/

compositor=$(~/.config/scripts/check-compositor.sh)
config_dir="$HOME/.config/waybar"
source_config=""

if [ "$compositor" = "hyprland" ]; then
  source_config="$config_dir/config-hyprland.jsonc"
elif [ "$compositor" = "niri" ]; then
  source_config="$config_dir/config-niri.jsonc"
fi

if [ ! -f "$source_config" ]; then
    echo "Error: Config file not found: $source_config"
    exit 1
fi

ln -sf "$source_config" "$config_dir/config.jsonc"

waybar &
