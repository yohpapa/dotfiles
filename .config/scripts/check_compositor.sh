#!/usr/bin/env bash

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

