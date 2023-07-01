return {
    {
        "tomasiser/vim-code-dark",
        event = "VeryLazy",
        priority = 10000,
        config = function()
            vim.cmd([[colorscheme codedark]])
        end
    }
}
