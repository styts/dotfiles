# Zsh / oh-my-zsh stuff
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="styts"
CASE_SENSITIVE="true"
export DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
    aliases
    brew
    dircycle
    django
    docker
    docker-compose
    fabric
    extract
    history-substring-search
    iterm2
    pass
    python
    pip
    pro
    themes
    vagrant
    web-search
    yellow
    zsh-syntax-highlighting
    zsh-history-substring-search
)

# function path
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=($ZSH/functions $fpath)

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

# toggle bg/fg
bindkey -s "^Z" "fg\n"
export TERM="xterm-256color"

# Django
export DJANGO_COLORS="dark"

# Obvious...
export EDITOR="nvim"

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin

# include Android tools: adb, etc.
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

#ruby
#export PATH=$HOME/.gem/ruby/2.2.0/bin:$PATH

#pip
export PATH=$HOME/.local/bin:$PATH

# python
export PATH="$HOME/Library/Python/2.7/bin":$PATH

if [[ `uname` == 'Darwin' ]]; then
    # brew does not link gettext
    export PATH=/usr/local/Cellar/gettext/0.18.2/bin:$PATH

    # on mac, gnu utils should be before mac defaults, (otherwise ls is gls, etc.)
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

    # agent to vagrant forwarding
    key_file=~/.ssh/id_dsa
    eval `ssh-agent -s` > /dev/null
    [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file 2> /dev/null

    # start docker vm
    # disable
    #boot2docker ip 2>/dev/null >/dev/null || boot2docker up
    #$(boot2docker shellinit 2> /dev/null)

    # todo cfg
    alias t='todo.sh -d ~/.dotfiles/todo.cfg'

    # generic colorizer
    source "$(brew --prefix)/etc/grc.bashrc"

    # autojump
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# vim mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# ubuntu vm needs the 'workon', etc. commands
export VENVWRAPPER=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
[ -f $VENVWRAPPER ] && source $VENVWRAPPER
# same for mac (homebrew)
export VENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
[ -f $VENVWRAPPER ] && source $VENVWRAPPER
# same on debian
export VENVWRAPPER="/etc/bash_completion.d/virtualenvwrapper" 
[ -f $VENVWRAPPER ] && source $VENVWRAPPER
# arch
export VENVWRAPPER=$HOME/.local/bin/virtualenvwrapper.sh
[ -f $VENVWRAPPER ] && source $VENVWRAPPER

# enable virtualenvwrapper shims and autocompletion
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PROJECT_HOME=$HOME/Projects

export TODOTXT_DEFAULT_ACTION=ls

# works on linux
if [[ -d $HOME/.urxvt/ext/dynamic-colors ]]; then
    # set the $DAYLIGHT based on hour
    source $HOME/bin/daylight.sh

    # dynamic colors
    export PATH="$HOME/.urxvt/ext/dynamic-colors/bin:$PATH"
    source $HOME/.urxvt/ext/dynamic-colors/completions/dynamic-colors.zsh
    export DYNAMIC_COLORS_ROOT="$HOME/.urxvt/ext/dynamic-colors/"

    if [[ $DAYLIGHT == "false" ]]; then
        dynamic-colors switch solarized-dark
    else
        dynamic-colors switch solarized-light
    fi

    alias t='~/bin/todo.sh -d ~/.todo.cfg'
fi

# function for quickly rerunning a python command with pdb enabled
function pytrace () {
    if [ "$1" != "" ]
    then
        exec_command=$@ 
    else
        last_command=$history[$[HISTCMD-1]]
        exec_command=$last_command
    fi
    echo "Traceback enabled for: $exec_command"
    ipython --pdb --c="%run $exec_command"
}

# journal
setopt HIST_IGNORE_SPACE

# nuff said, no more .pyc files
export PYTHONDONTWRITEBYTECODE=1

# fix the neovim pane movement ctrl+h as described in
# https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > /tmp/$TERM.ti && tic /tmp/$TERM.ti

# gnu-sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# if a .colorscheme file exists, switch profile
# this prevents eye shock by contrasting scheme
if [[ -f ~/.colorscheme ]]; then
    $(cat ~/.colorscheme)
fi

if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# background / color scheme
export DARK=1

bindkey -s "^N" "clear\n"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
