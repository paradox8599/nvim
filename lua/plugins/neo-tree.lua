vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim'
    },
    cmd = { 'Neotree', 'Neotree toggle' },
    opts = {
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".DS_Store",
          },
        }
      }
    }
  },
}
