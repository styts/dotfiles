#
# A reproducible development environment 
#
FROM ubuntu:latest

MAINTAINER Kirill Stytsenko

RUN apt-get update && apt-get install -y \
    curl               \
    git                \
    htop               \
    man-db             \
    python             \
    python-pip         \
    sudo               \
    tree               \
    vim                \
    zsh                

# user / home
ENV MAIN_USER user
RUN useradd $MAIN_USER && echo "$MAIN_USER:pass" | chpasswd && adduser $MAIN_USER sudo
RUN mkdir /home/$MAIN_USER && chown -R $MAIN_USER: /home/$MAIN_USER
ENV PATH /home/$MAIN_USER/bin:$PATH
RUN chsh -s /bin/zsh $MAIN_USER

## ################################
## everything below is done by unprivileged user
USER $MAIN_USER
WORKDIR /home/$MAIN_USER
RUN mkdir /home/$MAIN_USER/.ssh/ && touch /home/$MAIN_USER/.ssh/known_hosts && ssh-keyscan github.com >> /home/$MAIN_USER/.ssh/known_hosts

## ################################
## personal configs
## ################################
RUN git clone "https://github.com/styts/dotfiles.git" .dotfiles
RUN git clone "https://github.com/styts/oh-my-zsh.git" .oh-my-zsh

RUN ln -s .dotfiles/zshrc .zshrc && ln -s .dotfiles/vimrc .vimrc && ln -s .dotfiles/gitconfig .gitconfig && ln -s .dotfiles/gitignore .gitignore
RUN mkdir ~/.vimbackup && mkdir ~/.vimswap && mkdir ~/.vimundo

RUN git clone "https://github.com/gmarik/Vundle.vim.git" ~/.vim/bundle/Vundle.vim
RUN printf 'y' | vim +BundleInstall +qall

## ################################
ENTRYPOINT zsh
