local utils = require "utils"
return {
  {
    "Exafunction/codeium.nvim",
    -- enabled = not utils.is_linux,
    enabled = false,
    opts = {
      -- enable_chat = true,
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        -- Set to true if you never want completions to be shown automatically.
        manual = false,
        -- A mapping of filetype to true or false, to enable virtual text.
        filetypes = {},
        -- Whether to enable virtual text of not for filetypes not specifically listed above.
        default_filetype_enabled = true,
        -- How long to wait (in ms) before requesting completions after typing stops.
        idle_delay = 150,
        -- Priority of the virtual text. This usually ensures that the completions appear on top of
        -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
        -- desired.
        virtual_text_priority = 65535,
        -- Set to false to disable all key bindings for managing completions.
        map_keys = true,
        -- The key to press when hitting the accept keybinding but no completion is showing.
        -- Defaults to \t normally or <c-n> when a popup is showing.
        accept_fallback = nil,
        -- Key bindings for managing completions in virtual text mode.
        key_bindings = {
          accept = "<C-k>",
          accept_word = "<C-w>",
          accept_line = "<C-l>",
          clear = "<C-x>",
          next = "<A-.>",
          prev = "<A-,>",
        },
      },
    },
  },

  {
    "Exafunction/codeium.vim",
    enabled = true,
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set(
        "i",
        "<C-l>",
        function() return vim.fn["codeium#AcceptNextLine"]() end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<C-w>",
        function() return vim.fn["codeium#AcceptNextWord"]() end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<A-.>",
        function() return vim.fn["codeium#CycleCompletions"](1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<A-,>",
        function() return vim.fn["codeium#CycleCompletions"](-1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    end,
  },

  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
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
      if utils.is_win then
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
  -- {
  --   "ray-x/sad.nvim",
  --   enabled = not utils.is_win,
  --   dependencies = { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  --   opts = {
  --     diff = "diff-so-fancy", -- `delta`, `less`, `diff-so-fancy`
  --     ls_file = "fd",
  --     vsplit = false,
  --   },
  --   -- event = "User AstroFile",
  --   cmd = { "Sad" },
  --   keys = {
  --     { "<leader>lF", "<cmd>Sad<cr>", desc = "Find and replace (Sad)" },
  --   },
  -- },
}
