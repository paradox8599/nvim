return {
  {
    enabled = false,
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    event = "User AstroGitFile",
    cmd = {
      "GitConflictListQf",
      "GitConflictChooseTheirs",
      "GitConflictChooseOurs",
      "GitConflictChooseBoth",
      "GitConflictChooseNone",
      "GitConflictNextConflict",
      "GitConflictPrevConflict",
    },
    keys = {
      { "<leader>gx", ":GitConflictListQf<cr>", desc = "Git conflict list" },
    },
    opts = {
      default_mappings = true, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = "copen", -- command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffAdd",
        current = "DiffText",
      },
    },
  },
}
