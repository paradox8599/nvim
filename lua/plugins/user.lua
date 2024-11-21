local utils = require "utils"

---@type LazySpec
return {
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     -- customize the dashboard header
  --     opts.section.header.val = {
  --       "██    ██ ███████  ██████  ██████  ██████  ███████",
  --       "██    ██ ██      ██      ██    ██ ██   ██ ██     ",
  --       "██    ██ ███████ ██      ██    ██ ██   ██ █████  ",
  --       " ██  ██       ██ ██      ██    ██ ██   ██ ██     ",
  --       "  ████   ███████  ██████  ██████  ██████  ███████",
  --     }
  --     return opts
  --   end,
  -- },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = true,
      filesystem = {
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          hide_dotfiles = true,
          hide_by_name = {},
          hide_by_pattern = {},
          always_show = {
            ".env",
            ".env.local",
            ".env.prod",
            ".env.dev",
            ".env.test",
          },
          never_show = {},
          never_show_by_pattern = {},
        },
      },
    },
  },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode {
          mode_text = {
            padding = { left = 1, right = 1 },
            hl = { fg = "#1e1e2e", bold = true },
          },
        },
        status.component.git_branch(),
        status.component.file_info(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.virtual_env(),
        -- status.component.treesitter(),
        status.component.nav(),
        -- status.component.mode { surround = { separator = "right" } },
      }
    end,
  },

  {
    "folke/snacks.nvim",
    dependencies = { { "goolord/alpha-nvim", enabled = false } },
    priority = 1000,
    lazy = false,
    keys = {
      -- { "<leader>uD", function() require("snacks.notifier").hide() end, desc = "Dismiss all Snacks Notifications" },
      { "<leader>gb", function() require("snacks").git.blame_line() end, desc = "Git blame line" },
      { "<leader>gf", function() require("snacks").lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>br", function() require("snacks").rename.rename_file() end, desc = "Rename File" },
      { "<leader>h", function() require("snacks").dashboard() end, desc = "Git blame line" },
      { "]]", function() require("snacks").words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      {
        "[[",
        function() require("snacks").words.jump(-vim.v.count1) end,
        desc = "Prev Reference",
        mode = { "n", "t" },
      },
    },

    opts = {
      -- notifier = { enabled = true },
      bigfile = { enabled = true },
      git = { enabled = true },
      lazygit = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = true },
      terminal = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
        },

        -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 2 },
          {
            pane = 1,
            gap = 1,
            icon = " ",
            title = " Recent",
            section = "recent_files",
            indent = 4,
            padding = 1,
          },
          {
            pane = 1,
            gap = 1,
            icon = " ",
            title = " Projects",
            section = "projects",
            indent = 4,
            padding = 4,
          },
          -- {
          --   pane = 1,
          --   icon = " ",
          --   title = " Git Status",
          --   section = "terminal",
          --   enabled = vim.fn.isdirectory ".git" == 1,
          --   cmd = "git status --short --branch --renames",
          --   height = 9,
          --   gap = 1,
          --   padding = 1,
          --   ttl = 3 * 60,
          --   indent = 4,
          -- },
          { section = "startup" },
        },
      },
    },
  },

  {
    "keaising/im-select.nvim",
    enabled = not utils.is_linux,
    event = "VeryLazy",
    opts = {
      default_im_select = utils.is_win and "3081" or utils.is_mac and "com.apple.keylayout.Australian" or "us",
    },
  },
}
