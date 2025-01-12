return {
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    opts = {
      -- enable_chat = true,
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        -- Set to true if you never want completions to be shown automatically.
        manual = false,
        -- A mapping of filetype to true or false, to enable virtual text.
        filetypes = {},
        -- Whether to enable virtual text of not for filetypes not specifically listed above.
        default_filetype_enabled = true,
        -- How long to wait (in ms) before requesting completions after typing stops.
        idle_delay = 150,
        -- Priority of the virtual text. This usually ensures that the completions appear on top of
        -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
        -- desired.
        virtual_text_priority = 65535,
        -- Set to false to disable all key bindings for managing completions.
        map_keys = true,
        -- The key to press when hitting the accept keybinding but no completion is showing.
        -- Defaults to \t normally or <c-n> when a popup is showing.
        accept_fallback = nil,
        -- Key bindings for managing completions in virtual text mode.
        key_bindings = {
          accept = "<C-k>",
          accept_word = "<C-w>",
          accept_line = "<C-l>",
          clear = "<C-x>",
          next = "<A-.>",
          prev = "<A-,>",
        },
      },
    },
  },

  {
    "Exafunction/codeium.vim",
    enabled = true,
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set(
        "i",
        "<C-l>",
        function() return vim.fn["codeium#AcceptNextLine"]() end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<C-w>",
        function() return vim.fn["codeium#AcceptNextWord"]() end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<A-.>",
        function() return vim.fn["codeium#CycleCompletions"](1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<A-,>",
        function() return vim.fn["codeium#CycleCompletions"](-1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    end,
  },
}
