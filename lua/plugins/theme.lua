return {
  {
    "shellRaining/hlchunk.nvim",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        duration = 25,
        delay = 50,
        style = {
          { fg = "#99ddff" },
          { fg = "#ff6699" },
        },
        textobject = "ic",
      },
      indent = {
        enable = true,
        delay = 50,
        chars = {
          "│",
          "¦",
          "┆",
          "┊",
        },
        -- style = {
        --   -- { fg = "#E06C75" },
        --   { fg = "#E5C07B" },
        --   { fg = "#61AFEF" },
        --   { fg = "#D19A66" },
        --   -- { fg = "#98C379" },
        --   { fg = "#C678DD" },
        --   { fg = "#56B6C2" },
        -- },
      },
      line_num = {
        enable = true,
        duration = 25,
        delay = 50,
        style = "#a0a0a0",
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
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
        -- vim.api.nvim_set_hl(0, "iblGreen", {fg= "#98C379" })
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

  -- {
  --   "AbdelrahmanDwedar/awesome-nvim-colorschemes",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup {}
  --     vim.cmd.colorscheme "catppuccin"
  --   end,
  -- },

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
