return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "User AstroFile",
  main = "rainbow-delimiters.setup",
  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require "rainbow-delimiters"

    -- vim.api.nvim_set_hl(0, "iblWhite", { fg = "#ffffff" })

    -- @type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      priority = {
        [""] = 110,
        lua = 210,
      },
      highlight = {
        -- "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterViolet",
        -- "RainbowDelimiterGreen",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
