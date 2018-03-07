Install common system packages

    sudo apt-get -y install vim git tree htop zsh pass
    # install ffind
    git clone https://github.com/jaimebuelta/ffind.git
    cd ffind && sudo python setup.py install && cd .. && sudo rm -rf ffind
    # TODO: install (s)ag

Change user shell to zsh

    chsh -s /bin/zsh

    git clone https://github.com/styts/oh-my-zsh.git .oh-my-zsh
    git clone https://github.com/styts/dotfiles.git .dotfiles
    
Link the dotfiles

    ln -s .dotfiles/gitconfig .gitconfig
    ln -s .dotfiles/gitignore .gitignore
    ln -s .dotfiles/tmux.conf .tmux.conf
    ln -s .dotfiles/zshrc .zshrc
    ln -s .dotfiles/inputrc .inputrc
    ln -s .dotfiles/sshconfig .ssh/config
