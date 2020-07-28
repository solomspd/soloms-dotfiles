#!/bin/sh
tmpbg='/tmp/lockscreen.png' 
icon='/home/solom/.scripts/lock.png'

escrotum "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop

dunstify "DUNST_COMMAND_PAUSE"

i3lock -u -i "$tmpbg"

dunstify "DUNST_COMMAND_RESUME"
