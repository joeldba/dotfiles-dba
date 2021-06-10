# Created by newuser for 5.8

autoload -U compinit && compinit
autoload -U colors && colors
zmodload -i zsh/complist
setopt sharehistory
setopt extendedhistory
eval $(thefuck --alias)

# vars 
PROMPT="%B%F{red}[%f%b %B%~%b %B%F{red}]%f%b %F{green}>%f "
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000

# autostart X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# key bindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey  "^[[3~"  delete-char

# aliases
alias ls="ls -lh --color"

# load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable tab-autocomplete menu highlighting
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
  fpath=(/usr/local/share/zsh-completions $fpath)

zstyle ':completion:*' menu select
