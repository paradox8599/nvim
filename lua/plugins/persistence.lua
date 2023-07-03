return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
        init = function()
            -- restore the session for the current directory
            vim.keymap.set("n", "<leader>uw", ":lua require('persistence').load()<cr>",
                { desc = "Restore session for the current directory" })

            -- restore the last session
            vim.keymap.set("n", "<leader>ut", ":lua require('persistence').load({ last = true })<cr>",
                { desc = "Restore last session" })

            -- stop Persistence => session won't be saved on exit
            vim.keymap.set("n", "<leader>ud", ":lua require('persistence').stop()<cr>",
                { desc = "Stop current session" })
        end
    }
}
