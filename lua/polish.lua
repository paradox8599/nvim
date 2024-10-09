-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- set font for neovide
if vim.g.neovide then vim.o.guifont = "JetBrainsMono Nerd Font:h12" end

local dap = require "dap"
dap.adapters.lldb = dap.adapters.codelldb
