-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy_init')

-- For additional information see:
-- https://github.com/folke/lazy.nvim#-structuring-your-plugins
require('lazy').setup({
  { import = 'plugins' },
  { import = 'plugins.code' },
  { import = 'plugins.qol' },
})

vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'         -- Enable mouse mode
-- vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true  -- Enable break indent
vim.o.undofile = true     -- Save undo history
vim.o.ignorecase = true   -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250    -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true             -- NOTE: You should make sure your terminal supports this

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
