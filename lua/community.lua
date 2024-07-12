local is_win = require("util").is_win
-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity/bars-and-lines/smartcolumn-nvim" }, -- line max characters indicator

  { import = "astrocommunity/code-runner/overseer-nvim" }, -- task runner
  { import = "astrocommunity/color/ccc-nvim" }, -- color picker
  { import = "astrocommunity/color/mini-hipatterns" }, -- highlight patterns（comments, colors
  { import = "astrocommunity/color/tint-nvim" }, -- dim inactive window
  -- { import = "astrocommunity/color/transparent-nvim" },

  { import = "astrocommunity/completion/cmp-cmdline" }, -- command auto completion

  -- persistent-breakpoints-nvim loaded in dap.lua
  -- { import = "astrocommunity/debugging/persistent-breakpoints-nvim" },
  -- seems not working (2):
  -- { import = "astrocommunity/debugging/nvim-dap-repl-highlights" },
  -- { import = "astrocommunity/debugging/telescope-dap-nvim" },

  -- { import = "astrocommunity/diagnostics/lsp_lines-nvim" }, -- display virtual diagnostic lines (under current line)
  { import = "astrocommunity/diagnostics/trouble-nvim" }, -- diagnostic UI

  -- { import = "astrocommunity/editing-support/nvim-regexplainer" }, -- explain regex
  { import = "astrocommunity/editing-support/refactoring-nvim" }, -- refactoring, https://github.com/ThePrimeagen/refactoring.nvim
  { import = "astrocommunity/editing-support/ultimate-autopair-nvim" }, -- autopair
  -- keymaps: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/editing-support/yanky-nvim/init.lua
  -- { import = "astrocommunity/editing-support/yanky-nvim" }, -- more yank operations

  -- { import = "astrocommunity/lsp/garbage-day-nvim" },
  { import = "astrocommunity/lsp/inc-rename-nvim" },
  { import = "astrocommunity/lsp/lsp-signature-nvim" }, -- floating function parameters hint
  { import = "astrocommunity/lsp/nvim-lsp-file-operations" },

  { import = "astrocommunity/markdown-and-latex/peek-nvim" }, -- markdown preview window, requires [ deno ]

  -- { import = "astrocommunity/motion/mini-ai" },

  {
    import = "astrocommunity/pack/cs",
    enabled = is_win,
  },
  { import = "astrocommunity/pack/rust" },
  -- { import = "astrocommunity/pack/cpp" },
  -- { import = "astrocommunity/pack/bash" },
  -- { import = "astrocommunity/pack/dart" },
  { import = "astrocommunity/pack/python" },
  { import = "astrocommunity/pack/tailwindcss" },
  { import = "astrocommunity/pack/typescript" },
  { import = "astrocommunity/pack/html-css" },
  { import = "astrocommunity/pack/markdown" },
  { import = "astrocommunity/pack/docker" },
  { import = "astrocommunity/pack/toml" },
  { import = "astrocommunity/pack/json" },
  { import = "astrocommunity/pack/yaml" },

  { import = "astrocommunity/programming-language-support/csv-vim" },
  { import = "astrocommunity/programming-language-support/nvim-jqx" }, -- json, requires [ jq ]

  { import = "astrocommunity/scrolling/satellite-nvim" }, -- scrollbar, requires neovim 0.10+
  { import = "astrocommunity/scrolling/vim-smoothie", cond = function() return not vim.g.neovide end },

  { import = "astrocommunity/search/nvim-hlslens" }, -- seach reuslt index

  -- { import = "astrocommunity/terminal-integration/vim-tpipeline" }, -- tmux
  -- { import = "astrocommunity/terminal-integration/flatten-nvim" }, -- flatten file buffer opened in terminal

  -- { import = "astrocommunity/test/neotest" },
}
