return {
  {
    "SmiteshP/nvim-navbuddy",

    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },

    keys = {
      { "<leader>a", function() require("nvim-navbuddy").open() end, desc = "Navbuddy" },
    },

    opts = { lsp = { auto_attach = true } },
  },
}
