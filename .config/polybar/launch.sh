#!/bin/bash

sleep 2

# Terminate already running bar instances
killall -q polybar

# Set colors according to those defined by wal
source "${HOME}/.cache/wal/colors.sh"
background=$color0
foreground=$color7
tertiary=$color2
fourth=$color4

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
done


# polybar --reload main &
