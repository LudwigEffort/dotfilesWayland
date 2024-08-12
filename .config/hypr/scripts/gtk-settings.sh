#!/bin/bash

## Set GTK Themes, Icons, Cursor and Fonts

THEME='Gruvbox-Dark'
ICON='Gruvbox-Plus-Dark'
FONT='JetBrains Mono 14'
CURSOR='Bibata-Modern-Ice'

SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes(){
    ${SCHEMA} gtk-theme "$THEME"
    ${SCHEMA} icon-theme "$ICON"
    ${SCHEMA} cursor-theme "$CURSOR"
    ${SCHEMA} font-name "$FONT"
}

apply_themes
