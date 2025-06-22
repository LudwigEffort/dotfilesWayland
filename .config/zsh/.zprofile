# Autostart Hyprland at Login
MONITOR_MANAGER="$HOME/.config/hypr/scripts/monitor-manager.sh"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        "$MONITOR_MANAGER"
        if uwsm check may-start; then
                exec uwsm start hyprland.desktop
        fi
fi
