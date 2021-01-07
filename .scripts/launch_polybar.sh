#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
profile="bspwm"
# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar "${profile}1" 2>&1 | tee -a /tmp/polybar1.log & disown
polybar "${profile}2" 2>&1 | tee -a /tmp/polybar2.log & disown

#profile="bspwm"
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar "$profile" &
#  done
#else
#  polybar "$profile" &
#fi
