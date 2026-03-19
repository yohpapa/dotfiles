#!/usr/bin/env bash

#            _                 _                               _                                        _                  _      ____        _
#  _ __ ___ (_) __ _ _ __ __ _| |_ ___     __      _____  _ __| | _____ _ __   __ _  ___ ___  ___      | |_ ___         __| |_ __|___ \   ___| |__
# | '_ ` _ \| |/ _` | '__/ _` | __/ _ \____\ \ /\ / / _ \| '__| |/ / __| '_ \ / _` |/ __/ _ \/ __|_____| __/ _ \ _____ / _` | '_ \ __) | / __| '_ \
# | | | | | | | (_| | | | (_| | ||  __/_____\ V  V / (_) | |  |   <\__ \ |_) | (_| | (_|  __/\__ \_____| || (_) |_____| (_| | |_) / __/ _\__ \ | | |
# |_| |_| |_|_|\__, |_|  \__,_|\__\___|      \_/\_/ \___/|_|  |_|\_\___/ .__/ \__,_|\___\___||___/      \__\___/       \__,_| .__/_____(_)___/_| |_|
#              |___/                                                   |_|                                                  |_|

# Move all workspaces from eDP-1 to DP-2

export WAYLAND_DISPLAY=wayland-1
export XDG_RUNTIME_DIR=/run/user/$(id -u kensuke)

# Dynamically find the external monitor
external=$(niri msg outputs | grep '^Output' | grep -v 'eDP-1' | awk -F'"' '{print $2}' | head -1)

if [[ -z "$external" ]]; then
    echo "No external monitor found, aborting."
    exit 1
fi

echo "Migrating workspaces from eDP-1 to $external"

workspaces=$(niri msg workspaces)
in_edp1=false

while IFS= read -r line; do
  if echo "$line" | grep -q "eDP-1"; then
    in_edp1=true
    continue
  fi
  if echo "$line" | grep -q "Output"; then
    in_edp1=false
    continue
  fi
  if $in_edp1; then
    ws_idx=$(echo "$line" | awk '{print $NF}')
    if [[ -n "$ws_idx" ]]; then
      niri msg action focus-workspace "$ws_idx"
      niri msg action move-workspace-to-monitor "$external"
      niri msg action focus-workspace "$ws_idx"
    fi
  fi
done <<< "$workspaces"

