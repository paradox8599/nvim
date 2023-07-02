return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>f", ":Telescope find_files<cr>", desc = "Find files" },
            { "<leader>g", ":Telescope live_grep<cr>",  desc = "Live grep" },
            { "<leader>p", ":Telescope buffers<cr>",    desc = "Buffers" },
            { "<leader>k", ":Telescope resume<cr>",     desc = "resume" },
            { "<leader>o", ":Telescope oldfiles<cr>",   desc = "Recent files" },
            -- { "<leader>h", ":Telescope help_tags<cr>", desc = "Help tags" },
        },
    },
}
