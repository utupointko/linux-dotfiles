#!/bin/sh


##
# Shell script that:
# compiles and runs ada files
##
# by @utupointko - © 2021 Arslan Abdizhalilov
##



# Message List
##
help_message="Usage: ada [FILE]"

# Variables
##
CPATH=`pwd`
FILE=$1;
readarray -d . -t file <<< $FILE;

# Functions
##
function clear () {
    if ls $CPATH/*.ali 1> /dev/null 2>&1; then
        rm *.ali; rm *.o;
    fi
}

function build_and_run() {
    printf "BUILD:\n"; gnatmake $FILE && clear && printf "RUN:\n" && "./$file"; clear;
    if [ -f $file ]; then
         rm $file;
    fi
}

# Print help message if arguments are not given
if [ "$#" -ne 1 ]; then
    echo "$help_message"
fi

# Interface
##
while [ -n "$1" ]; do

    if [ -f $FILE ]; then
        build_and_run
    else
        "File $FILE does not exist."
    fi

    shift

done
