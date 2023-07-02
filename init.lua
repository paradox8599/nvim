vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.autoread = true

-- https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
vim.o.tabstop = 8       -- tab chars display width
vim.o.shiftwidth = 4    -- spaces per tab key
vim.o.expandtab = true  -- insert spaces when press tab
vim.o.autoindent = true -- align indentation

-- vim.o.clipboard = "unnamed"

require("lazynvim")
require("utils")
