#!/bin/sh
~/.scripts/Xlock.sh & (sleep 5s && systemctl suspend)

nvidia-settings -l
