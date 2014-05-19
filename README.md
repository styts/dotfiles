Install common system packages

    sudo apt-get -y install git tree htop zsh

Change user shell to zsh

    chsh -s /bin/zsh

Install my fork of oh-my-zsh under `~/.oh-my-zsh`

    git clone git@github.com:styts/oh-my-zsh.git .oh-my-zsh

Clone this repo under `~./dotfiles`

    git clone git@github.com:styts/dotfiles.git .dotfiles
    
Install gvim for clipboard over ssh support

    sudo apt-get install gvim-gtk
    
Install Vundle and update the vim plugins

    mkdir ~/.vimbackup
    mkdir ~/.vimswap
    mkdir ~/.vimundo
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall

Linking
-------

    ln -s .dotfiles/gitconfig .gitconfig
    ln -s .dotfiles/gitignore .gitignore
    ln -s .dotfiles/tmux.conf .tmux.conf
    ln -s .dotfiles/vimrc .vimrc
    ln -s .dotfiles/zshrc .zshrc
