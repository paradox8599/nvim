return {
  "saecki/live-rename.nvim",
  dependencies = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>lr"] = {
              function() require("live-rename").rename { insert = true } end,
              desc = "Rename current symbol",
            },
          },
        },
      },
    },
  },
  opts = {},
}
