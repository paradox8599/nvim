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
      { '<leader>sg', ':Telescope live_grep<CR>',  desc = 'Search by [G]rep' },
      {
        '<leader>sd',
        ':Telescope diagnostics<CR>',
        desc = 'Search [D]iagnostics',
      },
      { '<leader>sh', ':Telescope help_tags<CR>', desc = 'Search [H]elp' },
      { '<leader>sk', ':Telescope keymaps<CR>',   desc = 'Search [K]eymaps' },
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
      {
        '<leader>sS',
        ':Telescope file_browser<CR>',
        noremap = true,
        desc = 'File browser'
      },
      {
        '<leader>ss',
        ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
        noremap = true,
        desc = 'File browser from current path'
      }
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
      local t = require('telescope')
      pcall(t.load_extension, 'fzf')
      pcall(t.load_extension, 'file_browser')
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
  {
    -- https://github.com/nvim-telescope/telescope-file-browser.nvim
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }
}
