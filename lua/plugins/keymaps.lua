local opt = { noremap = true, silent = true }

-- keymaps
local mappings = {
    -- auto gj/gk
    ["j"] = { [[v:count ? "j" : "gj"]], "Auto gj", expr = true },
    ["k"] = { [[v:count ? "k" : "gk"]], "Auto gk", expr = true },

    ["\\"] = { ":noh<cr>", "Clear hightlight" },
    ["<C-s>"] = { ":w<cr>", "Save" },

    -- Cursor moves
    ["<C-l>"] = { "<C-w>l", "" },
    ["<C-h>"] = { "<C-w>h", "" },
    ["<C-j>"] = { "<C-w>j", "" },
    ["<C-k>"] = { "<C-w>k", "" },

    -- custom
    ["<leader>"] = {
        ["w"] = { "<C-w>c", "Close window" },
        [","] = { ":Lazy<cr>", "Lazy" },
        ["L"] = { ":Explore<cr>", "Explore" },
        ["x"] = "Trouble",
        -- tabs
        ["t"] = { "gt", "Next tab" },
        ["e"] = { "gT", "Prev tab" },
        -- buffers
        ["-"] = { ":bw<cr>", "Close current buffer" },
    },
    ["g"] = {
        ["a"] = "Code actions",
    },

    -- trouble
    ["<leader>xx"] = { ":TroubleToggle<cr>", "" },
    ["<leader>xw"] = { ":TroubleToggle workspace_diagnostics<cr>", "" },
    ["<leader>xd"] = { ":TroubleToggle document_diagnostics<cr>", "" },
    ["<leader>xl"] = { ":TroubleToggle loclist<cr>", "" },
    ["<leader>xq"] = { ":TroubleToggle quickfix<cr>", "" },
    ["gr"] = { ":TroubleToggle lsp_references<cr>", "" },

    -- LSP
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    ["ge"] = { vim.diagnostic.open_float, "Floating diagnostic window" },
    ["[d"] = { vim.diagnostic.goto_prev, "Goto prev diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Goto next diagnostic" },
    ["gl"] = { vim.diagnostic.setloclist, "Set diagnostic loc list" },
}

---------
-- LSP --
---------

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<A-F>", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

        vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "gwl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
    end,
})

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        wk.register(mappings, opt)
    end,
    opts = {},
}
