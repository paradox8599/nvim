return {
  -- display current scope name at top
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "BufEnter",
  --   opts = {
  --     enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  --     max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
  --     min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  --     line_numbers = true,
  --     multiline_threshold = 5, -- Maximum number of lines to show for a single context
  --     trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  --     mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  --     -- Separator between context and content. Should be a single character string, like '-'.
  --     -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  --     separator = nil,
  --     zindex = 20, -- The Z-index of the context window
  --     on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  --   },
  -- },

  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },

  {
    "fei6409/log-highlight.nvim",
    ft = { "log" },
    opts = {},
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {},
  },

  -- references and definitions count
  { "VidocqH/lsp-lens.nvim", config = false },

  {
    "Wansmer/symbol-usage.nvim",
    -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    event = "LspAttach",
    opts = {
      ---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
      vt_position = "above",
      references = { enabled = true, include_declaration = false },
      definition = { enabled = true },
      implementation = { enabled = true },
    },
  },

  -- variable definition highlight
  { "chrisgrieser/nvim-dr-lsp", event = "LspAttach", opts = {} },

  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    keys = {
      { "gpd", function() require("goto-preview").goto_preview_definition {} end, desc = "Goto Preview [D]efinition" },
      {
        "gpt",
        function() require("goto-preview").goto_preview_type_definition {} end,
        desc = "Goto Preview [T]ype Definition",
      },
      {
        "gpi",
        function() require("goto-preview").goto_preview_implementation {} end,
        desc = "Goto Preview [I]mplementation",
      },
      {
        "gpD",
        function() require("goto-preview").goto_preview_declaration {} end,
        desc = "Goto Preview [D]eclaration",
      },
      {
        "gpc",
        function() require("goto-preview").close_all_win() end,
        desc = "[C]lose All Preview",
      },
      {
        "gpr",
        function() require("goto-preview").goto_preview_references {} end,
        desc = "Goto Preview [R]eferences",
      },
    },

    opts = {
      width = 100, -- Width of the floating window
      height = 16, -- Height of the floating window
      -- border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
      default_mappings = false, -- Bind default mappings
      debug = false, -- Print debug information
      -- opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
      -- resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
      -- post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      -- post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      -- references = { -- Configure the telescope UI for showing the references cycling window.
      --   telescope = require("telescope.themes").get_dropdown { hide_preview = false },
      -- },
      -- -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true, -- Focus the floating window when opening it.
      -- dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
      -- force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      -- bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
      -- stack_floating_preview_windows = true, -- Whether to nest floating windows
      -- same_file_float_preview = true, -- Whether to open a new floating window for a reference within the current file
      -- preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
      -- zindex = 1, -- Starting zindex for the stack of floating windows
    },
  },
}
