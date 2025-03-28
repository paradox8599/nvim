local osd = require "lib.os_detect"
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = "*", -- set this to "*" if you want to always pull the latest change, false to update on release

  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = osd.is_win and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  opts = {
    provider = "openai",
    auto_suggestions_provider = "openai",
    openai = {
      endpoint = "",
      model = "",
      temperature = 0.6,
      max_tokens = 8192,
      reasoning_effort = "medium",
    },
    windows = { width = 45 },
    behaviour = {
      auto_suggestions = false,
    },
  },

  keys = {
    { "<leader>an", "<cmd>AvanteClear<cr>", desc = "New Chat" },
  },
}
