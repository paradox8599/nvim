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

  -- references and definitions count
  {
    "VidocqH/lsp-lens.nvim",
    config = true,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {},
  },
}
