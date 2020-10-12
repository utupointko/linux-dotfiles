#!/bin/sh

message="
Usage: temp [OPTION]

Mandatory arguments:  -l    list all temporary directories
                      -c    create a temporary directory
                      "

while [ -n "$1" ]; do

    case "$1" in

        -l) 
            ls -d /tmp/ci-* 
            break ;;
        -d) 
            tmp_dir=$(mktemp -d -t ci-$(date +%Y-%m-%d-%H-%M-%S)-XXXXXXXXXX)
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
