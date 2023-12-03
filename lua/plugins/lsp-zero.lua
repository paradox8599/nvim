return {
  'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  { 'williamboman/mason.nvim', event = 'VeryLazy', config = true },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup({})

      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        preselect = 'item',
        completion = { completeopt = 'menu,menuone,noinsert' },
        -- cmp window border
        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },
        mapping = cmp.mapping.preset.insert({
          ['<A-Space>'] = cmp.mapping.complete(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-q>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim',                opts = {} },
      { 'folke/neodev.nvim',                opts = {} },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        vim.keymap.set({ 'n', 'i' }, '<C-.>', vim.lsp.buf.code_action,
          { desc = '[C]ode [A]ction', buffer = bufnr })
        -- Diagnostic keymaps
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
          { desc = 'Go to previous diagnostic message', buffer = bufnr })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
          { desc = 'Go to next diagnostic message', buffer = bufnr })
        vim.keymap.set('n', '<F8>', vim.diagnostic.goto_next,
          { desc = 'Go to next diagnostic message', buffer = bufnr })
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float,
          { desc = 'Open floating diagnostic message', buffer = bufnr })
        vim.keymap.set('n', '<leader>1', vim.diagnostic.setloclist,
          { desc = 'Open diagnostics list', buffer = bufnr })
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'tsserver',
          'pyright',
          'rust_analyzer'
        },
        handlers = {
          lsp_zero.default_setup,
          -- lua_ls = function()
          --   -- (Optional) Configure lua language server for neovim
          --   local lua_opts = lsp_zero.nvim_lua_ls()
          --   require('lspconfig').lua_ls.setup(lua_opts)
          -- end,
        },
      })
    end,
  },
}
