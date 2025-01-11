return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",

        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },

        keys = {
          { "<leader>E", function() require("nvim-navbuddy").open() end, desc = "" },
        },

        opts = { lsp = { auto_attach = true } },
      },
    },
  },
}
