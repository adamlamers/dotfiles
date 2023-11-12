" General settings
set nocompatible
filetype off
set hidden
set backspace=eol,start,indent
set nu
set ignorecase
filetype plugin indent on

"Space as leader
nmap <Tab> <Nop>
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

"Buffer navigation
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap <leader>c :bd<CR>
nnoremap <leader>C :bd!<CR>
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
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/gruvbox-material'
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
call plug#end()

"Colorscheme
colorscheme gruvbox-material

"Coc Config
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>d <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <silent> <C-x> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <C-f> coc#refresh()
inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#confirm() : <Nop>
nnoremap <silent> K :call ShowDocumentation()<CR>

let g:coc_disable_transparent_cursor=1

"SimpylFold Config
let g:SimpylFold_docstring_preview=1

"NERDTree keybinds
nmap <leader>g :NERDTreeFind<CR>
nmap <leader>tt :NERDTreeFocus<CR>
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.egg-info$', 'node_modules']

"CtrlP config
nmap <C-E> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode= 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.egg-info|\.pyc'

"fzf keybinds
let $FZF_DEFAULT_COMMAND = 'rg --files -g "!node_modules/"'
nmap <C-F> :FZF<CR>
nmap <C-G> :Rg<CR>

"Wildignore
set wildignore+=*/node_modules/*,*/__pycache__/*,*.pyc,*.egg-info

"OSCYank settings
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is 'a' | execute 'OSCYankReg a' | endif
