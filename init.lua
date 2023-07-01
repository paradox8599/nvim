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

local opt = { 
    noremap = true, 
    silent = true 
}
vim.g.mapleader = " "

vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)

vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)

-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/

local gopt = {
    noremap = true, 
    expr = true 
}
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], gopt)
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], gopt)

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

