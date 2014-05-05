# Zsh / oh-my-zsh stuff
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="styts"
CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(svn django brew dircycle git history-substring-search m3e air
#dict  # started using dict.cc.py insted
extract themes web-search aliases)

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

# toggle bg/fg
bindkey -s "^Z" "fg\n"
export TERM="xterm-256color"

# disable annoying autocorrect questions
#unsetopt correct_all

# Django
export DJANGO_COLORS="dark"

# Obvious...
export EDITOR="vim"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/share/python:/usr/local/share/npm/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:$HOME/bin

# brew does not link gettext
export PATH=/usr/local/Cellar/gettext/0.18.2/bin:$PATH

# wordnet path
export PATH=/usr/local/WordNet-3.0/bin:$PATH


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

# ubuntu vm runs inside OSX host and needs to use gvim to share clipboard with OSX
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias vim="gvim -v"
fi
