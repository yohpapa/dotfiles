#!/usr/bin/env bash
#                               _            _          _
#  ___  ___ _ __ ___  ___ _ __ | | ___   ___| | __  ___| |__
# / __|/ __| '__/ _ \/ _ \ '_ \| |/ _ \ / __| |/ / / __| '_ \
# \__ \ (__| | |  __/  __/ | | | | (_) | (__|   < _\__ \ | | |
# |___/\___|_|  \___|\___|_| |_|_|\___/ \___|_|\_(_)___/_| |_|

# Path for the temporary blurred screenshot
IMAGE=/tmp/screen_lock.png

# 1. Take a screenshot
grim $IMAGE

# 2. Blur the image using ImageMagick
# 0x8 is the blur intensity; increase 8 for more blur
magick $IMAGE -blur 0x8 $IMAGE

# 3. Lock the screen using your existing swaylock
swaylock -i $IMAGE \
  --indicator-radius 100 \
  --indicator-thickness 10 \
  --ring-color 8833ff \
  --key-hl-color ffffff \
  --inside-color 00000088 \
  --line-color 00000000 \
  --separator-color 00000000 \
  -efF

# 4. Optional: remove the image after unlocking
rm $IMAGE
