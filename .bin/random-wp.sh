#/bin/bash

random_wp=$(find $HOME/Pictures/Wallpapers -type f | sort -R | tail -1)
feh --no-fehbg --bg-fill "$random_wp"

