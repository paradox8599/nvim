return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    event = "VeryLazy",
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup {}
      vim.keymap.set(
        "n",
        "<leader><leader>a",
        function() harpoon:list():append() end,
        { desc = "[Marks] Add file to marks" }
      )
      vim.keymap.set(
        "n",
        "<leader><leader>d",
        function() harpoon:list():remove() end,
        { desc = "[Marks] Remove file from marks" }
      )
      vim.keymap.set("n", "<leader><leader>c", function() harpoon:list():clear() end, { desc = "[Marks] Clear marks" })
      vim.keymap.set(
        "n",
        "<leader><leader>m",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "[Marks] Toggle harpoon marks menu" }
      )
      vim.keymap.set(
        "n",
        "<C-p>",
        function() require("harpoon"):list():prev() end,
        { desc = "[Marks] Goto previous mark" }
      )
      vim.keymap.set("n", "<C-n>", function() require("harpoon"):list():next() end, { desc = "[Marks] Goto next mark" })
    end,
  },
}
