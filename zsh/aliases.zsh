alias -g A='~/.oh-my-zsh/custom/aliases.zsh'
alias -g B='| pbcopy'
alias -g G='| grep -i'
alias -g GPG='EAE40466'
alias -g H='--help'
alias -g L='| less'
alias -g V='--version'
alias -g Z='~/.zshrc'
alias -g nb='node --inspect-brk'
alias -g n='node'
alias a="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias b='pbcopy'
alias c='clear'
alias cdp='cdproject'
alias d='dirs -v | head -10 | tac'
alias df='df -h'
alias ds='ds -sh'
alias du='du -h'
alias da='dark'
alias e='emacsclient'
alias f='ffind'
alias fab='nocorrect fab'
alias ffind='nocorrect ffind'

alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -va'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gl='git pull'
alias gp='git push'
alias grv='git remote --verbose'
alias gs='git status'
alias gstp='git stash pop'

alias hpt='history | tail'
alias ipy='ipython'
alias ipn="ipython notebook --pprint --pylab inline"
alias ks='ls'
alias l='less'
alias la='ls -la'
alias ll='ls -lG'
alias lls='ls'
alias ls='gls -G --color'
alias lt='ls -lat'
alias li='light'
alias lh='ls -lh'
alias m='ranger ~/Music/_Phone'
alias mdkir='mkdir'
alias mkae='make'
alias o='open'
alias oepn='open'
alias p='itermocil --here '
alias pst="pbpaste > "
alias py='python3'
alias pyhton='python3'
alias pyhttp='python -m SimpleHTTPServer'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias re='source ~/.zshrc'
alias s='rg'
alias sl='ls'
alias t='tmux'
alias ta='tmux at'
alias w='mosh wave'
alias wr='mosh root@wave'

CALS='--calendar "Work" --calendar "Sport" --calendar "Social Events" --calendar "TODO" --calendar "Personal" --calendar "Birthdays"'
alias week="gcalcli calw $CALS"
alias month="gcalcli calm $CALS"
alias event="gcalcli quick --calendar 'TODO' $@"

# git stash list, navigate with `Q`
gstl () {
    git stash list | awk -F: '{
        system("git -c color.ui=always stash show -p " $1); }'
}

# cd to python package source
cdpy () {
  cd "$(python -c "import os.path as _, ${1}; \
          print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

# history and hpg (history pipe grep) united
h () {
    if [[ $# -eq 0 ]] ; then
        history
    else
        history | egrep "$@"
    fi
}

# undo GIT merge
undo_merge () {
    git reset --merge ORIG_HEAD
}
alias git_undo_merge=undo_merge

# change profile dynamically
dark () {
    echo -e "\033]50;SetProfile=dark\a"
    export DARK=1
    echo "dark" > ~/.colorscheme
}

# change profile dynamically
light () {
    echo -e "\033]50;SetProfile=light\a"
    unset DARK
    echo "light" > ~/.colorscheme
}

alias git_undo_merge='git reset --merge ORIG_HEAD'

src () {
    # given a github url (full url or "<author>/<package>"), clone and cd into ~/src
    args=$@
    # if it starts with the complete github url, trim till what remains is "<author>/<repo>"
    if [[ $args =~ "^https:" ]]; then
        args=$(echo "$args" | cut -c 20-)
    fi
    name=$(echo $args | cut -d '/' -f 2)  # take the second half of argument
    cd ~/src
    git clone "git@github.com:$args.git"
    cd $name
}

# shortcut for the vimwiki with colored tab
wi () {
    tab-color 255 100 200
    cd ~/Personal/vimwiki
    local filename=$@
    if (( $# == 0 )) then
        local filename=~/Personal/vimwiki/index.wiki
    fi
    $EDITOR $filename
}
di (){
    wi ~/Personal/vimwiki/diary/$(date +'%Y-%m-%d').wiki
}

# paste something to the yelster pastebox
ypaste () {
    curl -u kstytsenko:$(pass yelster/ldap) -d private=1 --data-urlencode text@- https://paste2.yelsterdigital.com/api/create
}

colors-tmux () {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

# clip last: copy last command to clipboard
cl () {
    last_command=$(history | tail -n 1 | sed 's/[0-9]*  //')
    echo $last_command | pbcopy
    echo "$last_command copied to clipboard"
}

he () {
    # `head` a file
    head !$
}

deploy () {
    if [[ -f fabfile.py ]]; then
        fab deploy
    elif [[ -f package.json ]]; then
        npm run deploy
    fi
}

dev () {
    if [[ -f manage.py ]]; then
        # django-green
        tab-color 12 75 51
        ./manage.py runserver; tc
    elif [[ -f package.json ]]; then
        # javascript-yellow
        tab-color 225 224 0
        npm run dev; tc
    fi
}

tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}



tc () {
    if [[ $# == 0 ]]; then
        tab-color 190 190 190
    else
        local argument=$@
        if [[ $# == 1 ]]; then
            local color=$@
            # add more if-statements here (cringe!) to add more colors
            if [[ $color == "blue" ]]; then
                argument="50 50 255"
            fi
            if [[ $color == "orange" ]]; then
                argument="255 184 95"
            fi
            if [[ $color == "pink" ]]; then
                argument="255 100 200"
            fi
            if [[ $color == "green" ]]; then
                argument="50 150 50"
            fi
        fi
        tab-color ${=argument}
    fi
}

function music {
    # Get the best audio, convert it to MP3, and save it to the ~/Music directory.
    cd ~/Music
    youtube-dl --default-search=ytsearch: \
               --restrict-filenames \
               --format=bestaudio \
               --extract-audio \
               --audio-format=mp3 \
               --audio-quality=1 "$*"
    cd -
}
