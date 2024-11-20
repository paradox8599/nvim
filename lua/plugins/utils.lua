local utils = require "../utils"
return {
  -- firenvim
  {
    "glacambre/firenvim",
    enabled = true,
    lazy = not vim.g.started_by_firenvim,
    build = ":call firenvim#install(0)",
    config = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = { [".*"] = { content = "text", takeover = "never" } },
      }
      vim.api.nvim_create_autocmd({ "UIEnter" }, {
        callback = function()
          if vim.o.lines < 16 then vim.o.lines = 16 end
          if vim.o.columns < 80 then vim.o.columns = 80 end
          vim.cmd [[set background=light]]
        end,
      })
      -- autosave
      -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      --   nested = true,
      --   command = "write",
      -- })
    end,
  },

  -- undotree
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader><leader>u",
        vim.cmd.UndotreeToggle,
        desc = "[U]ndo tree toggle",
      },
    },
    config = function()
      if utils.is_win then
        vim.opt.undodir = os.getenv "UserProfile" .. "/.vim/undodir"
      else
        vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
      end
      vim.opt.undofile = true
    end,
  },

  -- hex.nvim
  {
    "RaafatTurki/hex.nvim",
    cmd = { "HexDump", "HexToggle", "HexAssemble" },
    -- keys = {
    --   { "<leader>bh", "<cmd>HexToggle<cr>", desc = "Toggle Hex Editor" },
    -- },
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    event = "User AstroFile",
    keys = {
      { "<leader>um", function() require("render-markdown").toggle() end, desc = "Toggle Render Markdown" },
    },
  },

  -- harpoon
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   requires = { { "nvim-lua/plenary.nvim" } },
  --   event = "VeryLazy",
  --   opts = {},
  --   keys = {
  --     {
  --       "<leader><leader>a",
  --       function() require("harpoon"):list():add() end,
  --       desc = "[Marks] Add file to marks",
  --     },
  --     {
  --       "<leader><leader>d",
  --       function() require("harpoon"):list():remove() end,
  --       desc = "[Marks] Remove file from marks",
  --     },
  --     {
  --       "<leader><leader>c",
  --       function() require("harpoon"):list():clear() end,
  --       desc = "[Marks] Clear marks",
  --     },
  --     {
  --       "<leader><leader>m",
  --       function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
  --       desc = "[Marks] Toggle harpoon marks menu",
  --     },
  --     {
  --       "<C-p>",
  --       function() require("harpoon"):list():prev() end,
  --       desc = "[Marks] Goto previous mark",
  --     },
  --     {
  --       "<C-n>",
  --       function() require("harpoon"):list():next() end,
  --       desc = "[Marks] Goto next mark",
  --     },
  --   },
  -- },
}
