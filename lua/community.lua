local os = require "lib.os_detect"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity/diagnostics/trouble-nvim" }, -- diagnostic UI
  -- { import = "astrocommunity/editing-support/nvim-regexplainer" }, -- explain regex

  { import = "astrocommunity/editing-support/refactoring-nvim" }, -- refactoring, https://github.com/ThePrimeagen/refactoring.nvim
  { import = "astrocommunity/editing-support/ultimate-autopair-nvim" }, -- autopair

  os.is_win and { import = "astrocommunity/pack/cs", ft = { "cs", "csproj", "sln" } } or {},
  { import = "astrocommunity/pack/lua" },
  { import = "astrocommunity/pack/cpp" },
  { import = "astrocommunity/pack/rust" },
  { import = "astrocommunity/pack/typescript" },
  { import = "astrocommunity/pack/tailwindcss" },
  { "js-everts/cmp-tailwind-colors", enabled = false, optional = true },
  { import = "astrocommunity/pack/toml" },
  { import = "astrocommunity/pack/json" },
  { import = "astrocommunity/pack/yaml" },
  { import = "astrocommunity/pack/nix", enabled = os.is_linux },
  { import = "astrocommunity/pack/python" },
  { "linux-cultist/venv-selector.nvim", enabled = false, optional = true }, -- depends on telescope
  -- { import = "astrocommunity/pack/svelte" },
  -- { import = "astrocommunity/pack/html-css" },
  -- { import = "astrocommunity/pack/markdown" },
  -- { import = "astrocommunity/pack/vue" },
  -- { import = "astrocommunity/pack/bash" },
  -- { import = "astrocommunity/pack/dart" },

  { import = "astrocommunity/programming-language-support/csv-vim" },
  { import = "astrocommunity/programming-language-support/nvim-jqx" }, -- json, requires [ jq ]

  -- { import = "astrocommunity/terminal-integration/flatten-nvim" }, -- flatten file buffer opened in terminal

  -- { import = "astrocommunity/test/neotest" },
}
