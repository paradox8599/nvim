return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp" },
    event = "VeryLazy",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
            },
        })
        -- ensore non-lsps are installed (formatter/linter/...)
        -- https://github.com/williamboman/mason-lspconfig.nvim/issues/113
        local registry = require("mason-registry")
        local pkgs = {
            "black",
            "isort",
            "stylua",
        }
        for _, pkg_name in pairs(pkgs) do
            local ok, pkg = pcall(registry.get_package, pkg_name)
            if ok then
                if not pkg:is_installed() then
                    pkg:install()
                end
            end
        end

        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Lua

        lsp.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    format = {
                        enable = true,
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "4",
                        },
                    },

                    completion = { callSnippet = "Replace" },
                    version = "LuaJIT",
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false, -- Disable annoying prompt which popup every time open vim
                    },
                    telemetry = { enable = false },
                },
            },
        })

        -- Python
        lsp.pyright.setup({
            capabilities = capabilities,
        })
    end,
}
