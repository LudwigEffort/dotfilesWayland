#!/usr/bin/bash

wallpaper="$HOME/pictures/wallpapers/bulbs.jpg "
swww="swww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"

#swww query || swww-daemon && $swww $wallpaper $effect &

swww query || swww-daemon && $swww "$wallpaper" $effect &

# Cursor
hyprctl setcursor Bibata-Modern-Ice 24 &

# waybar
waybar -c "$HOME/.config/waybar/config" -s "$HOME/.config/waybar/style.css" &

# Themes
./"$HOME/.local/bin/gtkthemes" &

# foot daemon
foot --server &

# emacs daemon
#emacs --daemon &

# screen lock
#swayidle -w timeout 300 'swaylock -f' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &

# cliphist
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store & #Store only image data

# Wallpaper
#swww query || swww-daemon && swww img pictures/wallpapers/bulbs.jpg --transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 20 &
