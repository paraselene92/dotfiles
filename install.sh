#!/bin/bash


clone(){
        echo "================================="
        echo "git clone"
        echo "================================="
        cd $HOME
        git clone https://github.com/paraselene92/dotfiles.git
        sleep 5
}

dein_install(){
        echo "================================="
        echo "dein install"
        echo "================================="
        cd /tmp
        wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
        sh ./installer.sh $HOME/.cache/dein
        sleep 5
}

make_symbolicfile(){
        echo "================================="
        echo "make symbolicfile"
        echo "================================="
        cd $HOME/.cache/dein && ln -s $HOME/dotfiles/userconfig/ userconfig
        cd $HOME && ln -s $HOME/dotfiles/.vimrc .vimrc && ln -s $HOME/dotfiles/.tmux.conf .tmux.conf
        sleep 5
}

clone
dein_install
make_symbolicfile

