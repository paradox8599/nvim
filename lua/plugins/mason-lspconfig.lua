return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp" },
    event = "VeryLazy",
    opts = {
        ensure_installed = {
            "lua_ls",
            "pyright",
        },
    },
    config = function()
        -- ensore non-lsps are installed (formatter/linter/...)
        -- https://github.com/williamboman/mason-lspconfig.nvim/issues/113
        local registry = require("mason-registry")
        local nonLSPs = {
            "black",
            "isort",
            "stylua",
        }
        for _, pkg_name in pairs(nonLSPs) do
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
