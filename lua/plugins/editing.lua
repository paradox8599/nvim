return {

  {
    "Exafunction/codeium.vim",
    cmd = {
      "Codeium",
      "CodeiumEnable",
      "CodeiumDisable",
      "CodeiumToggle",
      "CodeiumAuto",
      "CodeiumManual",
    },
    event = "BufEnter",
    dependencies = {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>;"] = {
              "<Cmd>CodeiumToggle<CR>",
              noremap = true,
              desc = "Toggle Codeium active",
            },
          },
          i = {
            ["<C-g>"] = {
              function() return vim.fn["codeium#Accept"]() end,
              expr = true,
            },
            ["<A-'>"] = {
              function() return vim.fn["codeium#CycleCompletions"](1) end,
              expr = true,
            },
            ["<A-,>"] = {
              function() return vim.fn["codeium#CycleCompletions"](-1) end,
              expr = true,
            },
            ["<C-x>"] = {
              function() return vim.fn["codeium#Clear"]() end,
              expr = true,
            },
          },
        },
      },
    },
  },

  -- speeddating: <C-a/x> for date
  { "tpope/vim-speeddating", event = "VeryLazy", config = function() end },

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
      if vim.loop.os_uname().sysname == "Windows_NT" then
        vim.opt.undodir = os.getenv "UserProfile" .. "/.vim/undodir"
      else
        vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
      end
      vim.opt.undofile = true
    end,
  },

  -- treesj
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

  -- vim-repeat
  {
    "tpope/vim-repeat",
    event = "User AstroFile",
    config = function() end,
  },

  -- nvim-toggler
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

  -- sad
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
}
