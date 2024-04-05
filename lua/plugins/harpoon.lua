return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader><leader>a",
        function() require("harpoon"):list():add() end,
        desc = "[Marks] Add file to marks",
      },
      {
        "<leader><leader>d",
        function() require("harpoon"):list():remove() end,
        desc = "[Marks] Remove file from marks",
      },
      {
        "<leader><leader>c",
        function() require("harpoon"):list():clear() end,
        desc = "[Marks] Clear marks",
      },
      {
        "<leader><leader>m",
        function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
        desc = "[Marks] Toggle harpoon marks menu",
      },
      {
        "<C-p>",
        function() require("harpoon"):list():prev() end,
        desc = "[Marks] Goto previous mark",
      },
      {
        "<C-n>",
        function() require("harpoon"):list():next() end,
        desc = "[Marks] Goto next mark",
      },
    },
  },
}
