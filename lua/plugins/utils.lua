local utils = require "../utils"
return {
  -- firenvim
  {
    "glacambre/firenvim",
    cond = not utils.is_linux,
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
}
