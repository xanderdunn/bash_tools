#!/usr/bin/env bash
set -e
set -o xtrace

function add_line_to_file_if_missing {
    if $3 ; then
        echo "sudoing it"
        echo "$2"
        if [ ! -f "$2" ]; then
            sudo touch "$2"
            echo "$1" | sudo tee "$2"
        else
            echo "File exists"
            sudo grep -qF -- "$1" "$2" || echo "$1" | sudo tee -a "$2"
        fi
    else
        if [ ! -f "$2" ]; then
            echo "$1" > "$2"
        else
            grep -qF -- "$1" "$2" || echo "$1" >> "$2"
        fi
    fi
}

function create_dir_if_not_exist {
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
}

# Install killall
sudo apt-get install -y psmisc

add_line_to_file_if_missing "source ~/bash_tools/bashrc.sh" ~/.bashrc false

# Install neovim
add_line_to_file_if_missing "APT::Default-Release \"stretch\";" /etc/apt/apt.conf.d/99defaultrelease true
add_line_to_file_if_missing "deb http://deb.debian.org/debian unstable main contrib" /etc/apt/sources.list true
add_line_to_file_if_missing "deb-src http://deb.debian.org/debian unstable main contrib" /etc/apt/sources.list true
sudo apt-get update
sudo apt-get install -y neovim python3-neovim
sudo apt-get install -y exuberant-ctags
create_dir_if_not_exist ~/.config/nvim
create_dir_if_not_exist ~/.config/nvim/backup
create_dir_if_not_exist ~/.config/nvim/swap
# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -fs ~/bash_tools/vimrc ~/.config/nvim/init.vim
nvim +PlugInstall
# YouCompleteMe
sudo apt install -y build-essential cmake python3-dev
cd ~/.config/nvim/plugged/YouCompleteMe
# TODO: Don't install YouCompleteMe if it's already installed
python3 install.py --clang-completer

# Python libraries
# TODO: Don't install these if they're already installed
pip3 install numpy pandas wandb tensorflow-gpu scikit-learn tqdm

# Git Setup
git config --global user.name "Xander Dunn"
git config --global user.email "xander@praxispioneering.com"
git config --global core.excludesfile ./gitignore_global
