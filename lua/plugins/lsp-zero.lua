return {
  -- https://nvimdev.github.io/guard
  -- {
  --   "nvimdev/guard.nvim",
  --   -- Builtin configuration, optional
  --   dependencies = {
  --     "nvimdev/guard-collection",
  --   },
  --   opts = {},
  -- },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function() require('lspsaga').setup({}) end,
    dependencies = {}
    -- 'nvim-treesitter/nvim-treesitter', -- optional
    -- 'nvim-tree/nvim-web-devicons'      -- optional
  },
  {
    'onsails/lspkind.nvim',
    config = function()
      require('lspkind').init {
        mode = 'symbol_text',
        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        -- default: 'default'
        preset = 'codicons',
        -- override preset symbols
        -- default: {}
        symbol_map = {
          Text = '󰉿',
          Method = '󰆧',
          Function = '󰊕',
          Constructor = '',
          Field = '󰜢',
          Variable = '󰀫',
          Class = '󰠱',
          Interface = '',
          Module = '',
          Property = '󰜢',
          Unit = '󰑭',
          Value = '󰎠',
          Enum = '',
          Keyword = '󰌋',
          Snippet = '',
          Color = '󰏘',
          File = '󰈙',
          Reference = '󰈇',
          Folder = '󰉋',
          EnumMember = '',
          Constant = '󰏿',
          Struct = '󰙅',
          Event = '',
          Operator = '󰆕',
          TypeParameter = '',
        },
      }
    end
  },
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
      local lspkind = require('lspkind')

      cmp.setup({
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          expandable_indicator = true,
          format = lspkind.cmp_format({
            mode = 'symbol_text',  -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function(entry, vim_item)
            --   return vim_item
            -- end
          })
        },
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
          ['<A-Space>'] = cmp.mapping.complete(), -- mac
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<F3>'] = cmp.mapping.complete(),
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
        local opts = { buffer = bufnr }
        lsp_zero.default_keymaps(opts)
        -- LSPSaga
        vim.keymap.set('n', '<F4>', [[<cmd>Lspsaga code_action<cr>]], opts)
        vim.keymap.set({ 'n', 't' }, '<leader>T', [[<cmd>Lspsaga term_toggle<cr>]], opts)
        vim.keymap.set('n', 'K', [[<cmd>Lspsaga hover_doc<cr>]], opts)
        vim.keymap.set('n', 'gpd', [[<cmd>Lspsaga peek_definition<cr>]], { desc = '[D]efinition', buffer = bufnr })
        vim.keymap.set('n', 'gd', [[<cmd>Lspsaga goto_definition<cr>]], { desc = '[D]efinition', buffer = bufnr })
        vim.keymap.set('n', 'gpD', [[<cmd>Lspsaga peek_type_definition<cr>]], { desc = '[D]eclaration', buffer = bufnr })
        vim.keymap.set('n', 'gD', [[<cmd>Lspsaga goto_type_definition<cr>]], { desc = '[D]eclaration', buffer = bufnr })
        vim.keymap.set('n', 'gi', [[<cmd>Lspsaga finder imp<cr>]], { desc = '[I]mplementation', buffer = bufnr })

        vim.keymap.set('n', '[e', [[<cmd>Lspsaga diagnostic_jump_prev<cr>]],
          { desc = 'Go to previous diagnostic message', buffer = bufnr })
        vim.keymap.set('n', ']e', [[<cmd>Lspsaga diagnostic_jump_next<cr>]],
          { desc = 'Go to next diagnostic message', buffer = bufnr })
        vim.keymap.set('n', '<F8>', [[<cmd>Lspsaga diagnostic_jump_next<cr>]],
          { desc = 'Go to next diagnostic message', buffer = bufnr })
        vim.keymap.set({ 'n', 'i' }, '<A-F>', vim.lsp.buf.format, opts)
        vim.keymap.set({ 'n' }, 'go', [[<cmd>Lspsaga outline<cr>]], { desc = '[O]utline', buffer = bufnr })
        vim.keymap.set('n', '<F2>', [[<cmd>Lspsaga rename<cr>]], opts)

        -- vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[D]efinition', buffer = bufnr })
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[D]eclaration', buffer = bufnr })
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = '[I]mplementation', buffer = bufnr })
        -- vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { desc = 'Type definition', buffer = bufnr })
        -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[R]eferences', buffer = bufnr })
        -- vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { desc = '[S]ignature help', buffer = bufnr })
        -- vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
        -- vim.keymap.set({ 'n', 'x' }, '<A-F>', function() vim.lsp.buf.format({ async = true }) end, opts)
        -- Diagnostic keymaps
        -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
        --   { desc = 'Go to previous diagnostic message', buffer = bufnr })
        -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
        --   { desc = 'Go to next diagnostic message', buffer = bufnr })
        -- vim.keymap.set('n', '<F8>', vim.diagnostic.goto_next,
        --   { desc = 'Go to next diagnostic message', buffer = bufnr })
        -- vim.keymap.set('n', 'gl', vim.diagnostic.open_float,
        --   { desc = 'Open floating diagnostic message', buffer = bufnr })
        vim.keymap.set('n', '<leader>1', vim.diagnostic.setloclist,
          { desc = 'Open diagnostics list', buffer = bufnr })
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          -- 'tsserver',
          -- 'pyright',
          -- 'rust_analyzer'
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })
    end,
  },
}
