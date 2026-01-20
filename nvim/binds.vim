nnoremap <Space> <Nop>
let mapleader="\<Space>"
let g:mapleader="\<Space>"

nnoremap <silent><leader>e :lua Snacks.explorer.open()<CR>
nnoremap <silent><leader>g :lua Snacks.explorer.reveal()<CR>

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

" snacks.nvim
nnoremap <silent><C-f> :lua Snacks.picker.smart()<CR>
nnoremap <silent><C-e> :lua Snacks.picker.buffers()<CR>
nnoremap <silent>grr   :lua Snacks.picker.lsp_references()<CR>
nnoremap <silent>gd    :lua Snacks.picker.lsp_definitions()<CR>
nnoremap <silent>gI    :lua Snacks.picker.lsp_implementations()<CR>

" obsidian.nvim
" nnoremap <silent><C-o> :Obsidian<CR>

tnoremap <Esc> <C-\><C-n>
