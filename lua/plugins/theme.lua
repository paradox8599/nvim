return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",

    config = function()
      local highlight = {
        -- "iblRed",
        "iblYellow",
        "iblBlue",
        "iblOrange",
        -- "iblGreen",
        "iblViolet",
        "iblCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook,
      --  so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- vim.api.nvim_set_hl(0, "iblRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "iblYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "iblBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "iblOrange", { fg = "#D19A66" })
        -- vim.api.nvim_set_hl(0, "iblGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "iblViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "iblCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup {
        indent = {
          highlight = highlight,
          char = "┊",
        },
      }
    end,
  },

  {
    "AbdelrahmanDwedar/awesome-nvim-colorschemes",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        integrations = { telescope = true },
      }
      ---@diagnostic disable-next-line: missing-fields
      require("notify").setup { background_colour = "#000000" }
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    main = "rainbow-delimiters.setup",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require "rainbow-delimiters"

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
          "iblYellow",
          "iblBlue",
          "iblOrange",
          "iblViolet",
          "iblCyan",
          -- "RainbowDelimiterRed",
          -- "RainbowDelimiterYellow",
          -- "RainbowDelimiterViolet",
          -- "RainbowDelimiterBlue",
          -- "RainbowDelimiterOrange",
          -- "RainbowDelimiterGreen",
          -- "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { rainbow_delimiters = true } },
  },

  {
    "folke/noice.nvim",
    -- enabled = false,
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
    "folke/twilight.nvim",
    keys = { { "<leader>uW", "<cmd>Twilight<cr>", desc = "Toggle Twilight" } },
    cmd = {
      "Twilight",
      "TwilightEnable",
      "TwilightDisable",
    },
  },
}
