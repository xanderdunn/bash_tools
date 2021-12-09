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
# The NVIDIA registry GPG key is outdated by default on Google Deep Learning VMs
# curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

# Install killall
sudo apt update
sudo apt-get install -y psmisc silversearcher-ag
sudo apt-get install -y dbus # Required for timedatectl and missing on some GCP instances
# sudo apt-get install -y postgresql-client # psql
sudo apt-get install -y tmux
sudo apt-get install -y htop # system perf monitoring
sudo apt-get install -y unzip

# Set timezone
sudo timedatectl set-timezone America/New_York

add_line_to_file_if_missing "source ~/dev/bash_tools/bashrc.sh" ~/.bashrc false
add_line_to_file_if_missing "export PATH=$PATH:~/.local/bin" ~/.bashrc false

# Install neovim
DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
if ["$DISTRO" == "Debian"]; then
    add_line_to_file_if_missing "APT::Default-Release \"stretch\";" /etc/apt/apt.conf.d/99defaultrelease true
    add_line_to_file_if_missing "deb http://deb.debian.org/debian unstable main contrib" /etc/apt/sources.list true
    add_line_to_file_if_missing "deb-src http://deb.debian.org/debian unstable main contrib" /etc/apt/sources.list true
elif ["$DISTRO" == "Ubuntu"]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
else
    sudo apt-get install -y neovim
fi
sudo apt-get update
if ["$DISTRO" == "Debian"]; then
    sudo apt-get install -t unstable -y python3-neovim
else
    sudo apt install -y python3-neovim
fi
sudo apt-get install -y exuberant-ctags
# sudo apt-get install -y postgresql-client
create_dir_if_not_exist ~/.config
create_dir_if_not_exist ~/.config/nvim
create_dir_if_not_exist ~/.config/nvim/backup
create_dir_if_not_exist ~/.config/nvim/swap
# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -fs ~/dev/bash_tools/vimrc ~/.config/nvim/init.vim
nvim +PlugInstall

# Python libraries
# TODO: Don't install these if they're already installed
# sudo apt-get install -y python3-setuptools python3-distutils
# sudo easy_install3 pip
# pip3 install --user numpy pandas wandb scikit-learn tqdm pylint flake8 matplotlib Pillow tables ipython
# pip3 install --user neovim jupytet PyQt5 # Dependencies for jupyter-vim
# pip3 install --user --upgrade jedi # Update to show floating window docs from coc.nvim
ln -sf ~/dev/bash_tools/pylintrc ~/.pylintrc
ln -sf ~/dev/bash_tools/flake8 ~/.flake8
ln -sf ~/dev/bash_tools/tmux.confg ~/.tmux.conf
create_dir_if_not_exist ~/.config/htop
ln -sf ~/dev/bash_tools/htoprc ~/.config/htop/htoprc
create_dir_if_not_exist ~/.config/yapf
ln -sf ~/dev/bash_tools/yapf.style ~/.config/yapf/style

# Git Setup
git config --global user.name "Xander Dunn"
git config --global user.email "xander.dunn@avalabs.org"
git config --global core.excludesfile ~/dev/bash_tools/gitignore_global
git config --global core.editor "nvim"

# Install Node.js, used by neovim coc.nvim plugin
# curl -sL install-node.now.sh | sudo bash
# nvim +CocInstall coc-python

sudo apt-get install -y mosh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
chmod +x ~/.nvm/nvm.sh
source ~/.bashrc
nvm install 16
nvm use 16

sudo apt autoremove
