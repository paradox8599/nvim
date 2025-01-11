return {
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
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
