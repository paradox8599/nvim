local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('<C-j>', '<C-w>j', 'Window down')
nmap('<C-k>', '<C-w>k', 'Window up')
nmap('<C-h>', '<C-w>h', 'Window left')
nmap('<C-l>', '<C-w>l', 'Window right')

nmap('<Esc>', ':noh<CR>')
nmap('<Leader>e', ':Neotree toggle<CR>', '[E]xplorer')

return {}
