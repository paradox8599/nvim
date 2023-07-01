return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp" },
    event = "VeryLazy",
    opts = {
        ensure_installed = {
            "lua_ls",
            "pyright",
            "black",
            "isort",
        }
    },
    config = function()
        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities(),

            -- Lua

            lsp.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
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
        lsp.pyright.setup {
            capabilities = capabilities,
        }
    end
}
