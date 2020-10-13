#!/bin/sh


##
# Shell script that:
#   - lists
#   - creates and opens with specific editor
#   - deletes
# temporary directories
##
# by @utupointko - © 2020 Arslan Abdizhalilov
##



# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

# Color Functions
##
ColorGreen() {
	echo -ne $green$1$clear
}
ColorBlue() {
	echo -ne $blue$1$clear
}
clean() {
    printf "\033c"
}

# Message List
##
help_message="
Usage: temp [OPTION] or temp

Arguments:  -l or list        list all temporary directories
            -c or create      create a temporary directory
            -r or remove      remove all temporary directories
            -h or --help      display this help and exit
"

invalid_message="
temp: invalid option
Try 'temp --help' for more information.
"

editor_message="
Open temporary directory with:
$(ColorGreen '1)') Visual Studio Code
$(ColorGreen '2)') IntelliJ IDEA
$(ColorGreen '0)') Create a directory and exit
$(ColorBlue 'Choose an option:')
"

# Functions
##
function list() {
    for d in /tmp/dir-*; do
        if [ $d != "/tmp/dir-*" ]; then
            echo $d
        else
            echo "There is no any temporary directory!"
        fi
    done
}

function create_and_open_with() {
    tmp_dir=$(mktemp -d -t dir-$(date +%Y-%m-%d-%H-%M-%S)-XXXXXXXXXX)
    clean; echo "$editor_message"
    read a
    case $a in
        1) code $tmp_dir ;;
	    2) nohup intellij-idea-ultimate-edition $tmp_dir ;;
        0) clean; exit 0 ;;
		*) clean; rmdir $tmp_dir ;;
    esac

}

function delete() {
    for d in /tmp/dir-*; do
        if [ $d != "/tmp/dir-*" ]; then
            rm -r $d;
        else
            echo "There is no any temporary directory!"
        fi
    done
}

# Print help message if arguments are not given
if [ "$#" -ne 1 ]; then
    echo "$help_message"
fi

# Interface
##
while [ -n "$1" ]; do

    case "$1" in

        -l | list ) 
            list; break ;;

        -c | create ) 
            create_and_open_with; break ;;
            
        -r | remove )
            delete; break ;;

        -h | --help )
            echo "$help_message"; break ;;

        *) 
            echo "$invalid_message"; break ;;

    esac
    
    shift

done
