nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

nnoremap <silent><leader>e :NvimTreeToggle<CR>
nnoremap <silent><leader>g :NvimTreeFindFile<CR>

"Buffer navigation
nnoremap <silent>[b :bprev<CR>
nnoremap <silent>]b :bnext<CR>
nnoremap <leader>c :bprev\|bdelete #<CR>
nnoremap <leader>C :bdelete!<CR>:
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

autocmd FileType *               :BufferOrderByBufferNumber

inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

nnoremap <silent>]g :lua vim.diagnostic.jump({count=1})<CR>
nnoremap <silent>[g :lua vim.diagnostic.jump({count=-1})<CR>
nnoremap <silent><C-f> :FzfLua files<CR>

tnoremap <Esc> <C-\><C-n>
