return {
  ---@type LazySpec
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "astrodark",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
        },
        astrodark = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
  -- {
  --   "ilof2/posterpole.nvim",
  --   priority = 1000,
  --   config = function()
  --     local posterpole = require "posterpole"
  --
  --     posterpole.setup {
  --       transparent = false,
  --       colorless_bg = false,
  --       dim_inactive = false,
  --       brightness = 1,
  --       selected_tab_highlight = false,
  --       fg_saturation = 0,
  --       bg_saturation = 0,
  --
  --       adaptive_brightness = {
  --         enabled = true,
  --         max_brightness = 3,
  --         min_brightness = -6,
  --         daylight_duration = 12,
  --         noon_time = 12,
  --       },
  --
  --       lualine = { transparent = true },
  --     }
  --
  --     vim.cmd "colorscheme posterpole"
  --
  --     -- This function create sheduled task, which will reload theme every hour
  --     -- Without "setup_adaptive" adaptive brightness will be set only after every restart
  --     posterpole.setup_adaptive()
  --   end,
  -- },
}
