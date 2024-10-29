-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

-- local is_shell_cmd = not (string.find(vim.o.shell, "cmd.exe") == nil)

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
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      resession_enabled = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
      -- signs = false,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        scrolloff = 15,
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        clipboard = "", -- separate system & nvim clipboards
        conceallevel = 0,
        list = true,
        -- swapfile = true,
        -- backup = false,
        -- writebackup = false,
        laststatus = 3,
        -- shiftwidth = 2,
        -- mouse = "",

        -- shell = (is_shell_cmd and vim.fn.executable "pwsh" == 1) and "pwsh" or nil,
        -- shellcmdflag = is_shell_cmd
        --     and "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
        --   or nil,
        -- shellredir = is_shell_cmd and "-RedirectStandardOutput %s -NoNewWindow -Wait" or nil,
        -- shellpipe = is_shell_cmd and "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode" or nil,
        -- shellquote = is_shell_cmd and "" or nil,
        -- shellxquote = is_shell_cmd and "" or nil,
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
        ["<Esc>"] = { "<cmd>nohlsearch<CR>", desc = "No Highlight" },
        ["<Leader>z"] = { desc = "Color" },
        ["<Leader>i"] = { desc = "Toggle word under cursor" },
        ["<Leader><Leader>"] = { desc = "Other" },

        J = { "mzJ`z", desc = "Keep cursor position when J" },
        n = { "nzzzv", desc = "Keep search term highlight in the middle" },
        N = { "Nzzzv", desc = "Keep search term highlight in the middle" },
        ["<Leader>p"] = { '"_dP', desc = "Paste without yank" },
        ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
        ["<Leader>k"] = { "<cmd>b#<cr>", desc = "Last buffer" },
        ["<Leader>lc"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },

        ["<Leader>bm"] = { "<cmd>PeekOpen<cr>", desc = "Toggle Markdown preview" },
        ["<Leader>uB"] = { "<cmd>HexToggle<cr>", desc = "Toggle Hex Editor" },

        -- navigate buffer tabs
        ["<tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader><Leader>f"] = { desc = "Neoconf" },
        -- :Neoconf: will show a ui to select one of the local/global json config files to edit
        ["<Leader><Leader>ff"] = { "<cmd>Neoconf<cr>", desc = "Neocon[f]" },
        -- :Neoconf local: will show a ui to select one of the local json config files to edit
        ["<Leader><Leader>fl"] = { "<cmd>Neoconf local<cr>", desc = "Neoconf [L]ocal" },
        -- :Neoconf global: will show a ui to select one of the global json config files to edit
        ["<Leader><Leader>fg"] = { "<cmd>Neoconf global<cr>", desc = "Neoconf [G]lobal" },
        -- :Neoconf show: opens a floating window with the merged config
        ["<Leader><Leader>fs"] = { "<cmd>Neoconf show<cr>", desc = "Neoconf [S]how" },
        -- :Neoconf lsp: opens a floating window with your merged lsp config
        ["<Leader><Leader>fp"] = { "<cmd>Neoconf lsp<cr>", desc = "Neoconf LS[P]" },

        ["gr"] = { vim.lsp.buf.references, desc = "references" },
        ["gra"] = false,
        ["grr"] = false,
        ["grn"] = false,
      },
      v = {
        ["<Leader>p"] = { '"_dP', desc = "Paste without yank" },
        ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
      },
    },
  },
}
