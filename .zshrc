# Created by newuser for 5.8

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
alias mkin="doas make install"
alias mkcl="make clean"

# provide some words of wisdom upon startup
fortune | cowsay -y

# load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
