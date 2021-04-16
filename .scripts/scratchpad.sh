#!/bin/sh
id=$(xdotool search --class scratchpadwin)

[ -z "$id" ] || bspc node "$id" --flag hidden -f
