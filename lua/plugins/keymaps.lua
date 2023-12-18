local map = vim.keymap.set
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map({ 'n', 'i' }, '<C-s>', '<Esc> | <cmd>w<cr>', { silent = true })

-- keep cursor position when doing 'J'
map('n', 'J', 'mzJ`z')

-- keep search term highlight in the middle
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- keep vim clipboard after paste
map({ 'n', 'v' }, '<leader>p', '"_dP', { desc = 'Paste without copy' })

-- copy to system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })

-- use J/K to move selected lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Ctrl + hjkl to move between windows
map('n', '<Tab>', vim.cmd.bnext, { desc = 'Buffer next' })
map('n', '<S-Tab>', ':b#<cr>', { desc = 'Buffer prev' })
-- map('n', '<C-k>', ':b#<cr>', { desc = 'Last buffer' })

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map({ 'n' }, '<C-n>', ':Neotree toggle<cr>')

-- Default opts
-- {
--   mode = "n", -- NORMAL mode
--   -- prefix: use "<leader>f" for example for mapping everything related to finding files
--   -- the prefix is prepended to every mapping part of `mappings`
--   prefix = "",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = false, -- use `nowait` when creating keymaps
--   expr = false, -- use `expr` when creating keymaps
-- }
local keymaps = {
  ['<Esc>'] = { vim.cmd.noh, 'Remove highlight' },
  -- word wrap
  k = { "v:count == 0 ? 'gk' : 'k'", 'Auto gk', expr = true },
  j = { "v:count == 0 ? 'gj' : 'j'", 'Auto gj', expr = true },
  -- git conflict
  c = {
    t = '[T]heirs',
    o = '[O]urs',
    b = '[B]oth',
    n = '[N]one',
  },
  g = {
    p = '[P]eek definition~',
  },
  ['<leader>'] = {
    g = {
      name = '[G]it',
      x = { ':silent! OpenGitHubUrlUnderCursor<cr>', 'Open plugin github page' }
    },
    s = '[S]earch/[S]ession',
    q = 'Persistence',
    x = 'Trouble',
    L = { vim.cmd.Lazy, 'Lazy.nvim' },
    M = { vim.cmd.Mason, 'Mason' },
    e = { ':Neotree focus<cr>', '[E]xplorer' },
    b = {
      name = '[B]uffer',
      d = { ':bd<cr>', '[D]elete' },
      o = { ':%bd|e#|bd#<cr>', 'Delete all [O]ther buffers' }
    },
    t = {
      name = '[T]ab',
      d = { vim.cmd.tabclose, 'Close Tab' },
      n = { vim.cmd.tabnew, '[N]ew Tab' },
      h = { ':gT<cr>', 'Tab prev' },
      l = { ':gt<cr>', 'Tab next' },
    },
    w = {
      name = '[W]indow / [W]hich key',
      d = { vim.cmd.close, 'Close window' },
      r = { '<cmd>vs#<cr>', '[R]estore closed window' },
      k = { vim.cmd.WhichKey, 'Which [K]ey' },
    },
  },
}


return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').register(keymaps)
    end,
  },
}
