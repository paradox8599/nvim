return {
    "preservim/nerdtree",
    cmd = { "NERDTree" },
    keys = {
        { "<leader>e", ":NERDTreeToggle<cr>", desc = "Nerdtree" },
        { "<leader>l", ":NERDTreeFind<cr>",   desc = "Locate buffer in Nerdtree" },
    },
    config = function ()
        vim.cmd([[
            " Show line numbers
            let NERDTreeShowLineNumbers=1
            autocmd FileType nerdtree setlocal relativenumber
        ]])
    end
}
