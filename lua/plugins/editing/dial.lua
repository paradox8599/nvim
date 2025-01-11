return {
  "monaqa/dial.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-a>",
      function() require("dial.map").manipulate("increment", "normal") end,
      desc = "Dial Increment",
    },
    {
      "<C-x>",
      function() require("dial.map").manipulate("decrement", "normal") end,
      desc = "Dial Decrement",
    },
  },
  config = function()
    local augend = require "dial.augend"
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        -- dates
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%d/%m/%Y"],
        augend.date.alias["%d-%m-%Y"],
      },
    }
  end,
}
