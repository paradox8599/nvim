return {
    "preservim/nerdtree",
    cmd = { "NERDTree" },
    keys = {
        { "<leader>e", ":NERDTreeToggle<cr>", desc = "Nerdtree" },
        { "<leader>l", ":NERDTreeFind<cr>",   desc = "Locate buffer in Nerdtree" },
    },
    init = function ()
        vim.cmd([[
            " Show line numbers
            let NERDTreeShowLineNumbers=1
            autocmd FileType nerdtree setlocal relativenumber

            " Exit Vim if NERDTree is the only window remaining in the only tab.
            autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
        ]])
    end
}
