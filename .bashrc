#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# start X upon login (works only on tty1)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

alias ls='ls -lh --color=auto'
export PS1="\[$(tput bold)\]\[\033[38;5;9m\][\[$(tput sgr0)\] \[$(tput bold)\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;9m\]]\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

# set name of terminal window
echo -ne "\033]0;simple terminal\007"

# aliases
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias ps='pacman -Ss'
alias psl='pacman -Qs'
alias pr='sudo pacman -R'
alias prd='sudo pacman -Rs'
alias pcc='sudo pacman -Sc'
alias mkin="sudo make install"
alias mkcl="make clean"

fortune | cowsay -y 
