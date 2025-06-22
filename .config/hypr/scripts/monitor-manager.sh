#!/bin/bash

LOG_FILE="$HOME/monitor_debug_log.txt"
DEFAULT_CONFIG="/home/ludwig/.config/hypr/configs/monitors/default.conf"
EXTERNAL_CONFIG="/home/ludwig/.config/hypr/configs/monitors/external.conf"
PLACEHOLDER="/home/ludwig/.config/hypr/configs/monitor.conf"

EXTERNAL_MONITOR=$(hyprctl monitors | grep -E "DP-1|DP-2|HDMI-A-2" | grep -v "eDP-1" | awk '{print $2}' | head -n 1)
LID_STATE=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')

echo "---------------------------------" >> "$LOG_FILE"
echo "$(date) - Controllo stato monitor e coperchio" >> "$LOG_FILE"
echo "EXTERNAL_MONITOR: $EXTERNAL_MONITOR" >> "$LOG_FILE"
echo "LID_STATE: $LID_STATE" >> "$LOG_FILE"

if [[ -n "$EXTERNAL_MONITOR" && "$LID_STATE" == "closed" ]]; then
    echo "Monitor esterno rilevato + coperchio chiuso" >> "$LOG_FILE"
    echo "source = $EXTERNAL_CONFIG" > "$PLACEHOLDER"
    echo "Configurazione esterna attivata" >> "$LOG_FILE"
else
    echo "Attivazione monitor interno" >> "$LOG_FILE"
    echo "source = $DEFAULT_CONFIG" > "$PLACEHOLDER"
    touch "$HOME/test1.txt"
    echo "Configurazione predefinita attivata" >> "$LOG_FILE"
fi

echo "Contenuto di PLACEHOLDER: " >> "$LOG_FILE"
echo "---------------------------------" >> "$LOG_FILE"

hyprctl reload
