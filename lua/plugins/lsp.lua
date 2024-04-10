return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    opts = {
      max_lines = 5,
      line_numbers = true,
      mode = "cursor",
      trim_scope = "outer",
    },

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
  },
}
