
# Setting PATH for Python 3.5
# The orginal version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# nix
. /Users/kirill/.nix-profile/etc/profile.d/nix.sh

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

# brew does not link gettext
export PATH=/usr/local/Cellar/gettext/0.18.2/bin:$PATH

# on mac, gnu utils should be before mac defaults, (otherwise ls is gls, etc.)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# node version manager will append paths to PATH
export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# haskell bins
export PATH="$HOME/Library/Haskell/bin:$PATH"

# latex
export PATH="/Library/TeX/Root/bin/x86_64-darwin:$PATH"

# npm bins
export PATH="./node_modules/.bin:$PATH"

# tezos
export PATH="$HOME/src/tezos:$PATH"
export PATH="$HOME/src/tezos/scripts:$PATH"

# Android
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_HOME=/usr/local/share/android-sdk
