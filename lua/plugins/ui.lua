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
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    -- opts = {
    --   indent = {
    --     highlight = { "CursorColumn", "Whitespace", },
    --     char = "┊"
    --   },
    --   whitespace = {
    --     highlight = { "CursorColumn", "Whitespace", },
    --     remove_blankline_trail = false,
    --   },
    --   scope = { enabled = false },
    -- },
    config = function()
      local highlight = {
        "iblRed",
        "iblYellow",
        "iblBlue",
        "iblOrange",
        "iblGreen",
        "iblViolet",
        "iblCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "iblRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "iblYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "iblBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "iblOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "iblGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "iblViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "iblCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup({
        indent = {
          highlight = highlight,
          char = '┊'
        },
      })
    end
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
      local kopts = { noremap = true, silent = true }
      vim.keymap.set('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.keymap.set('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.keymap.set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    end
  }
}
