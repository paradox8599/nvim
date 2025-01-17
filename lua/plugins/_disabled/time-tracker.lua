return {
  {
    "3rd/time-tracker.nvim",
    event = "VeryLazy",

    dependencies = {
      "3rd/sqlite.nvim",
    },

    keys = {
      { "<leader>ts", "<cmd>TimeTracker<cr>", mode = { "n" }, desc = "Show time spent" },
    },

    opts = {
      data_file = vim.fn.stdpath "data" .. "/time-tracker.db",
      tracking_events = { "BufEnter", "BufWinEnter", "CursorMoved", "CursorMovedI", "WinScrolled" },
      tracking_timeout_seconds = 5 * 60, -- 5 minutes
    },
  },
}
