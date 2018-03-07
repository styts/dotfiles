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
    fancy-ctrl-z
    extract
    history-substring-search
    iterm2
    pass
    python
    pip
    pro
    #per-directory-history
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
export EDITOR="emacsclient"

if [[ `uname` == 'Darwin' ]]; then
    # agent to vagrant forwarding
    key_file=~/.ssh/id_dsa
    eval `ssh-agent -s` > /dev/null
    [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file 2> /dev/null

    # todo cfg
    alias t='todo.sh -d ~/.dotfiles/todo.cfg'

    # autojump
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# vim mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# enable virtualenvwrapper shims and autocompletion
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PROJECT_HOME=$HOME/Projects

export TODOTXT_DEFAULT_ACTION=ls

# works on linux
if [[ -d $HOME/.urxvt/ext/dynamic-colors ]]; then
    # set the $DAYLIGHT based on hour
    source $HOME/bin/daylight.sh

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

# if a .colorscheme file exists, switch profile
# still an issue: eye shock by contrasting scheme
if [[ -f ~/.colorscheme ]]; then
    local clr=$(cat ~/.colorscheme)
    echo -e "\033]50;SetProfile=$clr\a"
fi

if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

bindkey -s "^N" "clear\n"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

compctl -g '~/.itermocil/*(:t:r)' itermocil

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# serverless / AWS Lambda
export AWS_ACCESS_KEY_ID=$(pass aws/access-key-id)
export AWS_SECRET_ACCESS_KEY=$(pass aws/serverless-admin)
export AWS_GITHUB_TOKEN=$(pass aws/github-token)

# OCaml
# . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function chpwd() {
  if [[ $PWD == '/Users/kirill/Projects/tropy' ]]; then
    tab-color 150 150 256
  elif [[ $PWD == '/Users/kirill/Projects/tropy-omeka' ]]; then
    tc orange
  else
    tc
  fi
}

RPS1="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
