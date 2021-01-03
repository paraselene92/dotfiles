#!/bin/bash

set -ex

start(){
        clear
        echo "================================="
        echo "Start dotfiles sh..."
        echo "================================="
        sleep 5
        echo -n "Times Up! Start!"
        cd $HOME
}

apt_add_repository(){
        echo
        echo "================================="
        echo "apt-add-repository"
        echo "golang"
        echo "git"
        echo "================================="
        sudo apt-add-repository -y ppa:longsleep/golang-backports
        sudo apt-add-repository -y ppa:git-core/ppa
}

apt_install(){
        echo
        echo "================================="
        echo "apt install"
        echo "update"
        echo "upgrade"
        echo "fish"
        echo "fish-common"
        echo "jq"
        echo "keychain"
        echo "python3-dev"
        echo "python3-pip"
        echo "python3-setuptools"
        echo "git"
        echo "flake8"
        echo "tig"
        echo "tree"
        echo "sshpass"
        echo "apt-transport-https"
        echo "gung2"
        echo "================================="
        sudo apt update
        sudo apt upgrade
        sudo apt install -y \
          fish fish-common \
          jq keychain \
          python3-dev python3-pip python3-setuptools \
          git flake8 tig tree golang sshpass apt-transport-https gnupg2
        sleep 5
}

dotfile_clone(){
        echo "================================="
        echo "dotfile clone"
        echo "================================="
        git clone https://github.com/paraselene92/dotfiles.git
        sleep 5
}

tfenv_clone(){
        echo "================================="
        echo "tfenv clone"
        echo "================================="
        git clone https://github.com/tfutils/tfenv.git $HOME/dotfiles/.tfenv
        sudo ln -s $HOME/dotfiles/.tfenv/bin/* /usr/local/bin
        which tfenv
        sleep 5
}

tflint_clone(){
        echo "================================="
        echo "tflint clone"
        echo "================================="
        cd /tmp
        curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip
        unzip tflint.zip
        sudo cp tflint /usr/local/bin/.
        rm tflint.zip
        which tflint
}

ghq_install(){
        echo "================================="
        echo "ghq install"
        echo "================================="
        cd /tmp
        wget -o - https://github.com/x-motemen/ghq/releases/download/v1.1.5/ghq_linux_amd64.zip
        unzip ghq_linux_amd64.zip
        sudo cp ghq_linux_amd64/ghq /usr/local/bin/
}

awscli_install(){
        echo "================================="
        echo "awscli install"
        echo "================================="
        cd /tmp
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
}

starship_install(){
        echo "================================="
        echo "starship_install"
        echo "================================="
        curl -fsSL htttps://starship.rs/install.sh | bash
}

dein_install(){
        echo "================================="
        echo "dein install"
        echo "================================="
        cd /tmp
        curl -o installer.sh https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
        sh ./installer.sh $HOME/.cache/dein
        sleep 5
}

kubectl_install(){
        echo "================================="
        echo "kubectl install"
        echo "================================="
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
        sudo apt update
        sudo apt-get install -y kubectl
        sleep 5
}

make_symbolicfile(){
        echo "================================="
        echo "make symbolicfile"
        echo "================================="
        cd $HOME/.cache/dein && ln -s $HOME/dotfiles/userconfig/ userconfig
        mkdir -p $HOME/.config/fish && cd $HOME/.config/fish && ln -s $HOME/dotfiles/fish/config.fish config.fish && ln -s $HOME/dotfiles/fish/functions/ functions
        cd $HOME && ln -s $HOME/dotfiles/.vim .vim && ln -s $HOME/dotfiles/.vimrc .vimrc && ln -s $HOME/dotfiles/.tmux.conf .tmux.conf
        cd $HOME && ln -s $HOME/dotfiles/.tigrc .tigrc
        cd $HOME && ln -s $HOME/dotfiles/.tfenv .tfenv
        sleep 5
}

fzf_install(){
        echo "================================="
        echo "fzf install"
        echo "================================="
        git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/dotfiles/.fzf
        $HOME/dotfiles/.fzf/install
}

start
apt_add_repository
apt_install
dotfile_clone
tfenv_clone
tflint_clone
ghq_install
awscli_install
starship_install
dein_install
kubectl_install
make_symbolicfile
fzf_install
