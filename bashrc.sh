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
# }}} 

