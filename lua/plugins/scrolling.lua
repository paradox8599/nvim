return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    enabled = false and not vim.g.neovide,
    opts = {
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing = "linear", -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
    },
  },

  {
    "gen740/SmoothCursor.nvim",
    enabled = true and not vim.g.neovim,
    opts = {
      type = "default", -- default, exp, matrix
      fancy = {
        enable = true,
        -- ▷
        head = false,
        -- head = { cursor = nil, texthl = "SmoothCursor", linehl = nil },
        body = {
          { cursor = "󰝥", texthl = "SmoothCursorAqua" },
          { cursor = "󰝥", texthl = "SmoothCursorAqua" },
          { cursor = "●", texthl = "SmoothCursorAqua" },
          { cursor = "●", texthl = "SmoothCursorAqua" },
          { cursor = "•", texthl = "SmoothCursorAqua" },
          { cursor = ".", texthl = "SmoothCursorAqua" },
          { cursor = ".", texthl = "SmoothCursorAqua" },
        },
      },
      speed = 75,
    },
  },
}
