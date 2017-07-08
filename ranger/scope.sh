#!/usr/bin/env sh
# file borrowed from:
# https://unix.stackexchange.com/questions/186944/ranger-do-not-try-to-display-large-files-preview

path="$1"    # Full path of the selected file
width="$2"   # Width of the preview pane (number of fitting characters)
height="$3"  # Height of the preview pane (number of fitting characters)
maxln=54    # Stop after $maxln lines.  Can be used like ls | head -n $maxln

# Find out something about the file:
mimetype=$(file --mime-type -Lb "$path")
extension=${path##*.}

try() { output=$(eval '"$@"'); }
dump() { echo "$output"; }
trim() { head -n "$maxln"; }
hl() { command head -n "$maxln" "$path" | highlight --syntax="$extension" --out-format=ansi; test $? = 0 -o $? = 141; }

case "$mimetype" in
    # Syntax highlight for text files:
    text/* | */xml)
        #try hl && { dump | trim; exit 5; } || exit 2;;
        #try pygmentize -f 256 -O style=monokai "$path" && { dump | trim; exit 5; }
        try pygmentize -f 256 -O style=vim "$path" && { dump | trim; exit 5; }
esac
exit 1
