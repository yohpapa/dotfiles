#!/usr/bin/env bash
#                               _            _          _
#  ___  ___ _ __ ___  ___ _ __ | | ___   ___| | __  ___| |__
# / __|/ __| '__/ _ \/ _ \ '_ \| |/ _ \ / __| |/ / / __| '_ \
# \__ \ (__| | |  __/  __/ | | | | (_) | (__|   < _\__ \ | | |
# |___/\___|_|  \___|\___|_| |_|_|\___/ \___|_|\_(_)___/_| |_|

 # Path for the temporary blurred screenshot

# Path for the temporary blurred screenshot
SOURCE_IMG="$(cat ~/.cache/wal/wal)"
TARGET_IMG="/tmp/target.png"


# Pull colors from pywal (using shell expansion)
# Note: This assumes pywal is active
COLOR1=$(sed -n '2p' ~/.cache/wal/colors) # A primary accent

# Blur the image using ImageMagick
# # 0x8 is the blur intensity; increase 8 for more blur
magick $SOURCE_IMG -blur 0x8 $TARGET_IMG

# Lock the screen using your existing swaylock
swaylock -i $TARGET_IMG \
  --indicator-radius 100 \
  --indicator-thickness 10 \
  --ring-color $COLOR1 \
  --key-hl-color ffffff \
  --inside-color 00000088 \
  --line-color 00000000 \
  --separator-color 00000000 \
  -efF

rm $TARGET_IMG

