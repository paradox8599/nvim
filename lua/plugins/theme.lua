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

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
    config = function()
      vim.diagnostic.config { virtual_text = false }
      require("tiny-inline-diagnostic").setup {
        -- preset: "modern", "classic", "minimal", "powerline", ghost", "simple", "nonerdfont", "amongus"
        preset = "modern",
        options = {
          -- Show the source of the diagnostic.
          show_source = false,

          -- Use your defined signs in the diagnostic config table.
          use_icons_from_diagnostic = true,

          -- Add messages to the diagnostic when multilines is enabled
          add_messages = true,

          throttle = 0,

          -- The minimum length of the message, otherwise it will be on a new line.
          softwrap = 30,

          -- If multiple diagnostics are under the cursor, display all of them.
          multiple_diag_under_cursor = true,

          multilines = { enabled = true, always_show = true },

          -- Show all diagnostics on the cursor line.
          show_all_diags_on_cursorline = true,

          -- Enable diagnostics on Insert mode. You should also se the `throttle` option to 0, as some artefacts may appear.
          enable_on_insert = true,

          -- warp, none, oneline
          overflow = { mode = "wrap" },

          -- Format the diagnostic message.
          -- Example:
          -- format = function(diagnostic)
          --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
          -- end,
          format = nil,

          --- Enable it if you want to always have message with `after` characters length.
          break_line = { enabled = false, after = 30 },

          virt_texts = { priority = 2048 },

          -- Filter by severity.
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
          },
        },
      }
    end,
  },
}
