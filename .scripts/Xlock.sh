#!/bin/bash

pgrep i3lock && exit 0

tmpbg='/tmp/lockscreen.png' 
icon='/home/solom/.scripts/lock.png'

maim "${tmpbg}" # take screenshot
convert "${tmpbg}" -scale 10% -scale 1000% "${tmpbg}" # pixilate screenshot

screen=$(xrandr | grep -Eow '([0-9]*x[0-9]*\+[0-9]*\+[0-9]*)' | xargs)
read -ra screen <<< "${screen}"
icon_dim=$(convert ".scripts/lock.png" -print "%wx%h\n" /dev/null)
IFS='x' read -ra icon_dim <<< "${icon_dim}"

for i in "${screen[@]}"; do # i[1] = w px; i[2] = h px; i[3] = x offset; i[4] = y offset
	IFS='x|+' read -ra i <<< "${i}"
	newx=$((i[2] + i[0]/2 - icon_dim[0]/2))
	newy=$((i[3] + i[1]/2 - icon_dim[1]/2))
	convert "${tmpbg}" "${icon}" -geometry "+${newx}+${newy}" -composite -matte "${tmpbg}"
done

# pause music
playerctl -a pause

# pause notifications
dunstify "DUNST_COMMAND_PAUSE"

i3lock -n -u -i "${tmpbg}"

# resume notifications
dunstify "DUNST_COMMAND_RESUME"
