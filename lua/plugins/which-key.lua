local opt = { noremap = true, silent = true }

-- keymaps
local mappings = {
    -- auto gj/gk
    ["j"] = { [[v:count ? "j" : "gj"]], "Auto gj", expr = true },
    ["k"] = { [[v:count ? "k" : "gk"]], "Auto gk", expr = true },

    ["<leader>"] = {
        ["w"] = { "<C-w>c", "Close window" },
        [","] = { ":Lazy<cr>", "Lazy" },
        ["L"] = { ":Explore<cr>", "Explore" },
    }
}

vim.keymap.set("n", "\\", ":noh<cr>", opt)
vim.keymap.set("n", "<C-s>", ":w<cr>", opt)

-- cursor move
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        wk.register(mappings, opt)
    end,
    opts = {}
}
