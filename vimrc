if filereadable($HOME . "/.vimrc_vundle")
    source $HOME/.vimrc_vundle
endif
set history=700

nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

filetype plugin on
filetype indent on

"Auto reload files and enable Vim mode
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

"enable line numbers
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

"File specific tab settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set lbr

"Max 100 columns
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
map <leader>g :NERDTreeToggle<cr>

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

"Color compatibility with some terminals
let g:rehash256=1
let &t_Co=256
let &t_AF="\e[38;5;%dm"
let &t_AB="\e[48;5;%dm"
colorscheme monokai

"change tabs with tab and shift-tab
nnoremap <tab> gt
nnoremap <S-tab> gT
nnoremap <C-p> :CtrlP<cr>

autocmd BufWritePre * :%s/\s\+$//e

"Highlight lines that go over 120 columns
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

inoremap <C-F> :compl-filename<CR>

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if v:version > 800
    tnoremap <C-h> <C-w>h
    tnoremap <C-j> <C-w>j
    tnoremap <C-k> <C-w>k
    tnoremap <C-l> <C-w>l
endif
