#!/bin/bash

mute=$(pactl get-source-mute 2)

if [ "$mute" == "Mute: yes" ]; then
    pactl set-source-mute 2 off
else
    pactl set-source-mute 2 on
fi

exit 0

