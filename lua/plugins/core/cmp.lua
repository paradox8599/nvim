return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local luasnip = require "luasnip"
    local cmp = require "cmp"

    opts.mapping["<CR>"] = nil
    opts.mapping["<C-y>"] = cmp.mapping.confirm()

    -- disables tab cmp select
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if vim.api.nvim_get_mode().mode ~= "c" and luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" })

    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.api.nvim_get_mode().mode ~= "c" and luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
  end,
}
