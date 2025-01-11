local utils = require "../../utils"

return {
  "keaising/im-select.nvim",
  enabled = false and not utils.is_linux,
  event = "VeryLazy",
  opts = {
    default_im_select = utils.is_win and "3081" or utils.is_mac and "com.apple.keylayout.Australian" or "us",
  },
}
