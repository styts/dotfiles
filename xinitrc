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

# remap CAPSLOCK to ESCAPE
setxkbmap -option caps:escape -option grp:alt_shift_toggle us,ru

# set the key repeat rates
xset r rate 200 30

# this tool should unify the two clipboards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# put the tilde where it belongs
xmodmap -e 'keycode 94 = grave asciitilde grave asciitilde'

# load ~/.xbindkeysrc for shortcuts for audio control, etc.
xbindkeys

# start the window manager
exec i3
