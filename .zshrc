# Created by newuser for 5.8

autoload -U compinit && compinit
autoload -U colors && colors
zmodload -i zsh/complist

# prompt
PROMPT="%B%F{red}[%f%b %B%~%b %B%F{red}]%f%b %F{green}>%f "

# autostart X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# set terminal name
echo -en "\e]2;simple terminal\a"

# key bindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey  "^[[3~"  delete-char

# aliases
alias ls="ls -l --color"
alias gw="~/Scripts/GodWord/GodWord.sh"
alias mkin="doas make -j4 install"
alias mkcl="make clean"

# provide some words of wisdom upon startup
fortune | cowsay -y

# load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable tab-autocomplete menu highlighting
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
  fpath=(/usr/local/share/zsh-completions $fpath)

zstyle ':completion:*' menu select
