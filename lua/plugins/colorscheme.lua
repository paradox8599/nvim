return {
  {
    "tomasiser/vim-code-dark",
    lazy = false,
    priority = 10000,
    config = function()
      vim.cmd([[colorscheme codedark]])
    end
  }
}
