#!/usr/bin/env bash
#             __ _                    _ _                                       _
#  _ __ ___  / _(_)    __      ____ _| | |_ __   __ _ _ __   ___ _ __ ___   ___| |__
# | '__/ _ \| |_| |____\ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__/ __| / __| '_ \
# | | | (_) |  _| |_____\ V  V / (_| | | | |_) | (_| | |_) |  __/ |  \__ \_\__ \ | | |
# |_|  \___/|_| |_|      \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|  |___(_)___/_| |_|
#                                        |_|         |_|

DIR_TO_SHOW=$HOME"/pictures/wallpapers"
THUMB_DIR=$HOME"/.cache/rofi_thumbs"
THUMB_SIZE="256x256"
ROFI_INPUT=""

mkdir -p "$THUMB_DIR"

mapfile -d '' -t imageFiles < <(find "$DIR_TO_SHOW" -maxdepth 2 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) -print0)

for imageFile in "${imageFiles[@]}"; do
  BASENAME=$(basename "$imageFile")
  THUMB_FILE="$THUMB_DIR/$BASENAME.png"

  if [[ ! -f "$THUMB_FILE" || "$imageFile" -nt "$THUMB_FILE" ]]; then
    # echo "Generating thumbnail for $BASENAME..." >&2 
    magick "$imageFile" -strip -thumbnail "$THUMB_SIZE" "$THUMB_FILE"
  fi

  ROFI_INPUT+="$BASENAME\0icon\x1f$THUMB_FILE\0info\x1f$imageFile\n"
done

SELECTED_PATH=$(echo -en "$ROFI_INPUT" | rofi -dmenu -i -show-icons -theme ~/.config/rofi/preview.rasi)
if [ -n "$SELECTED_PATH" ]; then
  $HOME/.config/scripts/set-pywal-theme.sh $DIR_TO_SHOW/$SELECTED_PATH
fi

