-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- keep cursor position when doing 'J'
vim.keymap.set('n', 'J', 'mzJ`z')
-- keep search term highlight in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- keep vim clipboard after paste
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dP', { desc = 'Paste without copy' })
-- copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
-- use J/K to move selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Ctrl + hjkl to move between windows
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
-- Ctrl + Shift + hjkl to move between buffers
vim.keymap.set('n', '<leader>bj', vim.cmd.bfirst, { desc = 'Buffer first' })
vim.keymap.set('n', '<leader>bk', vim.cmd.blast, { desc = 'Buffer last' })
vim.keymap.set('n', '<leader>bh', vim.cmd.bprevious, { desc = 'Buffer previous' })
vim.keymap.set('n', '<leader>bl', vim.cmd.bnext, { desc = 'Buffer next' })
-- Action shortcuts
vim.keymap.set('n', '<Esc>', vim.cmd.noh, { desc = 'Remove highlight' })
-- UI shortcuts
vim.keymap.set('n', '<leader>L', vim.cmd.Lazy, { desc = 'lazy.nvim' })
vim.keymap.set('n', '<leader>M', vim.cmd.Mason, { desc = 'Mason' })

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
  -- Remap for dealing with word wrap
  k = { "v:count == 0 ? 'gk' : 'k'", 'Auto gk', expr = true },
  j = { "v:count == 0 ? 'gj' : 'j'", 'Auto gj', expr = true },
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
    g = '[G]it signs',
    s = '[S]earch/[S]ession',
    q = 'Persistence',
    x = 'Trouble',
    -- TODO: toggle if focus, otherwise focus
    e = { ':Neotree toggle<CR>', '[E]xplorer' },
    b = {
      name = '[B]uffer',
      d = { ':bd | bd #<CR>', '[D]elete' },
    },
    t = {
      name = '[T]ab',
      d = { vim.cmd.tabclose, 'Close Tab' },
      n = { vim.cmd.tabnew, '[N]ew Tab' },
    },
    w = {
      name = '[W]indow',
      d = { vim.cmd.close, 'Close window' },
      n = { vim.cmd.new, '[N]ew window' },
      r = { [[<cmd>vs#<cr>]], '[R]estore closed window' },
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
