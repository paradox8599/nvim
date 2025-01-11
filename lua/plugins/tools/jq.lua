-- when in the query window, run the jq query
vim.keymap.set("n", "R", "<Plug>(JqPlaygroundRunQuery)")

return {
  "yochem/jq-playground.nvim",

  keys = {
    { "<leader>zj", vim.cmd.JqPlayground, desc = "[J]q playground" },
    { "R", "<Plug>(JqPlaygroundRunQuery)", mode = "n", desc = "[R]un Jq query" },
  },

  opts = {
    -- cmd = { "jq" },
    -- output_window = {
    --   split_direction = "right",
    --   width = nil,
    --   height = nil,
    -- },
    -- query_window = {
    --   split_direction = "bottom",
    --   width = nil,
    --   height = 0.3,
    -- },
    disable_default_keymap = true,
  },
}
