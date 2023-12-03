return {
  "folke/persistence.nvim",
  -- this will only start session saving when an actual file was opened
  event = "BufReadPre",
  opts = {
    -- directory where session files are saved
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
    -- session options used for saving
    options = { "buffers", "curdir", "tabpages", "winsize" },
    -- a function to call before saving the session
    pre_save = nil,
    -- don't save if there are no open file buffers
    save_empty = false,
  },
  init = function()
    local p = require('persistence')
    -- restore the session for the current directory
    vim.keymap.set("n", "<leader>qL", p.load,
      { desc = "[L]oad session for current dir" })
    -- restore the last session
    vim.keymap.set("n", "<leader>ql",
      function() p.load({ last = true }) end,
      { desc = "[L]oad last session" })

    -- stop Persistence => session won't be saved on exit
    vim.keymap.set("n", "<leader>qd", p.stop,
      { desc = "[D]isable current session persistence" })

  end
}
