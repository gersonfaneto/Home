#!/usr/bin/env bash

FILE=$1

W=$2
H=$3
X=$4
Y=$5

FILE="$1"; shift

THUMBNAIL="$(mktemp)/thumbnail.png"

preview() {
  kitty +kitten icat --silent --stdin no --transfer-mode file --place "${W}x${H}@${X}x${Y}" "$FILE" < /dev/null > /dev/tty
}

case "$(basename "$FILE" | tr '[A-Z]' '[a-z]')" in
  *.tar*) tar tf "$FILE" ;;
  *.zip) unzip -l "$FILE" ;;
  *.rar) unrar l "$FILE" ;;
  *.7z) 7z l "$FILE" ;;
  *.jpg|*.jpeg|*.png|*.bmp)
    preview "$FILE"
    ;;
  *.svg)
    convert "$FILE" "$THUMBNAIL"
    preview "$THUMBNAIL"
    ;;
  *.avi|*.mp4|*.mkv)
    ffmpeg -y -i "$FILE" -vframes 1 "$THUMBNAIL"
    preview "$THUMBNAIL"
    ;;
  *)
    bat --force-colorization --paging=never --style=changes,numbers \
      --terminal-width $(($W - 3)) "$FILE" && false
    ;;
esac

return 127
