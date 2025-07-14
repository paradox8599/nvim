-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
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
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap

        clipboard = "", -- separate system & nvim clipboards
        conceallevel = 0,
        list = true,
        -- swapfile = true,
        -- backup = false,
        -- writebackup = false,
        laststatus = 3,
        -- shiftwidth = 2,
        -- mouse = "",
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
      -- first key is the mode
      n = {
        H = { "<cmd>bprev<cr>", desc = "Previous buffer" },
        L = { "<cmd>bnext<cr>", desc = "Next buffer" },
        ["<esc>"] = { "<cmd>nohlsearch<cr>", desc = "Clear search highlights" },
        -- second key is the lefthand side of the map
        J = { "mzJ`z", desc = "Keep cursor position when J" },
        ["<Leader>p"] = { '"_dP', desc = "Paste without yank" },
        ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
        ["<Leader>k"] = { "<cmd>b#<cr>", desc = "Last buffer" },
        ["<Leader>lc"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },

        -- navigate buffer tabs
        ["<tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["gr"] = { vim.lsp.buf.references, desc = "references" },
        ["gra"] = false,
        ["grr"] = false,
        ["grn"] = false,

        ["<Leader>ga"] = {
          "<cmd>term git add . && aider --commit<cr>",
          desc = "Auto Commit with aider",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        ["<Leader>p"] = { '"_dP', desc = "Paste without yank" },
        ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
      },
      t = {
        ["<Tab>"] = { "<Tab>" },
        ["<C-i>"] = { "<cmd>hide<cr>" },
      },
    },
  },
}
