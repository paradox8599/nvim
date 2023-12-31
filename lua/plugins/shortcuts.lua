return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup({})
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {
      enable = true,
    }
  },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'tpope/vim-surround',
    config = function() end
  },
  {
    'tpope/vim-repeat',
    config = function() end
  },
  {
    'tetzng/open-github-url.nvim',
    opts = {}
  },
}
