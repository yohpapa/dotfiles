#/usr/bin/env bash

#  _ _       _     _        _   _                               _
# | (_) __ _| |__ | |_     | |_| |__   ___ _ __ ___   ___   ___| |__
# | | |/ _` | '_ \| __|____| __| '_ \ / _ \ '_ ` _ \ / _ \ / __| '_ \
# | | | (_| | | | | ||_____| |_| | | |  __/ | | | | |  __/_\__ \ | | |
# |_|_|\__, |_| |_|\__|     \__|_| |_|\___|_| |_| |_|\___(_)___/_| |_|
#      |___/

DCONF_PATH=$(command -v dconf)
if [ -n "$DCONF_PATH" ]; then
  "$DCONF_PATH" write /org/gnome/desktop/interface/color-scheme \'"prefer-light"\'
fi

