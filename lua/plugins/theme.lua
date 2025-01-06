return {
  {
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
  },

  {
    "folke/noice.nvim",
    cond = not vim.g.started_by_firenvim,
    event = "VeryLazy",
    opts = {
      lsp = { hover = { enabled = false }, signature = { enabled = false } },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
}
