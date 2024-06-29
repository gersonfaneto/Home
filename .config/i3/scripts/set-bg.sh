#!/usr/bin/env bash

if [[ ! -d "$HOME/.config/i3/backgrounds/" ]]; then
  mkdir -p "$HOME/.config/i3/backgrounds/"
fi

case $1 in
  solid)
    TARGET="$HOME/.config/i3/backgrounds/solid.jpg"
    ;;
  wall)
    TARGET="$HOME/.config/i3/backgrounds/wall.jpg"
    ;;
  auto)
    if [[ -f "$HOME/.config/i3/backgrounds/wall.jpg" ]]; then
      TARGET="$HOME/.config/i3/backgrounds/wall.jpg"
    else
      if [[ ! -f "$HOME/.config/i3/backgrounds/solid.jpg" ]]; then
        convert -size 1920x1080 xc:black "$HOME/.config/i3/backgrounds/solid.jpg" 
      fi
      TARGET="$HOME/.config/i3/backgrounds/solid.jpg"
    fi
    ;;
  *)
    echo "Operation not supported!"
    exit 1
    ;;
esac

feh --bg-fill $TARGET
betterlockscreen --update $TARGET --fx
