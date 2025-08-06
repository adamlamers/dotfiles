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
Plug("ibhagwan/fzf-lua")
Plug_End()

vim.cmd.source("$HOME/.config/nvim/binds.vim")
vim.cmd.source("$HOME/.config/nvim/sys.vim")
vim.cmd.colorscheme("gruvbox-material")

require("mason").setup()

vim.lsp.enable("pyright")
-- vim.keymap.set("i", "<C-Space>", function()
--    vim.lsp.completion.get()
-- end)

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
