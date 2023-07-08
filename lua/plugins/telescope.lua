return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = {
      "Telescope find_files",
      "Telescope grep_string",
      "Telescope live_grep",
      "Telescope diagnostics",
      "Telescope help_tags",
      "Telescope keymaps",
    },
    opts = {
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    },
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end,
    init = function()
      -- local tele = require 'telescope.builtin'
      -- See `:help telescope.builtin`
      -- vim.keymap.set('n', '<leader>?', tele.oldfiles, { desc = '[?] Find recently opened files' })
      -- vim.keymap.set('n', '<leader><space>', tele.buffers, { desc = '[ ] Find existing buffers' })
      --
      -- -- You can pass additional configuration to telescope to change theme, layout, etc.
      -- vim.keymap.set('n', '<leader>/', function()
      --   require('telescope.builtin')
      --       .current_buffer_fuzzy_find(
      --         require('telescope.themes')
      --         .get_dropdown {
      --           winblend = 10,
      --           previewer = false,
      --         }
      --       )
      -- end, { desc = '[/] Fuzzily search in current buffer' })

      -- vim.keymap.set('n', '<leader>gf', tele.git_files, { desc = 'Search [G]it [F]iles' })
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    -- NOTE: If you are having trouble with this installation,
    --     refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
