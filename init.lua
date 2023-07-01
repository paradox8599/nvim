vim.o.number = true
vim.o.relativenumber = true

-- vim.o.clipboard = "unnamed"

-- highlight after copy
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
     pattern = { "*" },
     callback = function ()
             vim.highlight.on_yank({
                     timeout = 300,
             })
     end,
})

vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
