-- https://github.com/vyfor/cord.nvim
-- if true then return {} end

return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",

    -- https://github.com/vyfor/cord.nvim/blob/master/.github/wiki/Configuration.md
    opts = {
      editor = {
        client = "neovim",
        tooltip = "I use neovim btw",
        icon = nil,
      },

      display = {
        theme = "default",
        flavor = "dark",
        swap_fields = false,
        swap_icons = false,
      },

      timestamp = {
        enabled = true,
        reset_on_idle = false,
        reset_on_change = false,
      },

      idle = {
        enabled = true,
        timeout = 300000, -- milliseconds
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = "Idling",
        state = nil,
        tooltip = "💤",
      },

      text = {
        editing = function(opts)
          return string.format("Editing %s - %s:%s, %s problems", opts.filename, opts.cursor_line, opts.cursor_char)
        end,
        terminal = "Terminal: ${filename}",
      },
      variables = true,

      hooks = {},

      plugins = {
        -- scope: workspace | buffer
        ["cord.plugins.diagnostics"] = { scope = "buffer", override = true },
        ["cord.plugins.scoped_timestamps"] = { scope = "workspace", pause = true },
      },

      advanced = {},
    },
  },
}
