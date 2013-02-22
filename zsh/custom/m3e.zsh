if [[ $('hostname') == 'rantanplan.bemaw.meduniwien.ac.at' ]]; then
    # virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    source /usr/local/share/python/virtualenvwrapper.sh

    E="/Users/kirill/exam2"
    # Exam2 Virtualenv
    #cd "$E/env/bin"
    #source "activate"
    #cd

    # Subversion
    export SVN_EDITOR=vim

    # quick goto project dir
    alias e='$E/src/exam2'

    # site packages
    alias site-packages="$E/env/lib/python2.7/site-packages"

    # svn diff
    alias svnd="svn diff > /tmp/svn.diff ; s /tmp/svn.diff"

    # svn st
    alias gs="svn st"

    # svn ci
    alias gca="svn ci"

    # autols tool
    AUTOLS_OPTIONS="-c 'ls -GF'"
    source /Users/kirill/software/autols/shell/zsh

    # test alias
    alias t="./manage.py test -x"
fi
