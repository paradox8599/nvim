return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = "*", -- set this to "*" if you want to always pull the latest change, false to update on release

  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
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
    provider = "ollama",
    vendors = {
      ollama = {
        -- endpoint = "http://172.29.80.1:11434/api/generate",
        model = "phi4",
        -- parse_curl_args = function(opts, code_opts)
        --   return {
        --     url = opts.endpoint,
        --     headers = {
        --       ["Accept"] = "application/json",
        --       ["Content-Type"] = "application/json",
        --     },
        --     body = {
        --       model = opts.model,
        --       prompt = require("avante.providers").ollama.parse_message(code_opts),
        --       -- max_tokens = 4096,
        --       stream = true,
        --     },
        --   }
        -- end,
        -- parse_response_data = function(data_stream, event_state, opts)
        --   require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        -- end,
      },
    },
  },
}
