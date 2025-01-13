return {
  "ThePrimeagen/harpoon",

  branch = "harpoon2",

  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require "harpoon"
    local extensions = require "harpoon.extensions"

    -- REQUIRED
    harpoon:setup()
    harpoon:extend(extensions.builtins.navigate_with_number())

    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set(
          "n",
          "<C-v>",
          function() harpoon.ui:select_menu_item { vsplit = true } end,
          { buffer = cx.bufnr }
        )
        vim.keymap.set("n", "<C-x>", function() harpoon.ui:select_menu_item { split = true } end, { buffer = cx.bufnr })
      end,
    }

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set(
      "n",
      "<leader>fe",
      function() toggle_telescope(require("harpoon"):list()) end,
      { desc = "Open harpoon window" }
    )
  end,

  keys = {
    { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon [A]dd" },
    {
      "<leader>hh",
      function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
      desc = "[H]arpoon List",
    },
    -- { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon select [1]" },
    -- { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon select [2]" },
    -- { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon select [3]" },
    -- { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon select [4]" },
    -- { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "Harpoon select [5]" },
    -- { "<leader>h6", function() require("harpoon"):list():select(6) end, desc = "Harpoon select [6]" },

    { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Harpoon [P]rev" },
    { "<leader>hn", function() require("harpoon"):list():next() end, desc = "Harpoon [N]ext" },

    { "<leader>hc", function() require("harpoon"):list():clear() end, desc = "Harpoon [C]lear" },
    { "<leader>hd", function() require("harpoon"):list():remove() end, desc = "Harpoon [D]elete" },

    { "<leader>fe", desc = "Harpoon" },
  },
}
