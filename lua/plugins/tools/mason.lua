-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`

    -- https://www.reddit.com/r/AstroNvim/comments/1hcktn5/disable_emmet_from_packtypescript/
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(s) return s ~= "emmet_ls" end, opts.ensure_installed)
    end,
  },
}
