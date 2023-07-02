return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.completion.spell,

                null_ls.builtins.formatting.stylua,
                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            },
        })
    end,
}
