#!/bin/sh

pgrep i3lock && exit 0

tmpbg='/tmp/lockscreen.png' 
icon='/home/solom/.scripts/lock.png'

maim "$tmpbg" # take screenshot
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg" # pixilate screenshot
# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
# pause music
playerctl -a pause

# pause notifications
dunstify "DUNST_COMMAND_PAUSE"

i3lock -n -u -i "$tmpbg"

# resume notifications
dunstify "DUNST_COMMAND_RESUME")

