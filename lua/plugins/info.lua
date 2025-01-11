-- local SymbolKind = vim.lsp.protocol.SymbolKind

local function h(name) return vim.api.nvim_get_hl(0, { name = name }) end

-- hl-groups can have any name
vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("CursorLine").bg, fg = h("Comment").fg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = true })

local function text_format(symbol)
  local res = {}

  local round_start = { "", "SymbolUsageRounding" }
  local round_end = { "", "SymbolUsageRounding" }

  -- Indicator that shows if there are any other symbols in the same line
  local stacked_functions_content = symbol.stacked_count > 0 and ("+%s"):format(symbol.stacked_count) or ""

  if symbol.references then
    local usage = symbol.references <= 1 and "usage" or "usages"
    local num = symbol.references == 0 and "no" or symbol.references
    table.insert(res, round_start)
    table.insert(res, { "󰌹 ", "SymbolUsageRef" })
    table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.definition then
    if #res > 0 then table.insert(res, { " ", "NonText" }) end
    table.insert(res, round_start)
    table.insert(res, { "󰳽 ", "SymbolUsageDef" })
    table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.implementation then
    if #res > 0 then table.insert(res, { " ", "NonText" }) end
    table.insert(res, round_start)
    table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
    table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if stacked_functions_content ~= "" then
    if #res > 0 then table.insert(res, { " ", "NonText" }) end
    table.insert(res, round_start)
    table.insert(res, { " ", "SymbolUsageImpl" })
    table.insert(res, { stacked_functions_content, "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  return res
end

return {
  -- display current scope name at top
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "BufEnter",
  --   opts = {
  --     enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  --     max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
  --     min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  --     line_numbers = true,
  --     multiline_threshold = 5, -- Maximum number of lines to show for a single context
  --     trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  --     mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  --     -- Separator between context and content. Should be a single character string, like '-'.
  --     -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  --     separator = nil,
  --     zindex = 20, -- The Z-index of the context window
  --     on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  --   },
  -- },

  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },

  { "fei6409/log-highlight.nvim", ft = { "log" }, opts = {} },

  { "ray-x/lsp_signature.nvim", event = "BufRead", opts = {} },

  -- references and definitions count
  { "VidocqH/lsp-lens.nvim", config = false },

  {
    "Wansmer/symbol-usage.nvim",
    -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    event = "LspAttach",
    keys = {
      {
        "<leader>ux",
        function() require("symbol-usage").toggle() end,
        desc = "Toggle symbol usage for current buffer",
      },
      {
        "<leader>uX",
        function() require("symbol-usage").toggle_globally() end,
        desc = "Toggle symbol usage globally",
      },
    },
    opts = {
      text_format = text_format,
      ---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
      vt_position = "above",
      request_pending_text = "loading...",
      references = { enabled = true, include_declaration = false },
      definition = { enabled = true },
      implementation = { enabled = true },
    },
  },

  -- variable definition highlight
  { "chrisgrieser/nvim-dr-lsp", event = "LspAttach", opts = {} },

  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    keys = {
      { "gpd", function() require("goto-preview").goto_preview_definition {} end, desc = "Goto Preview [D]efinition" },
      {
        "gpt",
        function() require("goto-preview").goto_preview_type_definition {} end,
        desc = "Goto Preview [T]ype Definition",
      },
      {
        "gpi",
        function() require("goto-preview").goto_preview_implementation {} end,
        desc = "Goto Preview [I]mplementation",
      },
      {
        "gpD",
        function() require("goto-preview").goto_preview_declaration {} end,
        desc = "Goto Preview [D]eclaration",
      },
      {
        "gpc",
        function() require("goto-preview").close_all_win() end,
        desc = "[C]lose All Preview",
      },
      {
        "gpr",
        function() require("goto-preview").goto_preview_references {} end,
        desc = "Goto Preview [R]eferences",
      },
    },

    opts = {
      width = 100, -- Width of the floating window
      height = 16, -- Height of the floating window
      -- border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
      default_mappings = false, -- Bind default mappings
      debug = false, -- Print debug information
      -- opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
      -- resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
      -- post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      -- post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      -- references = { -- Configure the telescope UI for showing the references cycling window.
      --   telescope = require("telescope.themes").get_dropdown { hide_preview = false },
      -- },
      -- -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true, -- Focus the floating window when opening it.
      -- dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
      -- force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      -- bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
      -- stack_floating_preview_windows = true, -- Whether to nest floating windows
      -- same_file_float_preview = true, -- Whether to open a new floating window for a reference within the current file
      -- preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
      -- zindex = 1, -- Starting zindex for the stack of floating windows
    },
  },
}
