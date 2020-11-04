#!/bin/sh


##
# Shell script that:
# does certain actions with given bluetooth device
# variable must be set (mac-adress)
##
# by @utupointko - © 2020 Arslan Abdizhalilov
##



# Message List
##
help_message="
Usage: btooth [OPTION] or btooth

Arguments:  -p or pair          pair with device
            -c or connect       connect to device
            -d or disconnect    disconnect from device
            -r or reconnect     reconnect to device
            -h or --help        display this help and exit
"

invalid_message="
btooth: invalid option
Try 'btooth --help' for more information.
"

# Variables
##
device="4C:6B:E8:26:D3:D6"

# Print help message if arguments are not given
if [ "$#" -ne 1 ]; then
    echo "$help_message"
fi

# Interface
##
while [ -n "$1" ]; do

    case "$1" in

        -p | pair ) 
            bluetoothctl -- pair $device
            sleep 10
            bluetoothctl -- trust $device
            bluetoothctl -- connect $device
            sleep 5
            break ;;

        -c | connect ) 
            bluetoothctl -- connect $device
            break ;;
            
        -d | disconnect )
            bluetoothctl -- disconnect
            break ;;
        
        -r | reconnect )
            bluetoothctl -- disconnect
            bluetoothctl -- connect $device
            break ;;

        -h | --help )
            echo "$help_message"; break ;;

        *) 
            echo "$invalid_message"; break ;;

    esac
    
    shift

done
