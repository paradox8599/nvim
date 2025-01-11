return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  -- config = function() require("lspsaga").setup {} end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },

  keys = {
    -- edit = 'e' edit (open) file
    -- vsplit = 's' vsplit
    -- split = 'i' split
    -- tabe = 't' open in new tab
    -- quit = 'q' quit layout
    -- shuttle = '[w' shuttle bettween the layout left and right
    -- toggle_or_req = 'u' toggle or do request
    -- close = '<C-c>k' close layout
    { "<leader>lq", function() vim.cmd [[Lspsaga outgoing_calls]] end, desc = "Outgoing calls" },
    { "<leader>le", function() vim.cmd [[Lspsaga incoming_calls]] end, desc = "Incoming calls" },
    -- code action
    { "<Leader>lg", function() vim.cmd [[Lspsaga code_action]] end, desc = "Code action" },
  },

  opts = {
    symbol_in_winbar = { enable = false },
    callhierarchy = {
      enable = true,
    },
  },
}
