#!/usr/bin/env bash

#             __ _                 _            _
#  _ __ ___  / _(_)       ___ __ _| | ___   ___| |__
# | '__/ _ \| |_| |_____ / __/ _` | |/ __| / __| '_ \
# | | | (_) |  _| |_____| (_| (_| | | (__ _\__ \ | | |
# |_|  \___/|_| |_|      \___\__,_|_|\___(_)___/_| |_|

rofi -show calc -modi calc -no-show-match -no-sort -calc-command "echo -n '{result}' | wl-copy"
