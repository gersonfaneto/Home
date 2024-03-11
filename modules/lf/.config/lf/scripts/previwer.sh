#!/usr/bin/env bash

FILE=$1

W=$2
H=$3
X=$4
Y=$5

FILE="$1"
shift

THUMBNAIL="$(mktemp)/thumbnail.png"

preview() {
	kitty +kitten icat --silent --stdin no --transfer-mode file --place "${W}x${H}@${X}x${Y}" \
    "$FILE" </dev/null >/dev/tty
}

case "$FILE" in
  *.avi | *.mp4 | *.mkv)
    mediainfo "$FILE"
    ;;
  *.jpg | *.jpeg | *.png | *.bmp)
    preview "$FILE"
    ;;
  *.svg)
    convert "$FILE" "$THUMBNAIL"
    preview "$THUMBNAIL"
    ;;
  *.pdf)
    pdftotext "$FILE" -
    ;;
  *.tar*)
    tar tf "$FILE"
    ;;
  *.zip)
    unzip -l "$FILE"
    ;;
  *.md)
    glow -s auto "$FILE"
    ;;
  *)
    bat --force-colorization --paging=never --style=changes,numbers --terminal-width $((W - 3)) \
      "$FILE" && false
    ;;
esac

return 127
