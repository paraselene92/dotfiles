# dotfiles

## Requirement

* Vim 8.0  (https://github.com/Shougo/dein.vim)

## Usage

1. Install dotfiles files 

* cd ~ && git clone https://github.com/paraselene92/dotfiles.git

2. Install Dein

* cd /tmp && wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh && sh ./installer.sh ~/.cache/dein

3. Make Symbolic Link

* cd ~/.cache/dein && ln -s ~/dotfiles/userconfig/ userconfig
* cd ~ && ln -s ~/dotfiles/.vimrc .vimrc && ln -s ~/dotfiles/.tmux.conf .tmux.conf
