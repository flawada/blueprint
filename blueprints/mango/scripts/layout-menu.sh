#!/bin/bash
# MangoWC Layout Switcher
# by @bautitobal

# Requires: rofi, mmsg, notify-send

declare -A layouts=(
  ["T"]="📐 Tiling"
  ["G"]="🧱 Grid"
  ["M"]="🪟 Monocle"
  ["K"]="🧩 Deck (K)"
  ["CT"]="🎯 Center Tile"
  ["RT"]="➡️ Right Tile"
  ["VS"]="↕️ Vertical Scroller"
  ["VT"]="🧱 Vertical Tile"
  ["VG"]="🪜 Vertical Grouped"
  ["VK"]="🔠 Vertical K"
  ["S"]="🌀 Scroller"
  ["grouped"]="🗂️ Grouped"
)

menu=""
for key in "${!layouts[@]}"; do
  menu+="${layouts[$key]} ($key)\n"
done

choice=$(echo -e "$menu" | rofi -dmenu -i -p "🧩 Choose layout:" \
  -theme-str 'window {width: 18em;} listview {lines: 10;} entry {placeholder: "Type layout...";}' \
  -theme-str 'mainbox {children: [inputbar, listview]; background-color: #2e3440;}' \
  -theme-str 'element-text, entry, prompt {foreground: #d8dee9;}' \
  -theme-str 'element selected {background-color: #5e81ac;}' \
  -theme-str 'entry {placeholder-color: #81a1c1;}' \
  -theme-str 'prompt {text-color: #88c0d0;}')

[ -z "$choice" ] && exit 0

layout_code=$(echo "$choice" | awk -F'[()]' '{print $2}')

if [ -n "$layout_code" ]; then
  mmsg -s -l "$layout_code"
  notify-send "🧩 Layout changed" "Current layout: ${layouts[$layout_code]}"
else
  notify-send "⚠️ Error" "No layout selected"
fi
 -theme-str 'prompt {text-color: #88c0d0;}')

[ -z "$chosen" ] && exit

mmsg setlayout "$chosen"

notify-send "🧩 Layout changed" "Current layout: $chosen"

