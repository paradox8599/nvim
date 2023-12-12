vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.colorcolumn = "80"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.mouse = 'a'        -- Enable mouse mode
-- vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true
vim.o.ignorecase = true  -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.o.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 300   -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 250
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true             -- NOTE: You should make sure your terminal supports this
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.cursorline = true
vim.o.wrap = false
vim.o.virtualedit = 'block'
vim.o.conceallevel = 0
vim.o.signcolumn = 'yes'
-- list
vim.o.list = true
-- vim.o.listchars = ''
-- indentationt
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- window width
-- vim.o.winwidth = 999
-- vim.o.winminwidth = 15

-- set tab width to 4 for specific file extensions
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
  pattern = {},
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end
})

-- keep cursor position when reopen a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line
    if line('\'"') > 1 and line('\'"') <= line('$') then
      vim.cmd('normal! g\'"')
    end
  end
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ highlight_group = "Visual", timeout = 200 })
  end
})


require('lazy_init')
-- https://github.com/folke/lazy.nvim#-structuring-your-plugins
require('lazy').setup({ { import = 'plugins' } })
