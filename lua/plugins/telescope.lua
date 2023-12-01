return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<Leader>sf", ":Telescope find_files<CR>",  desc = "Search [F]iles" },
      { "<Leader>sw", ":Telescope grep_string<CR>", desc = "Search current [W]ord" },
      { "<Leader>sg", ":Telescope live_grep<CR>",   desc = "Search by [G]rep" },
      { "<Leader>sd", ":Telescope diagnostics<CR>", desc = "Search [D]iagnostics" },
      { "<Leader>sh", ":Telescope help_tags<CR>",   desc = "Search [H]elp" },
      { "<Leader>sk", ":Telescope keymaps<CR>",     desc = "Search [K]eymaps" },
      { "<Leader>so", ":Telescope oldfiles<CR>",    desc = "Search [O]ld files" },
      { "<Leader>sb", ":Telescope buffers<CR>",     desc = "Search [B]uffers" },
      {
        "<Leader>sz",
        ":Telescope current_buffer_fuzzy_find previewer=false<CR>",
        desc =
        "Fu[z]zily search in current buffer"
      },
      { "<Leader>?", ":Telescope git_files<CR>", desc = "Search Git Files" },
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
      return vim.fn.executable 'make' == 1
    end,
  },
}
