#!/bin/bash

pgrep swaylock && exit 0 # check screen isnt already locked

tmpbg='/tmp/lockscreen.png' 
icon='/home/solom/.scripts/lock.png'

grim "${tmpbg}" # take screenshot
convert "${tmpbg}" -scale 10% -scale 1000% "${tmpbg}" # pixilate screenshot

old_IFS="${IFS}" # to restore IFS when we're done manipulating it for good measure

icon_dim=$(convert ".scripts/lock.png" -print "%wx%h\n" /dev/null) # get dimentions of lock icon
IFS='x' read -ra icon_dim <<< "${icon_dim}" # turn dimentions into array

# Loop over each monitor, get coordinates to center lock icon and composite it onto screenshot
for i in $(swaymsg -t get_outputs | jq -r '.[] | @base64'); do
	cur=$i | base64 -d | jq -r ".rect"
	newx=$(($(echo $cur | jq -r ".x") + $(echo $cur | jq -r ".width")/2 - icon_dim[0]/2))
	newy=$(($(echo $cur | jq -r ".y") + $(echo $cur | jq -r ".height")/2 - icon_dim[0]/2))
	convert "${tmpbg}" "${icon}" -geometry "+${newx}+${newy}" -composite -matte "${tmpbg}"
done


IFS="${old_IFS}" # restore IFS

exit

# pause music
playerctl -a pause

# pause notifications
dunstctl set-paused true

# lock screen with generated screenshot
swaylock -u -i "${tmpbg}"

# resume notifications
dunstctl set-paused false
