return {
  "folke/snacks.nvim",

  dependencies = {
    -- disables duplicate plugins
    { "goolord/alpha-nvim", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "RRethy/vim-illuminate", enabled = false },
  },

  priority = 1000,
  lazy = false,

  keys = {
    -- { "<leader>uD", function() require("snacks.notifier").hide() end, desc = "Dismiss all Snacks Notifications" },
    { "<leader>gb", function() require("snacks").git.blame_line() end, desc = "Git blame line" },
    { "<leader>gf", function() require("snacks").lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>br", function() require("snacks").rename.rename_file() end, desc = "Rename File" },
    { "<leader>h", function() require("snacks").dashboard() end, desc = "Dashboard" },
    {
      "]]",
      function() require("snacks").words.jump(vim.v.count1) end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function() require("snacks").words.jump(-vim.v.count1) end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    { "<leader>.", function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>,", function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
  },

  opts = {
    bigfile = { notify = true, size = 1 * 1024 * 1024 },
    git = { enabled = true },
    lazygit = { enabled = true },
    quickfile = { enabled = true },
    words = {
      enabled = true,
      debounce = 200, -- time in ms to wait before updating
      notify_jump = false, -- show a notification when jumping
      notify_end = true, -- show a notification when reaching the end
      foldopen = true, -- open folds after jumping
      jumplist = true, -- set jump point before jumping
      modes = { "n", "i", "c" }, -- modes to show references
    },
    terminal = { enabled = false },
    scratch = {},

    indent = {
      enabled = true,
      animate = {
        enabled = true,
        style = "down",
        druation = { step = 20, total = 120 },
      },
      scope = { enabled = false, underline = true },
      chunk = { enabled = true },
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 2 },
        {
          pane = 1,
          gap = 1,
          icon = " ",
          title = " Recent",
          section = "recent_files",
          indent = 4,
          padding = 1,
        },
        {
          pane = 1,
          gap = 1,
          icon = " ",
          title = " Projects",
          section = "projects",
          indent = 4,
          padding = 1,
        },
        { section = "startup" },
      },
    },
  },
}
