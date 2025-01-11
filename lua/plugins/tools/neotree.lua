---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_git_status = true,
    filesystem = {
      hijack_netrw_behavior = "disabled",
      filtered_items = {
        hide_dotfiles = true,
        hide_by_name = {},
        hide_by_pattern = {},
        always_show = {
          ".env",
          ".env.local",
          ".env.prod",
          ".env.dev",
          ".env.test",
        },
        never_show = {},
        never_show_by_pattern = {},
      },
    },
  },
}
