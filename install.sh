#!/bin/sh

git clone https://github.com/paraselene92/dotfiles /tmp/dotfiles

if [ -e /etc/arch-release ]; then
	cp -rp /tmp/dotfiles/archlinux $HOME/dotfiles
fi

## symbolic link
ln -sf $HOME/dotfiles/.alacritty.yml $HOME/.alacritty.yml
ln -sf $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -sf $HOME/dotfiles/.npmrc $HOME/.npmrc
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/.xinitrc $HOME/.xinitrc
ln -sf $HOME/dotfiles/.xprofile $HOME/.xprofile
ln -sf $HOME/dotfiles/.zprofile $HOME/.zprofile
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.zsh $HOME/.zsh

## zinit (zsh plugin manage)
mkdir ~/dotfiles/.zinit
git clone https://github.com/zdharma-continuum/zinit ~/dotfiles/.zinit/bin
ln -sf $HOME/dotfiles/.zinit $HOME/.zinit

## dein (vim plugin manage)
cd /tmp
curl -o installer.sh https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
sh ./installer.sh $HOME/.cache/dein

## vim (color scheme)
mkdir -p $HOME/dotfiles/.vim/colors
cd $HOME/dotfiles/.vim/colors
wget -o - https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim
echo "\n\" local background settings\nset background=dark" >> $HOME/dotfiles/.vim/colors/iceberg.vim
ln -sf $HOME/dotfiles/.vim $HOME/.vim

## npm
npm install -g n
sudo n stable

## golang
git clone https://github.com/syndbg/goenv.git ~/dotfiles/.goenv
ln -sf $HOME/dotfiles/.goenv $HOME/.goenv

