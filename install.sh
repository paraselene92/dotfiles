#!/bin/bash

start(){
        clear
        echo "================================="
        echo "Start dotfiles sh..."
        echo "================================="
        sleep 5
        echo -n "Times Up! Start!"
        cd $HOME
}

apt_install(){
        echo
        echo "================================="
        echo "apt install"
        echo ""
        echo "update"
        echo "fish"
        echo "fish-common"
        echo "python3-dev"
        echo "python3-pip"
        echo "python3-setuptool"
        echo "git"
        echo "================================="
        sudo apt update
        sudo apt install fish fish-common python3-dev python3-pip python3-setuptool git
        sleep 5
}

git_clone(){
        echo "================================="
        echo "git clone"
        echo "================================="
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
        mkdir $HOME/.config/fish && cd $HOME/.config/fish && ln -s $HOME/dotfiles/fish/config.fish config.fish && ln -s $HOME/dotfiles/fish/functions/ functions
        cd $HOME && ln -s $HOME/dotfiles/.vim .vim && ln -s $HOME/dotfiles/.vimrc .vimrc && ln -s $HOME/dotfiles/.tmux.conf .tmux.conf
        sleep 5
}

start
apt_install
git_clone
dein_install
make_symbolicfile

