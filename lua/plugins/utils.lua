return {
  {
    "glacambre/firenvim",
    lazy = not vim.g.started_by_firenvim,
    build = function() vim.fn["firenvim#install"](0) end,
    config = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = { [".*"] = { content = "text", takeover = "never" } },
      }
    end,
  },

  -- Detect tabstop and shiftwidth automatically
  -- { "tpope/vim-sleuth", event = "VeryLazy" },

  -- <C-a/x> for date
  { "tpope/vim-speeddating", event = "VeryLazy", config = function() end },

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
      if vim.loop.os_uname().sysname == "Windows_NT" then
        vim.opt.undodir = os.getenv "UserProfile" .. "/.vim/undodir"
      else
        vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
      end
      vim.opt.undofile = true
    end,
  },

  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
      ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
      use_default_keymaps = false,
      ---@type boolean Node with syntax error will not be formatted
      check_syntax_error = true,
      ---If line after join will be longer than max value,
      ---@type number If line after join will be longer than max value, node will not be formatted
      max_join_length = 99999,
      ---Cursor behavior:
      ---hold - cursor follows the node/place on which it was called
      ---start - cursor jumps to the first symbol of the node being formatted
      ---end - cursor jumps to the last symbol of the node being formatted
      ---@type 'hold'|'start'|'end'
      cursor_behavior = "hold",
      ---@type boolean Notify about possible problems or not
      notify = true,
      ---@type boolean Use `dot` for repeat action
      dot_repeat = false,
      ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
      on_error = nil,
      ---@type table Presets for languages
      -- langs = {}, -- See the default presets in lua/treesj/langs
    },
  },

  {
    "RaafatTurki/hex.nvim",
    cmd = { "HexDump", "HexToggle", "HexAssemble" },
    keys = {
      { "<leader>bh", ":HexToggle<cr>", desc = "Toggle Hex Editor" },
    },
    opts = {},
  },

  {
    "tpope/vim-repeat",
    event = "User AstroFile",
    config = function() end,
  },

  {
    "nguyenvukhang/nvim-toggler",
    event = { "User AstroFile", "InsertEnter" },
    keys = {
      {
        "<leader>i",
        function() require("nvim-toggler").toggle() end,
        desc = "Toggle word under cursor",
      },
    },
    opts = {},
  },

  {
    "m4xshen/hardtime.nvim",
    event = "User AstroFile",
    opts = {
      max_count = 999,
      disabled_keys = {
        ["<Insert>"] = { "", "i" },
        ["<Home>"] = { "", "i" },
        ["<End>"] = { "", "i" },
        ["<PageUp>"] = { "", "i" },
        ["<PageDown>"] = { "", "i" },
      },
    },
    config = function(_, opts)
      require("hardtime").setup(opts)
      require("hardtime").enable()
    end,
  },

  {
    "ray-x/sad.nvim",
    dependencies = { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
    opts = {},
    -- event = "User AstroFile",
    cmd = { "Sad" },
    keys = {
      { "<leader>lF", ":Sad<cr>", desc = "Find and replace (Sad)" },
    },
  },

  {
    "stevearc/profile.nvim",
    enabled = false,
    -- chrome://tracing/
    -- https://ui.perfetto.dev/
    keys = {
      {
        "<leader><leader>p",
        function()
          local prof = require "profile"
          if prof.is_recording() then
            prof.stop()
            vim.ui.input({
              prompt = "Save profile to:",
              completion = "file",
              default = "profile.json",
            }, function(filename)
              if filename then
                prof.export(filename)
                vim.notify(string.format("Wrote %s", filename))
              end
            end)
          else
            prof.start "*"
          end
        end,
        desc = "Profile toggle",
      },
    },
    init = function()
      local should_profile = os.getenv "NVIM_PROFILE"
      if should_profile then
        require("profile").instrument_autocmds()
        if should_profile:lower():match "^start" then
          require("profile").start "*"
        else
          require("profile").instrument "*"
        end
      end
    end,
  },
}
