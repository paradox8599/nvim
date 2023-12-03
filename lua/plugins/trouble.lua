return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local t = require('trouble')
    vim.keymap.set('n', '<leader>xx', t.toggle, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>xw',
      function() t.toggle('workspace_diagnostics') end,
      { desc = 'Workspace diagnostics' })
    vim.keymap.set("n", "<leader>xd",
      function() t.toggle("document_diagnostics") end,
      { desc = 'Document diagnostics' })
    vim.keymap.set("n", "<leader>xq",
      function() t.toggle("quickfix") end,
      { desc = 'Quick Fix' })
    vim.keymap.set("n", "<leader>xl",
      function() t.toggle("loclist") end,
      { desc = 'Loc list' })
    vim.keymap.set("n", "gR",
      function() t.toggle("lsp_references") end,
      { desc = '[R]eferences (Trouble)' })
  end

}
