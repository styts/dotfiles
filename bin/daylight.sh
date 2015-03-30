#!/bin/zsh

h=`date +%H`

if [[ $h -gt 2 && $h -lt 18 ]]; then
  export DAYLIGHT="true"
else
  export DAYLIGHT="false"
fi
