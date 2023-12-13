local is_not_vscode = function() return vim.g.vscode == nil end
return {
  {
    'tomasiser/vim-code-dark',
    priority = 1000,
    enabled = is_not_vscode,
    config = function()
      vim.cmd.colorscheme('codedark')
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'rose-pine'
  --   end
  -- },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    enabled = is_not_vscode,
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
      }
    },
  }
}
