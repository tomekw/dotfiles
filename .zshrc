green=$'\e[32m'
cyan=$'\e[36m'
reset=$'\e[39m'
setopt correct

prompt="%{$green%}%n@%m %{$reset%}[%{$cyan%}%~%{$reset%}] \$ "

watch=notme

setopt autocd nocheckjobs nohup nobeep

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

PATH=/opt/ruby/bin:$PATH
WORDCHARS=${WORDCHARS:s,/,,}

autoload -U compinit zed
compinit -C

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
alias ls="ls --color"
alias logout='clear; logout'

zmodload zsh/net/tcp

bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char 
bindkey '^N' menu-complete
bindkey '^P' reverse-menu-complete

if [[ -s /home/tomek/.rvm/scripts/rvm ]] ; then source /home/tomek/.rvm/scripts/rvm ; fi
