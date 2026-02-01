#!/usr/bin/env bash

#             __ _                                                                          _
#  _ __ ___  / _(_)      _ __   _____      _____ _ __      _ __ ___   ___ _ __  _   _   ___| |__
# | '__/ _ \| |_| |_____| '_ \ / _ \ \ /\ / / _ \ '__|____| '_ ` _ \ / _ \ '_ \| | | | / __| '_ \
# | | | (_) |  _| |_____| |_) | (_) \ V  V /  __/ | |_____| | | | | |  __/ | | | |_| |_\__ \ | | |
# |_|  \___/|_| |_|     | .__/ \___/ \_/\_/ \___|_|       |_| |_| |_|\___|_| |_|\__,_(_)___/_| |_|
#                       |_|

compositor=$(~/.config/scripts/check-compositor.sh)
choosen=$(printf "🔐 Lock\n🔄 Reboot\n🔌 Shutdown\n🚪 Log Out" | rofi -dmenu -i -lines 4 -no-fixed-num-lines -theme-str 'window {width: 20%;}') 

case "$choosen" in
	"🔐 Lock") hyprlock ;;
	"🔄 Reboot") reboot ;;
	"🔌 Shutdown") poweroff ;;
	"🚪 Log Out")
    if [ "$compositor" = "hyprland" ]; then
      hyprctl dispatch exit
    elif [ "$compositor" = "niri" ]; then
      niri msg action quit
    fi
    ;;
	*) exit 1 ;;
esac
