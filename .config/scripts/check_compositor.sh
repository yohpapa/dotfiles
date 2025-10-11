#!/usr/bin/env bash

#       _               _                                           _ _                 _
#   ___| |__   ___  ___| | __    ___ ___  _ __ ___  _ __   ___  ___(_) |_ ___  _ __ ___| |__
#  / __| '_ \ / _ \/ __| |/ /   / __/ _ \| '_ ` _ \| '_ \ / _ \/ __| | __/ _ \| '__/ __| '_ \
# | (__| | | |  __/ (__|   <   | (_| (_) | | | | | | |_) | (_) \__ \ | || (_) | | _\__ \ | | |
#  \___|_| |_|\___|\___|_|\_\___\___\___/|_| |_| |_| .__/ \___/|___/_|\__\___/|_|(_)___/_| |_|
#                          |_____|                 |_|

# Check if the session type is Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  # Check for Hyprland's instance signature
  if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    echo "hyprland"
  # Check for a running niri process
  elif pgrep -x niri > /dev/null; then
    echo "niri"
  # Add checks for other compositors here
  elif pgrep -x sway > /dev/null; then
    echo "sway"
  # Fallback for generic Wayland sessions
  else
    echo "A Wayland compositor is running, but it is not explicitly detected."
  fi
else
  # Handle non-Wayland sessions, such as X11
  echo "Not a Wayland session."
fi

