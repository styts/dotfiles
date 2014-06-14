Install common system packages

    sudo apt-get -y install git tree htop zsh
    # install ffind
    git clone https://github.com/jaimebuelta/ffind.git
    cd ffind && sudo python setup.py install && cd .. && rm -rf ffind
    # TODO: install ag

Change user shell to zsh

    chsh -s /bin/zsh

Install my fork of oh-my-zsh under `~/.oh-my-zsh`

    git clone git@github.com:styts/oh-my-zsh.git .oh-my-zsh

Clone this repo under `~./dotfiles`

    git clone git@github.com:styts/dotfiles.git .dotfiles
    
Install gvim for clipboard over ssh support

    sudo apt-get install gvim-gtk
    # or vim-gtk if that one is not found (as on ubuntu server)
    
Link the dotfiles

    ln -s .dotfiles/gitconfig .gitconfig
    ln -s .dotfiles/gitignore .gitignore
    ln -s .dotfiles/tmux.conf .tmux.conf
    ln -s .dotfiles/vimrc .vimrc
    ln -s .dotfiles/zshrc .zshrc
    ln -s .dotfiles/inputrc .inputrc
    ln -s .dotfiles/sshconfig .ssh/config
    
Install Vundle and update the vim plugins

    mkdir ~/.vimbackup
    mkdir ~/.vimswap
    mkdir ~/.vimundo
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall

Webfaction ip

    echo "37.58.75.237 wf" >> /etc/hosts
