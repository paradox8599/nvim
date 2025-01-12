local os = require "lib.os_detect"

return {
  "mbbill/undotree",
  keys = {
    {
      "<leader><leader>u",
      vim.cmd.UndotreeToggle,
      desc = "[U]ndo tree toggle",
    },
  },
  config = function()
    if os.is_win then
      vim.opt.undodir = os.getenv "UserProfile" .. "/.vim/undodir"
    else
      vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
    end
    vim.opt.undofile = true
  end,
}
