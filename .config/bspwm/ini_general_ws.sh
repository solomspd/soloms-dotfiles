#!/bin/sh

get_class() {
	id=$1
	if [ -z "$id" ]; then
		echo ""
	else
		xprop -id "$id" | sed -n '/WM_CLASS/s/.*, "\(.*\)"/\1/p'
	fi
}

bspc subscribe node_add | while read -r add
do
	id=$(echo "$add" | awk '{print $5}')
	class="$(get_class "$id")"
	bspc query 
	if [ "$class" -eq "discord|Spotify|Thunderbird|Steam" ]; then

