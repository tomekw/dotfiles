filetype on
filetype indent on

set autoread
set autoindent
set number
set showmatch
set smarttab

let mapleader=','
let g:mapleader=','

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme railscasts
else
  colorscheme default
endif

autocmd BufWritePre * :%s/\s\+$//e
