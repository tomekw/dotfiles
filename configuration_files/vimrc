filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set autoindent
set number
set showmatch
set smarttab
set laststatus=2
set encoding=utf-8
set ruler

let mapleader=','
let g:mapleader=','

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme railscasts
else
  colorscheme default
endif

autocmd BufWritePre * :%s/\s\+$//e
