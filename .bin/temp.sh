#!/bin/sh

message="
Usage: temp [OPTION]

Mandatory arguments:  -l or list        list all temporary directories
                      -c or create      create a temporary directory
"

while [ -n "$1" ]; do

    case "$1" in

        -l | list) 
            ls -d /tmp/code-* 
            break ;;
        -d | create ) 
            tmp_dir=$(mktemp -d -t code-$(date +%Y-%m-%d-%H-%M-%S)-XXXXXXXXXX)
            code $tmp_dir 
            break ;;
            
        *) 
            echo "$message"
            break ;;

    esac
    
    shift

done

if [ "$#" -ne 1 ]; then
    echo "$message"
fi
