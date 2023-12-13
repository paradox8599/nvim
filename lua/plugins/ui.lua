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
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    opts = {
      hide_cursor = false,         -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = true,    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = 'sine',    -- Default easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil,             -- Function to run after the scrolling animation ends
      performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    },
  }
}
