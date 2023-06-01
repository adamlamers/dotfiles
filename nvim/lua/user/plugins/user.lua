return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "tanvirtin/monokai.nvim",
    lazy = false
  },
  {
    "ojroques/nvim-osc52",
    lazy = false,
    config = function()
      require('osc52').setup{
        trim = true
      }
      local function copy()
        if vim.v.event.operator == 'y' and vim.v.event.regname == 'a' then
          require('osc52').copy_register('a')
        end
      end
      vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
    end
  }
}
