return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
    opts = {
      editor = {
        client = "neovim",
        tooltip = "I use neovim btw",
        icon = nil,
      },
      display = {
        theme = "catppuccin",
        flavor = "dark",
        view = "full",
        swap_fields = false,
        swap_icons = false,
      },
      timestamp = {
        enabled = true,
        reset_on_idle = false,
        reset_on_change = false,
        shared = false,
      },
      idle = {
        enabled = true,
        timeout = 300000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = "Idling",
        state = nil,
        tooltip = "💤",
        icon = nil,
      },
      text = {
        editing = function(opts)
          local text = "Editing " .. opts.filename
          local line = vim.fn.line(".")
          local col = vim.fn.col(".")
          text = text .. " @ " .. line .. ":" .. col
          local problems = #vim.diagnostic.get(0)
          if problems > 0 then text = text .. " ⚠️ " .. problems end
          return text
        end,
        viewing = "Viewing ${filename}",
        workspace = function()
          local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
          return "On branch: " .. (branch or "unknown")
        end,
        file_browser = "Browsing files in ${name}",
        plugin_manager = "Managing plugins in ${name}",
        lsp = "Configuring LSP in ${name}",
        docs = "Reading ${name}",
        terminal = "Terminal: ${name}",
      },
      buttons = {
        {
          label = "View Repository",
          url = function(opts) return opts.repo_url end,
        },
      },
      variables = true,
      advanced = {
        plugin = {
          autocmds = true,
          cursor_update = "on_hold",
          match_in_mappings = true,
        },
      },
    },
  },
}
