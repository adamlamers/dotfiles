set nu
set signcolumn=yes
set ignorecase
set smartcase

autocmd CursorHold * lua vim.diagnostic.open_float()
autocmd BufEnter *.md setlocal conceallevel=2
autocmd BufWritePre *.md,*.py,*.ts,*.js,*.tsx,*.rs, lua vim.lsp.buf.format()

let g:python_indent = {}
let g:python_indent.open_paren = "shiftwidth()"
let g:python_indent.nested_paren = "shiftwidth()"
let g:python_indent.continue = "shiftwidth()"

set wildignore+=*/node_modules/*,*/__pycache__/*,*.pyc,*.egg-info
