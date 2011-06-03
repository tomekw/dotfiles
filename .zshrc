green=$'\e[32m'
cyan=$'\e[36m'
reset=$'\e[39m'
prompt="%{$green%}%n@%m %{$reset%}[%{$cyan%}%~%{$reset%}] \$ "

autoload -U compinit
compinit -C

[[ -s "/home/tomek/.rvm/scripts/rvm" ]] && source "/home/tomek/.rvm/scripts/rvm"
