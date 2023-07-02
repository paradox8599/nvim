return {
    {
        "preservim/nerdtree",
        dependencies = { "ryanoasis/vim-devicons" },
        cmd = { "NERDTree" },
        keys = {
            { "<leader>t", ":NERDTreeFocus<cr>",  desc = "NerdTree Focus" },
            { "<leader>e", ":NERDTreeToggle<cr>", desc = "NerdTree Toggle" },
            { "<leader>l", ":NERDTreeFind<cr>",   desc = "NerdTree Locate File" },
        },
        config = function()
            vim.cmd([[
            " Show line numbers
            let NERDTreeShowLineNumbers=1
            autocmd FileType nerdtree setlocal relativenumber

            " Exit Vim if NERDTree is the only window remaining in the only tab.
            autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

            " https://github.com/ryanoasis/vim-devicons/issues/215
            call webdevicons#refresh()
        ]])
        end
    },
}
