local nmap = function(keys, func, desc, opts)
  if not opts then opts = {} end
  opts['desc'] = desc
  opts['silent'] = true
  vim.keymap.set('n', keys, func, opts)
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

nmap('<C-j>', '<C-w>j', 'Window down')
nmap('<C-k>', '<C-w>k', 'Window up')
nmap('<C-h>', '<C-w>h', 'Window left')
nmap('<C-l>', '<C-w>l', 'Window right')

nmap('<Esc>', ':noh<CR>', 'Remove highlight')
nmap('<Leader>e', ':Neotree toggle<CR>', '[E]xplorer')
nmap('<A-F>', ':Format<CR>', 'Format')

nmap('<Leader>,', ':Lazy<CR>', 'lazy.nvim')
nmap('<Leader>M', ':Mason<CR>', 'Mason')

nmap('<Leader>bd', ':bd | bd #<CR>', 'Buffer delete')


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

  ["<Leader>"] = {
    w = {
      name = "[W]indow",
      c = { "<C-w>c", "[C]lose window" }
    }
  }
}

return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      wk.register(keymaps)
    end
  },
}
