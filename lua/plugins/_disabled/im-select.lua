local os = require "lib.os_detect"

return {
  "keaising/im-select.nvim",
  enabled = not os.is_linux,
  event = "VeryLazy",
  opts = {
    default_im_select = os.is_win and "3081" or os.is_mac and "com.apple.keylayout.Australian" or "us",
  },
}
