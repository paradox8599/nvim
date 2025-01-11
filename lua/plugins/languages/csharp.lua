-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/cs/init.lua
local utils = require "../../utils"
if not utils.is_win then return {} end

return {
  -- CSharp support
  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
    ft = { "cs", "csproj", "sln" },
    dependencies = {

      {
        "AstroNvim/astrolsp",
        opts = {
          config = {
            csharp_ls = {
              handlers = {
                ["textDocument/definition"] = function(...) require("csharpls_extended").handler(...) end,
                ["textDocument/typeDefinition"] = function(...) require("csharpls_extended").handler(...) end,
              },
            },
          },
        },
      },

      {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = function(_, opts)
          if opts.ensure_installed ~= "all" then
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "c_sharp" })
          end
        end,
      },

      {
        "jay-babu/mason-null-ls.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "csharpier" })
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "csharp_ls" })
        end,
      },

      {
        "jay-babu/mason-nvim-dap.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "coreclr" })
        end,
      },

      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(
            opts.ensure_installed,
            { "csharp-language-server", "csharpier", "netcoredbg" }
          )
        end,
      },

      {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = { "Issafalcon/neotest-dotnet", config = function() end },
        opts = function(_, opts)
          if not opts.adapters then opts.adapters = {} end
          table.insert(opts.adapters, require "neotest-dotnet"(require("astrocore").plugin_opts "neotest-dotnet"))
        end,
      },
    },
  },
}
