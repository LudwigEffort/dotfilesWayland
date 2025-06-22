#!/bin/bash

# Definizione dell'utente (modifica con il tuo nome utente)
USER="ludwig"
USER_ID=$(id -u $USER)

# Imposta le variabili d'ambiente necessarie per Hyprland
export DISPLAY=:0
export XDG_RUNTIME_DIR="/run/user/$USER_ID"

# Esegui lo script principale con l'utente corretto
sudo -u $USER /home/$USER/.config/hypr/scripts/monitor-manager.sh
