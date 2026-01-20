set nu
set signcolumn=yes
set ignorecase
set smartcase

autocmd BufEnter *.md setlocal conceallevel=2

let g:python_indent = {}
let g:python_indent.open_paren = "shiftwidth()"
let g:python_indent.nested_paren = "shiftwidth()"
let g:python_indent.continue = "shiftwidth()"

set wildignore+=*/node_modules/*,*/__pycache__/*,*.pyc,*.egg-info
