vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.autoread = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true

-- vim.o.clipboard = "unnamed"

-- highlight after copy
vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = {"*"},
    callback = function()
        vim.highlight.on_yank({
            timeout = 300
        })
    end
})

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
