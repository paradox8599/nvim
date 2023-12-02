return {
  'mbbill/undotree',
  event = 'VeryLazy',
  keys = {
    { '<leader>u', vim.cmd.UndotreeToggle, desc = '[U]ndo tree toggle' },
  },
  config = function()
    if jit.os == 'Windows' then
      vim.opt.undodir = os.getenv('UserProfile') .. '/.vim/undodir'
    else
      vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
    end
    vim.opt.undofile = true
  end
}
