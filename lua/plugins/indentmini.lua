return {
  enabled = false,
  'nvimdev/indentmini.nvim',
  event = 'BufEnter',
  opts = {
    char = "┊",
    exclude = {
      "erlang",
      "markdown",
    }
  },
  -- config = function()
  --   require('indentmini').setup()
  -- end,
}
