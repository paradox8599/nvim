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
  },
}
