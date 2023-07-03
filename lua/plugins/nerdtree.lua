return {
    {
        "preservim/nerdtree",
        dependencies = { "ryanoasis/vim-devicons", "Xuyuanp/nerdtree-git-plugin" },
        event = "VeryLazy",
        cmd = { "NERDTree" },
        keys = {
            { "<leader>t", ":NERDTreeFocus<cr>",  desc = "NerdTree Focus" },
            { "<leader>e", ":NERDTreeToggle<cr>", desc = "NerdTree Toggle" },
            { "<leader>l", ":NERDTreeFind<cr>",   desc = "NerdTree Locate File" },
        },
        init = function()
            vim.cmd([[
                " Show line numbers
                let NERDTreeShowLineNumbers=1
                autocmd FileType nerdtree setlocal relativenumber

                " Exit Vim if NERDTree is the only window remaining in the only tab.
                autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

                " " Start NERDTree. If a file is specified, move the cursor to its window.
                " autocmd StdinReadPre * let s:std_in=1
                " autocmd VimEnter * NERDTree
                " autocmd VimEnter * if argc() > 0 || exists("s:std_in") | wincmd p | endif
            ]])
        end,
        config = function()
            vim.cmd([[
                " https://github.com/ryanoasis/vim-devicons/issues/215
                call webdevicons#refresh()

                " File type highlight
                " https://github.com/zeorin/dotfiles/blob/e01cebf/.vimrc#L864-L900

                " https://michurin.github.io/xterm256-color-picker
                let g:sol = {
                    \"gui": {
                        \"base03": "#002b36",
                        \"base02": "#073642",
                        \"base01": "#586e75",
                        \"base00": "#657b83",
                        \"base0": "#839496",
                        \"base1": "#93a1a1",
                        \"base2": "#eee8d5",
                        \"base3": "#fdf6e3",
                        \"yellow": "#b58900",
                        \"orange": "#cb4b16",
                        \"red": "#dc322f",
                        \"magenta": "#d33682",
                        \"violet": "#6c71c4",
                        \"blue": "#268bd2",
                        \"cyan": "#2aa198",
                        \"green": "#719e07"
                    \},
                    \"cterm": {
                        \"base03": 8,
                        \"base02": 0,
                        \"base01": 10,
                        \"base00": 11,
                        \"base0": 12,
                        \"base1": 14,
                        \"base2": 7,
                        \"base3": 15,
                        \"yellow": 3,
                        \"orange": 9,
                        \"red": 1,
                        \"magenta": 5,
                        \"violet": 61,
                    \"blue": 33,
                    \"cyan": 45,
                    \"green": 2
                \}
            \}
            let g:devicons_colors = {
                    \'normal': ['', '', '', '', ''],
                    \'emphasize': ['', '', '', '', '', '', '', '', ''],
                    \'yellow': ['', '', '', ''],
                    \'orange': ['', '', '', 'λ', '', ''],
                    \'red': ['', '', '', '', '', '', '', '', ''],
                    \'magenta': [''],
                    \'violet': ['', '', '', ''],
                    \'blue': ['', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                    \'cyan': ['', '', '', ''],
                    \'green': ['', '', '', '']
            \}
            function! DeviconsColors(config)
                let colors = keys(a:config)
                augroup devicons_colors
                    autocmd!
                    for color in colors
                        if color == 'normal'
                            exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
                                \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                                \ 'else | '.
                                \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                                \ 'endif'
                        elseif color == 'emphasize'
                            exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
                                \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                                \ 'else | '.
                                \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                                \ 'endif'
                        else
                            exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
                        endif
                        exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
                    endfor
                augroup END
            endfunction
            call DeviconsColors(g:devicons_colors)
            ]])
        end,
    },
}
