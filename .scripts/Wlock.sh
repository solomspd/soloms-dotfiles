#!/bin/bash

pgrep swaylock && exit 0 # check screen isnt already locked

icon='/home/solom/.scripts/lock.png'

# loop over every display
for OUTPUT in `swaymsg -t get_outputs | jq -r '.[].name'`
do
    IMAGE=/tmp/$OUTPUT-lock.png
    grim -o $OUTPUT $IMAGE
    convert $IMAGE -scale 4% -scale 2500%  - | composite -gravity center $icon - $IMAGE
    LOCKARGS="${LOCKARGS} --image ${OUTPUT}:${IMAGE}"
    IMAGES="${IMAGES} ${IMAGE}"
done

# pause music
playerctl -a pause

# pause notifications
dunstctl set-paused true

# lock screen with generated screenshot
#swaylock --indicator-radius 100 --text-color=ffffff00 --inside-color=ffffff1c --ring-color=ffffff3e --line-color=ffffff00 --key-hl-color=00000080 --ring-ver-color=00000000 --inside-ver-color=0000001c --ring-wrong-color=00000055 --inside-wrong-color=0000001c  $LOCKARGS
swaylock -f -u $LOCKARGS

rm $IMAGES

# resume notifications
dunstctl set-paused false
