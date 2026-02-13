-- Leader key setup
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<C-c>", "<ESC>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Snacks.nvim explorer
vim.keymap.set("n", "<leader>e", function() require("snacks").explorer.open() end, { silent = true })
vim.keymap.set("n", "<leader>g", function() require("snacks").explorer.reveal() end, { silent = true })

-- Buffer navigation
vim.keymap.set("n", "[b", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>c", function() require("snacks").bufdelete() end, { silent = true })
vim.keymap.set("n", "<leader>f", function() print(vim.fn.expand("%:p")) end, { silent = true })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- Tab settings
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.background = "dark"

-- File specific tab settings
local function set_tab_width(width)
    vim.opt_local.shiftwidth = width
    vim.opt_local.tabstop = width
    vim.opt_local.softtabstop = width
    vim.opt_local.expandtab = true
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "javascript", "typescript", "typescriptreact", "html" },
    callback = function()
        set_tab_width(2)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        set_tab_width(4)
    end,
})

-- Buffer ordering
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "BufferOrderByBufferNumber",
})

-- Completion menu behavior
vim.keymap.set("i", "<CR>", function()
    return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })

-- Snacks.nvim picker
vim.keymap.set("n", "<C-f>", function() require("snacks").picker.smart() end, { silent = true })
vim.keymap.set("n", "<C-e>", function() require("snacks").picker.buffers() end, { silent = true })
vim.keymap.set("n", "grr", function() require("snacks").picker.lsp_references() end, { silent = true })
vim.keymap.set("n", "gd", function() require("snacks").picker.lsp_definitions() end, { silent = true })
vim.keymap.set("n", "gI", function() require("snacks").picker.lsp_implementations() end, { silent = true })
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { silent = true })

-- Conform.nvim formatting
vim.keymap.set("n", "==", function() require("conform").format() end, { silent = true })

-- Terminal mode escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })
