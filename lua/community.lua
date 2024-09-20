-- local is_win = require("utils").is_win

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity/bars-and-lines/smartcolumn-nvim" }, -- line max characters indicator
  -- { import = "astrocommunity/code-runner/overseer-nvim" }, -- task runner
  { import = "astrocommunity/color/ccc-nvim" }, -- color picker
  { import = "astrocommunity/color/tint-nvim" }, -- dim inactive window

  -- { import = "astrocommunity/color/mini-hipatterns" }, -- highlight patterns（comments, colors
  { import = "astrocommunity/color/transparent-nvim" },

  { import = "astrocommunity/completion/cmp-cmdline" }, -- command auto completion
  -- { import = "astrocommunity/diagnostics/trouble-nvim" }, -- diagnostic UI
  -- { import = "astrocommunity/editing-support/nvim-regexplainer" }, -- explain regex

  { import = "astrocommunity/editing-support/refactoring-nvim" }, -- refactoring, https://github.com/ThePrimeagen/refactoring.nvim
  { import = "astrocommunity/editing-support/ultimate-autopair-nvim" }, -- autopair

  -- { import = "astrocommunity/lsp/garbage-day-nvim" },
  { import = "astrocommunity/lsp/inc-rename-nvim" },

  { import = "astrocommunity/markdown-and-latex/peek-nvim" }, -- markdown preview window, requires [ deno ]

  -- { import = "astrocommunity/pack/cs", enabled = is_win },
  { import = "astrocommunity/pack/cpp" },
  { import = "astrocommunity/pack/rust" },
  -- { import = "astrocommunity/pack/typescript" },
  { import = "astrocommunity/pack/tailwindcss" },
  { import = "astrocommunity/pack/svelte" },
  -- { import = "astrocommunity/pack/html-css" },
  { import = "astrocommunity/pack/python" },
  { import = "astrocommunity/pack/docker" },
  { import = "astrocommunity/pack/markdown" },
  { import = "astrocommunity/pack/toml" },
  { import = "astrocommunity/pack/json" },
  { import = "astrocommunity/pack/yaml" },
  -- { import = "astrocommunity/pack/bash" },
  -- { import = "astrocommunity/pack/dart" },

  { import = "astrocommunity/programming-language-support/csv-vim" },
  { import = "astrocommunity/programming-language-support/nvim-jqx" }, -- json, requires [ jq ]

  -- { import = "astrocommunity/scrolling/satellite-nvim" }, -- scrollbar
  { import = "astrocommunity/scrolling/vim-smoothie", cond = not vim.g.neovide },

  { import = "astrocommunity/search/nvim-hlslens" }, -- seach reuslt index

  -- { import = "astrocommunity/terminal-integration/flatten-nvim" }, -- flatten file buffer opened in terminal

  -- { import = "astrocommunity/test/neotest" },
}
