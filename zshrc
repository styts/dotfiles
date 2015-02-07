# Zsh / oh-my-zsh stuff
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="styts"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
    aliases
    brew
    dircycle
    django
    extract
    git
    history-substring-search
    iterm2
    pip
    pro
    themes
    vagrant
    web-search
    yellow
)

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

# toggle bg/fg
bindkey -s "^Z" "fg\n"
export TERM="xterm-256color"

# Django
export DJANGO_COLORS="dark"

# Obvious...
export EDITOR="gvim -v"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/share/npm/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:$HOME/bin

if [[ `uname` == 'Darwin' ]]; then
    # brew does not link gettext
    export PATH=/usr/local/Cellar/gettext/0.18.2/bin:$PATH
    # on mac, gnu utils should be before mac defaults, (otherwise ls is gls, etc.)
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    # agent to vagrant forwarding
    key_file=~/.ssh/id_dsa
    [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# vim mode
bindkey -v
bindkey '^R' history-incremental-search-backward

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# pass completion
[ -f /usr/local/share/zsh/site-functions/_pass ] && source /usr/local/share/zsh/site-functions/_pass


# ubuntu vm needs the 'workon', etc. commands
export VENVWRAPPER=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
[ -f $VENVWRAPPER ] && source $VENVWRAPPER
# same for mac (homebrew)
export VENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
[ -f $VENVWRAPPER ] && source $VENVWRAPPER
# same on debian
export VENVWRAPPER="/etc/bash_completion.d/virtualenvwrapper" 
[ -f $VENVWRAPPER ] && source $VENVWRAPPER

# ubuntu vm runs inside OSX host and needs to use gvim to share clipboard with OSX
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias vim="gvim -v"
fi

# enable virtualenvwrapper shims and autocompletion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PROJECT_HOME=$HOME/Projects

export TODOTXT_DEFAULT_ACTION=ls
