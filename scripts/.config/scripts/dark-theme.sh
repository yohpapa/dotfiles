#!/usr/bin/env bash

#      _            _         _   _                               _
#   __| | __ _ _ __| | __    | |_| |__   ___ _ __ ___   ___   ___| |__
#  / _` |/ _` | '__| |/ /____| __| '_ \ / _ \ '_ ` _ \ / _ \ / __| '_ \
# | (_| | (_| | |  |   <_____| |_| | | |  __/ | | | | |  __/_\__ \ | | |
#  \__,_|\__,_|_|  |_|\_\     \__|_| |_|\___|_| |_| |_|\___(_)___/_| |_|

DCONF_PATH=$(command -v dconf)
if [ -n "$DCONF_PATH" ]; then
  "$DCONF_PATH" write /org/gnome/desktop/interface/color-scheme \'"prefer-dark"\'
fi

