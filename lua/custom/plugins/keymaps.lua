local nmap = function(keys, func, desc, opts)
  if not opts then opts = {} end
  opts['desc'] = desc
  vim.keymap.set('n', keys, func, opts)
end

nmap('<C-j>', '<C-w>j', 'Window down')
nmap('<C-k>', '<C-w>k', 'Window up')
nmap('<C-h>', '<C-w>h', 'Window left')
nmap('<C-l>', '<C-w>l', 'Window right')

nmap('<Esc>', ':noh<CR>', 'Remove highlight', { silent = true })
nmap('<Leader>e', ':Neotree toggle<CR>', '[E]xplorer', { silent = true })
nmap('<A-F>', ':Format<CR>', 'Format', { silent = true })

return {}
