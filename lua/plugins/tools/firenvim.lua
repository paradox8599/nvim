local os = require "lib.os_detect"

return {
  "glacambre/firenvim",
  cond = not os.is_linux,
  lazy = not vim.g.started_by_firenvim,
  build = ":call firenvim#install(0)",
  config = function()
    vim.g.firenvim_config = {
      globalSettings = { alt = "all" },
      localSettings = { [".*"] = { content = "text", takeover = "never" } },
    }
    vim.api.nvim_create_autocmd({ "UIEnter" }, {
      callback = function()
        if vim.o.lines < 16 then vim.o.lines = 16 end
        if vim.o.columns < 80 then vim.o.columns = 80 end
        vim.cmd [[set background=light]]
      end,
    })
    -- autosave
    -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    --   nested = true,
    --   command = "write",
    -- })
  end,
}
