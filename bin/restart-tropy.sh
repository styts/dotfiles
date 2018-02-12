#!/bin/sh
exec <"$0" || exit; read v; read v; exec /usr/bin/osascript - "$@"; exit

-- twice, this work to quit while in debug mode
do shell script "pkill -2 Electron || true"
do shell script "pkill -2 Electron || true"

tell application "iTerm2"
  activate
  -- delay 0.2
  tell current session of current window
    write text "cd ~/Projects/tropy && npm start -- ~/Documents/Art.tpy"
    tell application "System Events" to key code 36 -- enter
  end tell
end tell
