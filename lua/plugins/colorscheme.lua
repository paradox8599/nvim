return {
    {
        "tomasiser/vim-code-dark",
        event = "VeryLazy",
        priority = 10000,
        init = function()
            vim.cmd([[colorscheme codedark]])
        end,
    },
}
