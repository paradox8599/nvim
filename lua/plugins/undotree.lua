return {
  'mbbill/undotree',
  event = 'VeryLazy',
  keys = {
    { '<leader>u', vim.cmd.UndotreeToggle, desc = '[U]ndo tree toggle' },
  },
  config = function()
    vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
    vim.opt.undofile = true
  end
}
