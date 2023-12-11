return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          'lua',
          'python',
          'rust',
          'tsx',
          'typescript',
          'vimdoc',
          'vim',
        },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>n',
            node_incremental = '<leader>n',
            scope_incremental = '<Nop>',
            node_decremental = '<leader>N',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          -- swap = {
          --   enable = true,
          --   swap_next = {
          --     ['<leader>Ta'] = '@parameter.inner',
          --   },
          --   swap_previous = {
          --     ['<leader>TA'] = '@parameter.inner',
          --   },
          -- },
        },
      })
    end,
  },
}
