if filereadable($HOME . "/.vimrc_vundle")
    source $HOME/.vimrc_vundle
endif
set history=700

nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

filetype plugin on
filetype indent on

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

"leader bindings
map <silent> <leader><cr> :noh<cr>
map <leader>ba :1,1000 bd!<cr>
map <leader>q :bd<cr>
map <leader>qq :q<cr>
map <leader>w :w<cr>

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
set statusline=\ %{HasPaste()}%F%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ [Col\ %v]\ M%m\ %=%-5y\ %-5{&ff}

let g:rehash256=1
let &t_Co=256
let &t_AF="\e[38;5;%dm"
let &t_AB="\e[48;5;%dm"
colorscheme monokai

"change tabs with tab and shift-tab
nnoremap <tab> gt
nnoremap <S-tab> gT

set textwidth=100

autocmd BufWritePre * :%s/\s\+$//e

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%120v\s*\S', 120)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END

"Reverse directions of # and *
nnoremap # *
nnoremap * #
inoremap jk <Esc>
inoremap kj <Esc>

"Allow j/k navigation in autocomplete box
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

inoremap <C-F> :compl-filename<CR>

