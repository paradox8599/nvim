-- color picker & visualizer

return {
  "uga-rosa/ccc.nvim",

  event = { "User AstroFile", "InsertEnter" },

  keys = {
    { "<Leader>uC", vim.cmd.CccHighlighterToggle, desc = "Toggle colorizer" },
    { "<Leader>zc", vim.cmd.CccConvert, desc = "Convert color" },
    { "<Leader>zp", vim.cmd.CccPick, desc = "Pick color" },
  },

  specs = { { "NvChad/nvim-colorizer.lua", enabled = false, optional = true } },

  config = function(_, opts)
    require("ccc").setup(opts)
    vim.cmd.CccHighlighterEnable()
  end,
}
