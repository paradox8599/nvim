-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- set font for neovide
if vim.g.neovide then vim.o.guifont = "JetBrainsMono Nerd Font:h12" end

-- replace alpha footer 'AstroNvim' with 'VSCode'
local utils = require "utils"
local cfg_path = vim.fn.stdpath "config"
if utils.is_win then os.execute(tostring("sh " .. cfg_path .. "/scripts/win/alpha_replace.sh")) end
if utils.is_mac then os.execute(tostring("sh " .. cfg_path .. "/scripts/darwin/alpha_replace.sh")) end
if utils.is_linux then os.execute(tostring("sh " .. cfg_path .. "/scripts/alpha_replace.sh")) end

-- renaming rust dap
require("dap").adapters.lldb = require("dap").adapters.codelldb

-- require("lspconfig").taplo.setup {}
