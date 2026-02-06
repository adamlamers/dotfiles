" General settings
set belloff=all
set nocompatible
set hidden
set backspace=eol,start,indent
set nu
set ignorecase
set laststatus=2

filetype off
filetype plugin indent on

"Space as leader
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

"Buffer navigation
nnoremap <silent>[b :bprev<CR>
nnoremap <silent>]b :bnext<CR>
nnoremap <leader>c :bprev\|bdelete #<CR>
nnoremap <leader>C :bdelete!<CR>
nnoremap <leader>f :echo expand('%:p')<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set background=dark

"File specific tab settings
autocmd FileType yaml            setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript      setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript      setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType html            setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType python          setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Trim whitespace before write
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

"Auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'sainnhe/gruvbox-material'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'ap/vim-buftabline'
call plug#end()

"Colorscheme
colorscheme gruvbox-material

"Coc Config

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"NERDTree keybinds
nmap <leader>g :NERDTreeFind<CR>
nmap <leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.egg-info$', 'node_modules']
" prevent changing buffer in NERDtree window
autocmd BufWinLeave * if &filetype == 'nerdtree' | call interrupt() | endif

"Wildignore
set wildignore+=*/node_modules/*,*/__pycache__/*,*.pyc,*.egg-info

"OSCYank settings
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is 'a' | execute 'OSCYankReg a' | endif
nnoremap <leader>yf :call OSCYank(expand('%:p'))<CR>

"Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
