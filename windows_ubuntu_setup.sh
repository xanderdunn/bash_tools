#!/bin/bash

add_line_if_not_present () {
  LINE=$1
  FILE=$2
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

add_bash () {
  add_line_if_not_present "$1" ~/.bashrc
}

add_ppa() {
  grep -h "^deb.*$1" /etc/apt/sources.list.d/* > /dev/null 2>&1
  if [ $? -ne 0 ]
  then
    echo "Adding ppa:$1"
    sudo add-apt-repository -y ppa:$1
  fi

  echo "ppa:$1 already exists"
}

# Shortcuts
add_bash "alias l='ls -lah'"
add_bash "alias gs='git status'"
add_bash "alias ..='cd ..'"
add_bash "alias startjup='jupyter notebook --port=5000 --no-browser'"
add_bash "export LANG=en_US.UTF-8"

# apt repos
add_ppa "git-core/ppa" # Latest stable git
# Update apt only if it hasn't been run in the past 6 hours
if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -360)" ]; then
  echo "apt not up to date"
  sudo apt -y update
fi

# Basic tools
sudo apt -y install pwgen neovim bash-completion htop
add_bash "alias vim='nvim'"

# Python 3 installation
if [ ! -d "$HOME/miniconda" ]; then
  echo "Conda not installed"
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p ~/miniconda 
  ~/miniconda/bin/conda init
  conda update -y -n base conda
  conda config --set show_channel_urls True
fi

# Worldcoin
ENVS=$(conda env list)
if [[ ! $ENVS == *"bob_py3"* ]]; then
  echo "Worldcoin env not found"
  conda create --name bob_py3 --override-channels -c https://www.idiap.ch/software/bob/conda -c defaults python=3 bob
  conda init bob_py3
  conda activate bob_py3
  conda install -y jupyter
  conda config --env --add channels defaults
  conda config --env --add channels https://www.idiap.ch/software/bob/conda
  conda install -y bob.bio.vein
  pip install opencv-python imutils
  sudo apt -y install libsm6 libxext6 libxrender-dev # Libraries needed for some openCV functions
  sudo apt -y install ffmpeg dos2unix
  conda deactivate
fi

# Fountain Therapeutics
if [[ ! $ENVS == *"fountain"* ]]; then
  conda create --name fountain
  conda activate fountain
  conda install -y spqlalchemy
  conda install -y jupyter
  conda install -y boto3
  pip install -y awscli
  conda deactivate
fi

# Temple Capital
if [[ ! $ENVS == *"temple"* ]]; then
  conda create --name temple
  conda activate temple
  conda install -y jupyter numpy pandas scikit-learn
  pip install -y tables
  pip install -y tensorflow==2.0.0-rc0
  pip install -y empyrical
  conda deactivate
fi

# Git
sudo apt -y install git git-lfs # Update git and install git-lfs
git config --global user.name "Xander Dunn"
git config --global user.email "vakeera@gmail.com"

# Cleanup
[ -e ~/miniconda.sh ] && rm ~/miniconda.sh

# Turn a .mkv of Kinect data into pngs:
# ffmpeg -i /mnt/c/Users/xander/Desktop/1080p_rgb_passive_ir_no_imu_stationary_background.mkv -map 0:1 -vsync 0 /mnt/c/Users/xander/Desktop/images_ir/ir%04d.png
