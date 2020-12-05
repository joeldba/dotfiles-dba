#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start X upon login (works only on tty1)
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

alias ls='ls --color=auto'
export PS1="\[$(tput bold)\]\[\033[01;38;5;9m\][\[$(tput sgr0)\]\[\033[01;38;5;11m\]\u\[$(tput sgr0)\]\[\033[01;38;5;10m\]@\[$(tput sgr0)\]\[\033[01;38;5;12m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[01;38;5;12m\]\w\[$(tput sgr0)\]\[\033[01;38;5;9m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

echo -ne "\033]0;rwt@dalia - st\007"

alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias ps='pacman -Ss'
alias psl='pacman -Qs'
alias pr='sudo pacman -R'
alias prd='sudo pacman -Rs'
alias pcc='sudo pacman -Sc'
alias tty-clock='tty-clock -xcC 1'
