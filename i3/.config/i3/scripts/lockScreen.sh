#!/bin/sh

greet="Welcome back, Sir!"
correct="yey!"
color="ffffff"
wrong_pass="WRONG"
font="JetBrains Mono"
background="$HOME/dotfiles/wallpapers/10.jpg"

i3lock \
  -C \
  -f \
  --nofork \
  --ignore-empty-password \
  --indicator \
  --ringver-color=$color \
  --ringwrong-color=$color \
  --bshl-color=$color \
  --keyhl-color=$color \
  -i $background