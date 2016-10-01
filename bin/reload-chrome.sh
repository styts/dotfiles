#!/bin/sh
exec <"$0" || exit; read v; read v; exec /usr/bin/osascript - "$@"; exit

-- the above is some shell trickery that lets us write the rest of
-- the file in plain applescript

tell application "Google Chrome"
  activate
  tell application "System Events"
    tell process "Google Chrome"
      keystroke "r" using {command down, shift down}
    end tell
  end tell
end tell

tell application "Google Chrome" to activate
-- tell application "iTerm" to activate
