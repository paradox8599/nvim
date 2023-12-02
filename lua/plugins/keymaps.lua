local nmap = function(keys, func, desc, opts)
  if not opts then
    opts = {}
  end
  opts['desc'] = desc
  opts['silent'] = true
  vim.keymap.set('n', keys, func, opts)
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- keep cursor position when doing 'J'
nmap('J', 'mzJ`z')
-- keep search term highlight in the middle
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')
-- keep vim clipboard after paste
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dP', { desc = 'Paste without copy' })
-- copy to system clipboard
vim.keymap.set(
  { 'n', 'v' },
  '<leader>y',
  '"+y',
  { desc = 'Copy to system clipboard' }
)

-- use J/K to move selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

nmap('<C-j>', '<C-w>j', 'Window down')
nmap('<C-k>', '<C-w>k', 'Window up')
nmap('<C-h>', '<C-w>h', 'Window left')
nmap('<C-l>', '<C-w>l', 'Window right')
nmap('<Esc>', vim.cmd.noh, 'Remove highlight')
nmap('<A-F>', vim.lsp.buf.format, 'Format')

nmap('<leader>L', vim.cmd.Lazy, 'lazy.nvim')
nmap('<leader>M', vim.cmd.Mason, 'Mason')

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

  ['<leader>'] = {
    g = '[G]it',
    h = { 'gT', 'Tab left' },
    l = { 'gt', 'Tab right' },
    s = '[S]earch',
    c = '[C]ode',
    -- TODO: toggle if focus, otherwise focus
    e = { ':Neotree toggle<CR>', '[E]xplorer' },
    b = {
      name = '[B]uffer',
      d = { ':bd | bd #<CR>', '[D]elete' },
    },
    w = {
      name = '[W]indow',
      d = { '<C-w>c', 'Close window' },
      D = { ':windo bd<CR>', 'Close tab' }
    },
  },
}

return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.register(keymaps)
    end,
  },
}
