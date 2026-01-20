---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_git_status = true,
    filesystem = {
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        hide_dotfiles = true,
        hide_by_name = {},
        hide_by_pattern = {},
        always_show = {
          ".env",
          ".env.production",
          ".env.development",
          ".env.prod",
          ".env.dev",
          ".env.staging",
          ".env.preview",
          ".env.local",
          ".env.example",
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
