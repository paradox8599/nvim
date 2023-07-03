return
{
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
        require("lazy").load({ plugins = "firenvim", wait = true })
        vim.fn["firenvim#install"](0)
        vim.g.firenvim_config = {
            globalSettings = { takeover = "never" },
        }
        vim.api.nvim_create_autocmd({ 'BufEnter' }, {
            pattern = "github.com_*.txt",
            cmd = "set filetype=markdown"
        })
    end
}
