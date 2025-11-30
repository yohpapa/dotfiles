#!/usr/bin/env bash

#       _               _         _   _                               _
#   ___| |__   ___  ___| | __    | |_| |__   ___ _ __ ___   ___   ___| |__
#  / __| '_ \ / _ \/ __| |/ /____| __| '_ \ / _ \ '_ ` _ \ / _ \ / __| '_ \
# | (__| | | |  __/ (__|   <_____| |_| | | |  __/ | | | | |  __/_\__ \ | | |
#  \___|_| |_|\___|\___|_|\_\     \__|_| |_|\___|_| |_| |_|\___(_)___/_| |_|

DARK_SCRIPT="$HOME/.config/scripts/dark-theme.sh"
LIGHT_SCRIPT="$HOME/.config/scripts/light-theme.sh"

HOUR=$(date +%H)

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 19 ]; then
  exec "$LIGHT_SCRIPT"
else
  exec "$DARK_SCRIPT"
fi

