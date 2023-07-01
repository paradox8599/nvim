return {
  {
    "tomasiser/vim-code-dark",
    lazy = false,
    priority = 10000,
    init = function()
      vim.cmd([[colorscheme codedark]])
    end
  }
}
