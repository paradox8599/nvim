return {
  { 'tpope/vim-fugitive', cmd = { 'Git' }, },
  { 'tpope/vim-rhubarb',  event = 'VeryLazy', },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[h', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = 'Go to Previous [H]unk' })
        vim.keymap.set('n', ']h', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = 'Go to Next [H]unk' })
        vim.keymap.set('n', '<leader>gv', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Pre[v]iew Hunk' })
      end,
    },
    -- Git signs
    {
      'lewis6991/gitsigns.nvim',
      enable = false,
      config = function()
        local gs = require('gitsigns')

        gs.setup({
          signs = {
            add = { text = '│' },
            change = { text = '│' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '┆' },
          },
          signcolumn = true, --Togglewith`:Gitsignstoggle_signs`
          numhl = false,     --Togglewith`:Gitsignstoggle_numhl`
          linehl = false,    --Togglewith`:Gitsignstoggle_linehl`
          word_diff = false, --Togglewith`:Gitsignstoggle_word_diff`
          watch_gitdir = {
            follow_files = true
          },
          attach_to_untracked = true,
          current_line_blame = false, --Togglewith`:Gitsignstoggle_current_line_blame`
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', --'eol'|'overlay'|'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
          },
          current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
          sign_priority = 6,
          update_debounce = 100,
          status_formatter = nil,  --Usedefault
          max_file_length = 40000, --Disableiffileislongerthanthis(inlines)
          preview_config = {
            --Optionspassedtonvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
          },
          yadm = {
            enable = false
          },
          on_attach = function(bufnr)
            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            map('n', ']c', function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
            end, { expr = true, desc = 'Next hunk' })

            map('n', '[c', function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
            end, { expr = true, desc = 'Prev hunk' })

            map('n', '<leader>gs', gs.stage_hunk, { desc = '[S]tage hunk' })
            map('n', '<leader>gr', gs.reset_hunk, { desc = '[R]eset hunk' })
            map('v', '<leader>gs',
              function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
              { desc = '[S]tage hunk' })
            map('v', '<leader>gr',
              function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
              { desc = '[R]eset hunk' })
            map('n', '<leader>gS', gs.stage_buffer, { desc = '[S]tage buffer' })
            map('n', '<leader>gu', gs.undo_stage_hunk, { desc = '[U]ndo stage hunk' })
            map('n', '<leader>gR', gs.reset_buffer, { desc = '[R]eset buffer' })
            map('n', '<leader>gp', gs.preview_hunk, { desc = '[P]review hunk' })
            map('n', '<leader>gB', gs.toggle_current_line_blame, { desc = '[B]lame current line toogle' })
            -- map('n', '<leader>gd', gs.diffthis, { desc = '[D]iff' })
            -- map('n', '<leader>gd', function() gs.diffthis('~') end, { desc = '[D]iff file' })
            map('n', '<leader>gd', gs.toggle_deleted, { desc = 'Toggle deleted' })

            gs.toggle_current_line_blame()
          end
        })
      end
    }
  },
  -- Conflict marker
  {
    'rhysd/conflict-marker.vim',
    config = function()
      vim.cmd('let g:conflict_marker_highlight_group = ""')
      -- Include text after begin and end markers
      vim.cmd('highlight ConflictMarkerBegin guibg=#2f7366')
      vim.cmd('highlight ConflictMarkerOurs guibg=#2e5049')
      vim.cmd('highlight ConflictMarkerTheirs guibg=#344f69')
      vim.cmd('highlight ConflictMarkerEnd guibg=#2f628e')
      vim.cmd('highlight ConflictMarkerSeparator guibg=#000000')
      vim.cmd('highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81')
    end
  }
}
