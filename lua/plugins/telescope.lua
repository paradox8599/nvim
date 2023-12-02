return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>sf', ':Telescope find_files<CR>', desc = 'Search [F]iles' },
      {
        '<leader>sw',
        ':Telescope grep_string<CR>',
        desc = 'Search current [W]ord',
      },
      { '<leader>sg', ':Telescope live_grep<CR>', desc = 'Search by [G]rep' },
      {
        '<leader>sd',
        ':Telescope diagnostics<CR>',
        desc = 'Search [D]iagnostics',
      },
      { '<leader>sh', ':Telescope help_tags<CR>', desc = 'Search [H]elp' },
      { '<leader>sk', ':Telescope keymaps<CR>', desc = 'Search [K]eymaps' },
      {
        '<leader>so',
        ':Telescope oldfiles<CR>',
        desc = 'Search [O]ld files',
      },
      { '<leader>sb', ':Telescope buffers<CR>', desc = 'Search [B]uffers' },
      {
        '<leader>sz',
        ':Telescope current_buffer_fuzzy_find previewer=false<CR>',
        desc = 'Fu[z]zily search in current buffer',
      },
      -- { '<leader>?', ':Telescope git_files<CR>', desc = 'Search Git Files' },
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
      return vim.fn.executable('make') == 1
    end,
  },
}
