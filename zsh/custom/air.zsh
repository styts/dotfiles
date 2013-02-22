if [[ $('hostname') == 'air.styts.com' ]]; then
    # opencv said this is required
    export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

    # gnu coreutils
    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

    # latex
    export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH

    # brew
    export PATH=/usr/local/share/python:$PATH

    # andoird
    export ANDROIDSDK="/Users/kirill/android/sdk"
    export ANDROIDNDK="/Users/kirill/android/ndk"
    export ANDROIDNDKVER=r8
    export ANDROIDAPI=14

    # git diff
    alias gdiff="git diff > /tmp/git.diff ; s /tmp/git.diff"

    # git add all
    alias gaa="git add -A"

    # virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    source /usr/local/bin/virtualenvwrapper.sh
fi
