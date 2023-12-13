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
vim.keymap.set('n', '<C-h>', vim.cmd.bprevious, { desc = 'Buffer prev' })
vim.keymap.set('n', '<C-l>', vim.cmd.bnext, { desc = 'Buffer next' })
vim.keymap.set('n', '<C-k>', ':b#<cr>', { desc = 'Last buffer' })
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
    g = '[G]it signs',
    s = '[S]earch/[S]ession',
    q = 'Persistence',
    x = 'Trouble',
    L = { vim.cmd.Lazy, 'Lazy.nvim' },
    M = { vim.cmd.Mason, 'Mason' },
    e = { ':Neotree toggle<cr>', '[E]xplorer' }, -- TODO: toggle if focus, otherwise focus
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
      name = '[W]indow',
      d = { vim.cmd.close, 'Close window' },
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
