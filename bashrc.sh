# shell settings {{{
os=`uname -s`
host=`hostname | cut -d. -f1`

shopt -s extglob # Enable extended glob so that commands like rm !(test2) are possible

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# vim keybindings in bash
set -o vi

export PATH="$PATH:~/.local/bin"

# }}}

# Aliases {{{
case $os in
    "Darwin" )
        alias l='ls -lhGv'
        alias la='ls -lhaGv';;
    "Linux"  )
        alias l='ls -lhv --color=auto'
        alias la='ls -lhav --color=auto';;
esac

alias packetloss="ping -i .2 google.com"
alias ..='cd ..'
alias grep='grep --color=auto'
alias gs='git status'
alias t='tmux attach || tmux new'   # Either attach to the existing tmux session or create a new one
alias pro='nvim ~/bash_tools/bashrc.sh'
alias vimrc='nvim ~/bash_tools/vimrc'
alias count='ls -l | grep -v ^l | wc -l' # Count of files in the current directory
alias linespy='find ./ -name '*.py' -print0 | xargs -0 cat | wc -l'
alias vim='nvim'
alias editor='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias untar='tar -xvzf'
alias password="pwgen -s -y 30 1"
alias vimrc="nvim ~/bash_tools/vimrc"
alias devenv='export CUDA_VISIBLE_DEVICES=""; wandb off'
# alias gscopypreds="gsutil -m cp predictions/* gs://praxis-data-plane/xander/"
# }}} 

# nvm node.js version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias 0='tmux attach -t 0'
alias 1='tmux attach -t 1'
alias 2='tmux attach -t 2'
alias 3='tmux attach -t 3'
alias 4='tmux attach -t 4'
alias 5='tmux attach -t 5'
alias 6='tmux attach -t 6'
alias 7='tmux attach -t 7'
alias 8='tmux attach -t 8'
alias 9='tmux attach -t 9'

function searche () {
    if [ "$#" -eq 1 ]
    then    # Only search string specified, so search through the entire system
        for i in "${folders[@]}"
        do
            find "$i" -name "$1" -print 2>/dev/null
        done
    elif [ "$#" -eq 2 ]
    then    # Search the given directory for the given string
        find "$1" -name "$2" -print 2>/dev/null
    else
        echo "This is a bash alias.  You must at least specify what string to search for."
    fi
}
