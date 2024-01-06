#!/usr/bin/env bash

FONTS_DIRECTORY="$HOME/.local/share/fonts/YADR/"
KITTY_DIRECTORY="$HOME/.config/kitty/"

DEFAULT_FONT="Writer"
FONTS_FILE="$KITTY_DIRECTORY/extras/fonts.conf"

AVAILABLE_FONTS=$(find "${FONTS_DIRECTORY}" -mindepth 1 -type d | xargs -I {} basename {})
IFS=$'\n'

FONTS=$(echo "$AVAILABLE_FONTS" | sort | cut -d "." -f 2)

if [ -f "$FONTS_FILE" ]; then
  echo -n "" > "$FONTS_FILE"
else
  touch "$FONTS_FILE"
fi

for font in $FONTS; do
  if [ "$font" = "$DEFAULT_FONT" ]; then
    echo "font_family                 $font" >> "$FONTS_FILE"
  else
    echo "# font_family                 $font" >> "$FONTS_FILE"
  fi
done
