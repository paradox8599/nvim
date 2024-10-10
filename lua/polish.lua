-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local is_win = require("utils").is_win

-- set font for neovide
if vim.g.neovide then vim.o.guifont = "JetBrainsMono Nerd Font:h12" end

local dap = require "dap"
dap.adapters.lldb = dap.adapters.codelldb

local cfg_path = vim.fn.stdpath "config"

if is_win then
  os.execute(tostring("sh " .. cfg_path .. "/scripts/win/alpha_replace.sh"))
else
  os.execute(tostring("sh " .. cfg_path .. "/scripts/alpha_replace.sh"))
end
