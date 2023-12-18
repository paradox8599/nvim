---@type MappingsTable
local M = {}

vim.keymap.set({ "n", "i" }, "<A-F>", function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format" })

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>gx"] = { ":silent! OpenGitHubUrlUnderCursor<cr>", "Open plugin github page" },
    ["<leader>sf"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>sa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>sg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>ss"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>sk"] = { "<cmd> Telescope keymaps <CR>", "Find buffers" },
    ["<leader>sh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>sz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

-- more keybinds!

return M
