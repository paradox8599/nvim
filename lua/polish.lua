-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- set font for neovide
if vim.g.neovide then vim.o.guifont = "JetBrainsMono Nerd Font:h12" end

-- renaming rust dap for it to be recognised
require("dap").adapters.lldb = require("dap").adapters.codelldb

-- require("lspconfig").taplo.setup {}
