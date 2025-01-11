return {
  "ray-x/sad.nvim",
  dependencies = { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  opts = {
    diff = "diff-so-fancy", -- `delta`, `less`, `diff-so-fancy`
    ls_file = "fd",
    vsplit = false,
  },
  -- event = "User AstroFile",
  cmd = { "Sad" },
  keys = {
    { "<leader>lF", "<cmd>Sad<cr>", desc = "Find and replace (Sad)" },
  },
}
