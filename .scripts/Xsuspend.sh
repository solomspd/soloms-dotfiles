#!/bin/sh
~/.scripts/Xlock.sh & (sleep 5s && systemctl suspend) # sleep a bit to give locking script enough time to finish

nvidia-settings -l # X11 sometimes doesn't like waking up from suspend so force a display settings refresh
