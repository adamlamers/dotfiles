vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        vim.opt_local.conceallevel = 2
    end,
})

vim.g.python_indent = {
    open_paren = "shiftwidth()",
    nested_paren = "shiftwidth()",
    continue = "shiftwidth()",
}

vim.opt.wildignore:append({ "*/node_modules/*", "*/__pycache__/*", "*.pyc", "*.egg-info" })
