-- renaming rust dap for it to be recognised
require("dap").adapters.lldb = require("dap").adapters.codelldb

-- turn off virtual text for tiny inline diagnostic
vim.diagnostic.config { virtual_text = false }
