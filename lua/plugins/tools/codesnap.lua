-- take code snapshots

local os = require "lib.os_detect"

return {
  "mistricky/codesnap.nvim",
  cond = not os.is_win,
  build = "make",
  keys = {
    {
      "<leader>cc",
      "<Esc><cmd>CodeSnap<cr>",
      mode = { "x", "v" },
      desc = "Save selected [C]ode snapshot into clipboard",
    },
    {
      "<leader>ca",
      "<Esc><cmd>CodeSnapASCII<cr>",
      mode = { "x", "v" },
      desc = "Save selected code snapshot in [A]SCII",
    },
    {
      "<leader>ch",
      "<Esc><cmd>CodeSnapHighlight<cr>",
      mode = { "x", "v" },
      desc = "Save selected code snapshot [H]ighlighted",
    },
  },
  opts = {
    mac_window_bar = false,
    title = "",
    code_font_family = "JetBrainsMonoNL Nerd Font",
    watermark = "",
    bg_theme = "default",
    has_breadcrumbs = false,
    has_line_number = true,
    show_workspace = false,
    bg_padding = 5,
  },
}
