green=$'\e[32m'
cyan=$'\e[36m'
reset=$'\e[39m'
prompt="%{$green%}%n@%m %{$reset%}[%{$cyan%}%~%{$reset%}] \$ "

autoload -U compinit
compinit -C

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

RUBY_HEAP_MIN_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_HEAP_FREE_MIN=500000
RUBY_GC_MALLOC_LIMIT=1000000000

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Find in files, usage: fif PATH STRING
function fif() {
  find $1 | xargs grep "$2" -sl
}
