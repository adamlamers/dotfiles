vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
    vim.cmd('silent !curl -fLo ' ..
        data_dir ..
        '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- vim-plug
local Plug = vim.fn["plug#"]
local Plug_Begin = vim.fn["plug#begin"]
local Plug_End = vim.fn["plug#end"]
Plug_Begin()
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("neovim/nvim-lspconfig")
Plug("sainnhe/gruvbox-material")
Plug("romgrk/barbar.nvim")
Plug("mason-org/mason.nvim")
Plug("mason-org/mason-lspconfig.nvim")
Plug("nvim-treesitter/nvim-treesitter")
Plug("ray-x/lsp_signature.nvim")
Plug("folke/snacks.nvim")
Plug("folke/neodev.nvim")
Plug("stevearc/conform.nvim")
Plug("kylechui/nvim-surround")
Plug_End()

require("binds")
require("sys")

vim.cmd.colorscheme("gruvbox-material")
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert' }

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Enable vim.lsp.completion',
    callback = function(event)
        local client_id = vim.tbl_get(event, 'data', 'client_id')
        if client_id == nil then
            return
        end

        vim.lsp.completion.enable(true, client_id, event.buf, { autotrigger = true })

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
        "rust_analyzer",
        "ts_ls",
    },
})

-- nvim-tree
require("nvim-tree").setup({
    sync_root_with_cwd = true,
    actions = {
        change_dir = {
            enable = true,
            global = true,
        }
    },
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

require("lsp_signature").setup({
    bind = true,

    floating_window = true,
    floating_window_above_cur_line = true,

    hint_enable = false,
    hint_prefix = "",
    handler_opts = {
        border = "rounded"
    },
    toggle_key = "<C-k>", -- Press Ctrl+k to toggle signature help
    trigger_on_newline = false,
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 80,

    always_trigger = false,
    auto_close_after = nil,
    extra_trigger_chars = { ")" }, -- Empty to not auto-trigger
})

require("snacks").setup({
    picker = {
        enabled = true,
        sources = {
            explorer = {
                win = {
                    list = {
                        keys = {
                            ["o"] = { "confirm", mode = { "n" } },
                        }
                    }
                }
            }
        }
    },
    explorer = {
        enabled = true,
        replace_netrw = true,
        reveal = false,
    },
    bufdelete = { enabled = true },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },
})

require("nvim-surround").setup()
