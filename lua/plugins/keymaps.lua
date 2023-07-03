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
        -- desc
        ["x"] = "Trouble",
        ["h"] = "Git gutter",
        ["u"] = "Persistent",

        -- UI shortcuts
        [","] = { ":Lazy<cr>", "Lazy" },
        ["M"] = { ":Mason<cr>", "Mason" },
        ["L"] = { ":Explore<cr>", "Explore" },

        ["w"] = { "<C-w>c", "Close window" },

        -- buffers
        ["q"] = { ":bw<cr>", "Close current buffer" },

        -- trouble
        ["xx"] = { ":TroubleToggle<cr>", "Trouble toggle" },
        ["xw"] = { ":TroubleToggle workspace_diagnostics<cr>", "Trouble toggle workspace diag" },
        ["xd"] = { ":TroubleToggle document_diagnostics<cr>", "Trouble toggle document diag" },
        ["xl"] = { ":TroubleToggle loclist<cr>", "Trouble toggle loc list" },
        ["xq"] = { ":TroubleToggle quickfix<cr>", "Touble toggle quick fix" },
    },
    ["gr"] = { ":TroubleToggle lsp_references<cr>", "Trouble toggle lsp ref" },

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
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
        vim.keymap.set("n", "gR", vim.lsp.buf.references, { buffer = ev.buf, desc = "Go to references" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })

        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
        vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
        vim.keymap.set("n", "<C-f>", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = "Format" })

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })

        vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add workspace folder" })
        vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder,
            { buffer = ev.buf, desc = "Remove workspace folder" })
        vim.keymap.set("n", "gwl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = "List workspace folder" })
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
