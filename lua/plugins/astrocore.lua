-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      resession_enabled = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        scrolloff = 15,
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        clipboard = "",
        conceallevel = 0,
        list = true,
        swapfile = true,
        backup = false,
        writebackup = false,
        -- mouse = "",
        laststatus = 3,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["<Esc>"] = { ":noh<cr>" },
        -- second key is the lefthand side of the map
        k = { "v:count == 0 ? 'gk' : 'k'", desc = "Auto gk", expr = true },
        j = { "v:count == 0 ? 'gj' : 'j'", desc = "Auto gj", expr = true },
        J = { "mzJ`z", desc = "Keep cursor position when J" },
        n = { "nzzzv", desc = "Keep search term highlight in the middle" },
        N = { "Nzzzv", desc = "Keep search term highlight in the middle" },

        ["<Leader>p"] = { '"_dP', desc = "Paste without yank" },
        ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
        ["<Leader>k"] = { ":b#<cr>", desc = "Last buffer" },
        ["<Leader>lc"] = { ":LspRestart<cr>", desc = "Restart LSP" },

        -- navigate buffer tabs with `<tab>` and `<S-tab>`
        -- ["<tab>"] = { "]b", desc = "Next buffer" },
        -- ["<S-tab>"] = { "[b", desc = "Previous buffer" },

        -- ["<Leader>bD"] = {
        --   function()
        --     require("astronvim.utils.status").heirline.buffer_picker(
        --       function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        --     )
        --   end,
        --   desc = "Pick to close",
        -- },
        ["<Leader>bm"] = { ":PeekOpen<CR>", desc = "Toggle Markdown preview" },
        ["<Leader>ub"] = { ":HexToggle<cr>", desc = "Toggle Hex Editor" },

        -- UI
        ["<Leader>L"] = { ":Lazy<cr>", desc = "[L]azy" },
        ["<Leader>M"] = { ":Mason<cr>", desc = "[M]ason" },

        -- ["<Leader><Leader>"] = { name = "Mappings" },
      },
      i = {},
      t = {},
      v = {
        ["<Leader>p"] = { '"_dP', desc = "Paste without yank" },
        ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
      },
    },
  },
}
