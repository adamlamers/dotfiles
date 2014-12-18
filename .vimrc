if filereadable($HOME . "/.vimrc_vundle")
    source $HOME/.vimrc_vundle
endif
set history=700

filetype plugin on
filetype indent on

nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

set autoread
set nocompatible

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable
set nocp
set nu

set encoding=utf8

set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

" Tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set tw=100

set autoindent
set smartindent

set path=$PWD/**
map j gj
map k gk

map <silent> <leader><cr> :noh<cr>
map <leader>ba :1,1000 bd!<cr>

"Return to last position when re-opening file
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\    exe "normal! g`\"" |
	\ endif
set viminfo^=%

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set laststatus=2
set statusline=\ %{HasPaste()}%F%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ [%P]\ M%m\ %=%-5y\ %-5{&ff}

let g:rehash256=1
let &t_Co=256
let &t_AF="\e[38;5;%dm"
let &t_AB="\e[48;5;%dm"
colorscheme monokai

"Add additional stuff here
