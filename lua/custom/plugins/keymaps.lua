local nmap = function(keys, func, desc, opts)
  if not opts then opts = {} end
  opts['desc'] = desc
  opts['silent'] = true
  vim.keymap.set('n', keys, func, opts)
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

nmap('<C-j>', '<C-w>j', 'Window down')
nmap('<C-k>', '<C-w>k', 'Window up')
nmap('<C-h>', '<C-w>h', 'Window left')
nmap('<C-l>', '<C-w>l', 'Window right')

nmap('<Esc>', ':noh<CR>', 'Remove highlight')
nmap('<Leader>e', ':Neotree toggle<CR>', '[E]xplorer')
nmap('<A-F>', ':Format<CR>', 'Format')

nmap('<Leader>,', ':Lazy<CR>', 'lazy.nvim')
nmap('<Leader>M', ':Mason<CR>', 'Mason')

return {}
