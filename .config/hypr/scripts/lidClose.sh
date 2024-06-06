nrDisplays=$(xrandr | awk '/ connected/ {count++} END {print count}')

if [[ "$nrDisplays" -eq 1 ]]; then
    systemctl suspend
else
    hyprctl keyword monitor "eDP-1, disable"
fi
