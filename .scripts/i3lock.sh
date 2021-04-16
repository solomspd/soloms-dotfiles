#!/bin/sh
tmpbg='/tmp/lockscreen.png' 
icon='/home/solom/.scripts/lock.png'

maim "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
playerctl -a pause

#set-paused true
dunstify "DUNST_COMMAND_PAUSE"

i3lock -n -u -i "$tmpbg" && dunstify "DUNST_COMMAND_RESUME"

