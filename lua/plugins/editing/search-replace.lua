return {
  "roobert/search-replace.nvim",

  config = function()
    -- g: global
    -- c: confirm
    -- i: case insensitive
    -- I: case sensitive
    require("search-replace").setup {
      -- default_replace_single_buffer_options = "gcI",
      -- default_replace_multi_buffer_options = "egcI",
    }

    -- show the effects of a search / replace in a live preview window
    -- vim.o.inccommand = "split"
  end,

  keys = {
    { mode = "v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", desc = "Search Replace: Replace" },
    { mode = "v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", desc = "Search Replace: Selection" },
    { mode = "v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", desc = "Search Replace: Cursor Word" },

    { mode = "n", "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>", desc = "Search Replace: Selections" },
    { mode = "n", "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>", desc = "Search Replace: Open" },
    { mode = "n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", desc = "Search Replace: Cursor Word" },
    { mode = "n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", desc = "Search Replace: Cursor WORD" },
    { mode = "n", "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>", desc = "Search Replace: Cursor Expr" },
    { mode = "n", "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>", desc = "Search Replace: Cursor File" },

    {
      mode = "n",
      "<leader>rbs",
      "<CMD>SearchReplaceMultiBufferSelections<CR>",
      desc = "Search Replace: Multi Buffer Selections",
    },
    {
      mode = "n",
      "<leader>rbo",
      "<CMD>SearchReplaceMultiBufferOpen<CR>",
      desc = "Search Replace: Multi Buffer Open",
    },
    {
      mode = "n",
      "<leader>rbw",
      "<CMD>SearchReplaceMultiBufferCWord<CR>",
      desc = "Search Replace: Multi Buffer Cursor Word",
    },
    {
      mode = "n",
      "<leader>rbW",
      "<CMD>SearchReplaceMultiBufferCWORD<CR>",
      desc = "Search Replace: Multi Buffer Curosr WORD",
    },
    {
      mode = "n",
      "<leader>rbe",
      "<CMD>SearchReplaceMultiBufferCExpr<CR>",
      desc = "Search Replace: Multi Buffer Cursor Expr",
    },
    {
      mode = "n",
      "<leader>rbf",
      "<CMD>SearchReplaceMultiBufferCFile<CR>",
      desc = "Search Replace: Multi Buffer Cursor File",
    },
  },
}
