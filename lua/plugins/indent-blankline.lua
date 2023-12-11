return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'VeryLazy',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  -- opts = {
  --   indent = {
  --     highlight = { "CursorColumn", "Whitespace", },
  --     char = "┊"
  --   },
  --   whitespace = {
  --     highlight = { "CursorColumn", "Whitespace", },
  --     remove_blankline_trail = false,
  --   },
  --   scope = { enabled = false },
  -- },
  config = function()
    local highlight = {
      "iblRed",
      "iblYellow",
      "iblBlue",
      "iblOrange",
      "iblGreen",
      "iblViolet",
      "iblCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "iblRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "iblYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "iblBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "iblOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "iblGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "iblViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "iblCyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup({
      indent = {
        highlight = highlight,
        char = '┊'
      },
    })
  end
}
