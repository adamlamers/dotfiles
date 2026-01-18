vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- vim-plug
local Plug = vim.fn["plug#"]
local Plug_Begin = vim.fn["plug#begin"]
local Plug_End = vim.fn["plug#end"]
Plug_Begin()
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("sainnhe/gruvbox-material")
Plug("romgrk/barbar.nvim")
Plug("neovim/nvim-lspconfig")
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")
Plug("ibhagwan/fzf-lua")
Plug("nvim-treesitter/nvim-treesitter")
Plug_End()

vim.cmd.source("$HOME/.config/nvim/binds.vim")
vim.cmd.source("$HOME/.config/nvim/sys.vim")
vim.cmd.colorscheme("gruvbox-material")

vim.opt.completeopt = {'menu', 'menuone', 'noinsert'}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable vim.lsp.completion',
  callback = function(event)
    local client_id = vim.tbl_get(event, 'data', 'client_id')
    if client_id == nil then
      return
    end

    vim.lsp.completion.enable(true, client_id, event.buf, {autotrigger = true})

    -- Trigger lsp completion manually using Ctrl + Space
    vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.completion.get()<cr>')
  end
})

require("mason").setup()

require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = {
        "ty",
        "lua_ls",
        "ruff",
        "rust_analyzer"
    },
})

-- nvim-tree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('nvim-treesitter').setup({
    ensure_installed = {
        "python",
        "typescript",
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
})
