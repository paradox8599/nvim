return {
  { 'tpope/vim-fugitive', cmd = { 'Git' }, },
  { 'tpope/vim-rhubarb',  event = 'VeryLazy', },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[h', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = 'Go to Previous [H]unk' })
        vim.keymap.set('n', ']h', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = 'Go to Next [H]unk' })
        vim.keymap.set('n', '<leader>gv', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Pre[v]iew Hunk' })
      end,
    },
  },
}
