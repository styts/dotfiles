#!/bin/bash
# Written by Jarett Stevens

# sudo visudo
# Cmnd_Alias	BRIGHTNESS = /sys/class/backlight/gmux_backlight/brightness
# ALL ALL=NOPASSWD: BRIGHTNESS

BACKLIGHT_SYS_DIR="/sys/class/backlight/gmux_backlight"
MAX_BRIGHTNESS="`cat ${BACKLIGHT_SYS_DIR}/max_brightness`"
CURR_BRIGHTNESS="`cat ${BACKLIGHT_SYS_DIR}/brightness`"

case "${1}" in
	  up) DELTA="+ 10" ;;
	down) DELTA="- 10" ;;
	   *) exit 1 ;;
esac 

NEW_BRIGHTNESS=`echo "${CURR_BRIGHTNESS} ${DELTA}" | bc`

if test ${NEW_BRIGHTNESS} -lt 1 -o ${NEW_BRIGHTNESS} -gt ${MAX_BRIGHTNESS}
	then
	exit 1
else
	echo ${NEW_BRIGHTNESS} > ${BACKLIGHT_SYS_DIR}/brightness 
fi

exit 0
