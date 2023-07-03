return {
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "GBrowse" },
        init = function()
            vim.cmd.cnoreabbrev([[git Git]])
            vim.cmd.cnoreabbrev([[gb GBrowse]])
        end,
    },
    {
        "tpope/vim-rhubarb",
        dependeicies = { "tpope/vim-fugitive" },
        event = "VeryLazy",
    },
    {
        "rhysd/conflict-marker.vim",
        event = "VeryLazy",
        priority = 9998,
        config = function()
            -- Hex color not working, use terminal color instead
            -- https://github.com/rhysd/conflict-marker.vim/issues/17
            vim.cmd([[
            let g:conflict_marker_highlight_group = ''

            let g:conflict_marker_begin = '^<<<<<<< .*$'
            let g:conflict_marker_end   = '^>>>>>>> .*$'

            " https://michurin.github.io/xterm256-color-picker
            highlight ConflictMarkerBegin ctermbg=29
            highlight ConflictMarkerOurs ctermbg=22
            highlight ConflictMarkerTheirs ctermbg=24
            highlight ConflictMarkerEnd ctermbg=31
            highlight ConflictMarkerSeparator ctermbg=234
            highlight ConflictMarkerCommonAncestorsHunk ctermbg=yellow

            " highlight ConflictMarkerSplit guibg=#ffffff
            " highlight ConflictMarkerBegin guibg=#2f7366
            " highlight ConflictMarkerOurs guibg=#2e5049
            " highlight ConflictMarkerTheirs guibg=#344f69
            " highlight ConflictMarkerEnd guibg=#2f628e
            " highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
        ]])
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            attach_to_untracked = true,
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 500,
            },

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk)
                map("n", "<leader>hr", gs.reset_hunk)
                map("v", "<leader>hs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                map("v", "<leader>hr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                map("n", "<leader>hS", gs.stage_buffer)
                map("n", "<leader>hu", gs.undo_stage_hunk)
                map("n", "<leader>hR", gs.reset_buffer)
                map("n", "<leader>hp", gs.preview_hunk)
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end)
                map("n", "<leader>htb", gs.toggle_current_line_blame)
                map("n", "<leader>hd", gs.diffthis)
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end)
                map("n", "<leader>htd", gs.toggle_deleted)

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        },
    },
}
