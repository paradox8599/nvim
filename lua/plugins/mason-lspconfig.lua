return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    event = "VeryLazy",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
            }
        })
        local lsp = require("lspconfig")

        -- Lua
        lsp.lua_ls.setup {
            settings = {
                Lua = {
                    version = "LuaJIT",
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false, -- Disable annoying prompt which popup every time open vim
                    },
                    telemetry = { enable = false }
                }
            }
        }

        -- Python
        lsp.pyright.setup {}

        require("lsp")
    end
}
