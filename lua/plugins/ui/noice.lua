return {
  "folke/noice.nvim",
  cond = not vim.g.started_by_firenvim,
  event = "VeryLazy",
  opts = {
    lsp = { hover = { enabled = false }, signature = { enabled = false } },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  },
}
