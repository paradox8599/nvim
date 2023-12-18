-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.o.list = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.cursorline = true
vim.o.wrap = false
vim.o.conceallevel = 0
vim.o.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true

-- set tab width to 4 for specific file extensions
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
  pattern = {},
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- keep cursor position when reopen a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line
    if line "'\"" > 1 and line "'\"" <= line "$" then
      vim.cmd "normal! g'\""
    end
  end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { highlight_group = "Visual", timeout = 200 }
  end,
})
vim.cmd [[set whichwrap+=<,>,[,],h,l]]
vim.cmd [[set iskeyword+=-]]

