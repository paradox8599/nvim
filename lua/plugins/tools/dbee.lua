return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  opts = {},
  -- config = function()
  --   require("dbee").setup(--[[optional config]])
  -- end,
  keys = {
    { "<leader>dd", function() require("dbee").toggle() end, desc = "Toggle Dbee" },
  },
}

-- yaj: Yank current row as JSON (or row range in visual mode)
-- yac: Yank current row as CSV (or row range in visual mode)
-- yaJ: Yank all rows as JSON
-- yaC: Yank all rows as CSV1
