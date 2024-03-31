#!/usr/bin/env bash

TARGET=~/.config/i3/backgrounds/wall.jpg

feh --bg-fill $TARGET
betterlockscreen --update $TARGET --fx
