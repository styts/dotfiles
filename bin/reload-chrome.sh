#!/bin/sh
exec <"$0" || exit; read v; read v; exec /usr/bin/osascript - "$@"; exit

-- the above is some shell trickery that lets us write the rest of
-- the file in plain applescript

tell application "Google Chrome"
  activate
  repeat with w in (windows)
    set j to 0
    repeat with t in (tabs of w)
      set j to j + 1
      if (t's URL as string) contains "http://localhost" then
        -- set active tab
        set (active tab index of w) to j
        set index of w to 1

        -- refresh page
        tell application "System Events" to tell process "Google Chrome"
          keystroke "r" using {command down, shift down}
        end tell
        return
      end if
    end repeat
  end repeat
end tell

-- tell application "Google Chrome" to activate
-- tell application "iTerm" to activate
