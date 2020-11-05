#!/bin/sh


##
# Shell script that:
# screenshots desktop in different modes
#	- fullscreen
#	- window
#	- select area
##
# by @utupointko - © 2020 Arslan Abdizhalilov
##



_conf=$HOME/.config/screenshot.conf

if ! [ -f $_conf ]; then
	echo "scrot_dir=$(xdg-user-dir PICTURES)" > $_conf
fi

source $_conf

if ! [ -d $scrot_dir ]; then
	mkdir -p $scrot_dir
fi

if ! [[ -z "$2" ]]; then
    cmd="scrot -d $2"
else
    cmd='scrot'
fi

# Message List
##
help_message="
Usage: screenshot [OPTION] or screenshot:

Arguments:	-d | --desk    full screen
			-w | --window  active window
			-s | --select  selection
			-h | --help    display this information

The -d or -w options can be used with a delay
by adding the number of seconds, like for example:
'screenshot -w 5'

Default option is 'full screen'.

The file destination can be set in ${_conf}.
Default is $scrot_dir
"

invalid_message="
screenshot: invalid option
Try 'screenshot --help' for more information.
"

# Interface
##
case "$1" in

	--desk | -d | $NULL)
		cd $scrot_dir
	        $cmd &&
		sleep 1 &&
		notify-send "screenshot has been saved in $scrot_dir"
		break ;;

	--window | -w)
		cd $scrot_dir
		$cmd -u &&
		sleep 1 &&
		notify-send "screenshot has been saved in $scrot_dir"
		break ;;

	--select | -s)
		cd $scrot_dir
		notify-send 'select an area for the screenshot' &
		scrot -s &&
		sleep 1 && notify-send "screenshot has been saved in $scrot_dir"
		break ;;

	--help | -h)
		echo "$help_message"; break ;;

	*)
		echo "$invalid_message"; break ;;

esac
