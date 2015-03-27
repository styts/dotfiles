!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# remap CAPSLOCK to ESCAPE, set the toggle layouts
setxkbmap -option caps:escape -option grp:alt_shift_toggle us,ru

# set the key repeat rates
xset r rate 200 30

# this tool should unify the two clipboards
#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &
autocutsel -f -s PRIMARY
autocutsel -f -s CLIPBOARD
autocutsel -f -s SECONDARY

# put the tilde where it belongs
xmodmap -e 'keycode 94 = grave asciitilde grave asciitilde'

# load ~/.xbindkeysrc for shortcuts for audio control, etc.
xbindkeys

# emulate mac hot corners for screen sleeping
xdotool behave_screen_edge bottom-left \
    exec xset dpms force off &
xdotool behave_screen_edge bottom-right \
    exec xset dpms force off &

# start the window manager
exec i3
