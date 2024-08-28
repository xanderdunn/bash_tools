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

# Upgrade all Ubuntu packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install killall
sudo apt-get install -y psmisc silversearcher-ag
sudo apt-get install -y dbus # Required for timedatectl and missing on some GCP instances
# sudo apt-get install -y postgresql-client # psql
sudo apt-get install -y tmux
sudo apt-get install -y htop # system perf monitoring
sudo apt-get install -y unzip

# Set timezone
sudo timedatectl set-timezone America/Los_Angeles

sudo chown ubuntu:ubuntu ~/.bashrc
add_line_to_file_if_missing "source ~/dev/bash_tools/bashrc.sh" ~/.bashrc false
add_line_to_file_if_missing "export PATH=$PATH:~/.local/bin" ~/.bashrc false

sudo apt-get install -y bash-completion

# Install neovim
sudo apt-get install -y libfuse2
# v0.9.4 does not work with the solarized plugin
wget -nc https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
#wget -nc https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
#sudo apt-get install ./nvim-linux64.deb
#sudo apt-get install -y python3-neovim
sudo apt-get install -y exuberant-ctags
create_dir_if_not_exist ~/.config
create_dir_if_not_exist ~/.config/nvim
create_dir_if_not_exist ~/.config/nvim/backup
create_dir_if_not_exist ~/.config/nvim/swap
# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -fs ~/dev/bash_tools/vimrc ~/.config/nvim/init.vim
nvim +PlugInstall
sudo apt-get install -y python3-pip
python3 -m pip install --upgrade pip
pip3 install pynvim # dependency for neovim plugin
pip3 install yapf # dependency for yapf neovim plugin

# Python libraries
ln -sf ~/dev/bash_tools/pylintrc ~/.pylintrc
ln -sf ~/dev/bash_tools/flake8 ~/.flake8
ln -sf ~/dev/bash_tools/tmux.confg ~/.tmux.conf
create_dir_if_not_exist ~/.config/htop
ln -sf ~/dev/bash_tools/htoprc ~/.config/htop/htoprc
create_dir_if_not_exist ~/.config/yapf
ln -sf ~/dev/bash_tools/yapf.style ~/.config/yapf/style
ln -sf ~/dev/bash_tools/coc-settings.json ~/.config/nvim/coc-settings.json
create_dir_if_not_exist ~/.config/nvim/lua
ln -sf ~/dev/bash_tools/config.lua ~/.config/nvim/lua/config.lua

# Git Setup
# Install latest release version of git
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get upgrade -y
# Config
git config --global user.name "Xander Dunn"
git config --global user.email "xander@xander.ai"
git config --global core.excludesfile ~/dev/bash_tools/gitignore_global
git config --global core.editor "nvim"
git config --global --add --bool push.autoSetupRemote true
git config --global commit.gpgsign true
git config --global user.signingkey 2B99B045C097795C

# Install GPG key for commit signing
sudo apt-get install git-lfs
git lfs install
git lfs pull
gpg --list-keys
gpg --import pub_key.gpg
gpg --list-keys
add_line_to_file_if_missing "StreamLocalBindUnlink yes" /etc/ssh/sshd_config true
sudo sshd -t
sudo service sshd restart
# TODO MANUALLY: Make sure this machine has an entry in your local ~/.ssh/config
# Now you should be able to start a new SSH session with the machine and gpg --list-keys and gpg --list-secret-keys should both work

# For rust support in coc.nvim:
# curl https://sh.rustup.rs -sSf | sh -s -- -y
# source "$HOME/.cargo/env"
# rustup component add rust-analyzer

# sudo apt-get install -y mosh

# Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# Set up NVM environment variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# Install Node.js v18 and set it as the active version
nvm install 18
nvm use 18
# Install neovim globally
npm install -g neovim
npm install -g cspell # spell checker

nvim -c 'Copilot'

# Setup clipboard over ssh:
# https://stackoverflow.com/a/73531771/529743
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
add_line_to_file_if_missing "export PATH=$PATH:~/.iterm2" ~/.bashrc false
mkdir -p ~/.local/bin
touch ~/.local/bin/ttyup
chmod +x ~/.local/bin/ttyup

sudo apt-get autoremove -y

echo "You'll need to copy paste the bash script into ~/.local/bin/ttyup for iTerm clipboard passing to work:"
##!/bin/bash
#parent() { awk '{print $4}' \"/proc/$1/stat\"; }
#leader() { awk '{print $6}' \"/proc/$1/stat\"; }
#it2copy > \"/proc/$(parent $(leader $$))/fd/0\"
echo "You'll need to scp the GPG keyring to the machine for commit signing to work:"
echo "Set your hostname with: sudo hostnamectl set-hostname <hostname>"
