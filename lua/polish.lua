-- set font for neovide
if vim.g.neovide then vim.o.guifont = "JetBrainsMono Nerd Font:h12" end

-- renaming rust dap for it to be recognised
require("dap").adapters.lldb = require("dap").adapters.codelldb

-- require("lspconfig").taplo.setup {}

vim.diagnostic.config { virtual_text = false }
