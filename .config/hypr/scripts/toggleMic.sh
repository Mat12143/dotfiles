mute=$(pactl get-source-mute 1)

if [ "$mute" == "Mute: yes" ]; then
    pactl set-source-mute 1 off
else
    pactl set-source-mute 1 on
fi

exit 0

