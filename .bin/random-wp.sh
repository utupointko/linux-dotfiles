#!/bin/sh


##
# Shell script that sets:
#   - next
#   - previous
# wallpaper from given directory
##
# by @utupointko - © 2020 Arslan Abdizhalilov
##



# Wallpaper directory path
##
WP_PATH=$HOME/Pictures/Wallpapers
DB=/tmp/.fehbg

# Message List
##
help_message="
Usage: random-wp [OPTION]

Arguments:  -n or next          set random wallpaper
            -p or previous      set previous wallpaper
            -h or --help        display this help and exit
"

invalid_message="
random-wp: invalid option
Try 'random-wp --help' for more information.
"

# Functions
##
function set_next() {
    random_wp=$(find $WP_PATH -type f | sort -R | tail -1)
    feh --no-fehbg --bg-fill "$random_wp"
    echo $random_wp >> $DB
}

function set_previous() {
    prev_wp=`tail -n 2 $DB | head -n 1`
    feh --no-fehbg --bg-fill "$prev_wp"
    echo $prev_wp >> $DB
}

# Print help message if arguments are not given
if [ "$#" -ne 1 ]; then
    echo "$help_message"
fi

# Interface
##
while [ -n "$1" ]; do

    case "$1" in

        -n | --next )
            set_next; break ;;

        -p | --previous )
            set_previous; break ;;

        -h | --help )
            echo "$help_message"; break ;;

        *)
            echo "$invalid_message"; break ;;

    esac

    shift

done
