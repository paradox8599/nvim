# AGENTS.md - Neovim Configuration

This is an AstroNvim v5 configuration written in Lua. It uses lazy.nvim as the plugin manager.

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point: bootstraps lazy.nvim, loads lazy_setup + polish
├── lua/
│   ├── lazy_setup.lua       # Lazy.nvim setup with AstroNvim and plugin imports
│   ├── community.lua        # AstroCommunity plugin packs (language packs, utilities)
│   ├── polish.lua           # Post-setup customizations (keymap deletions, autocmds)
│   ├── lib/                 # Utility modules
│   │   └── os_detect.lua    # OS detection utility (Windows/Mac/Linux)
│   └── plugins/
│       ├── init.lua         # Imports all plugin subdirectories
│       ├── core/            # Core: astrocore, blink, snacks, treesitter
│       ├── lsp/             # LSP: astrolsp, none-ls, live-rename, symbol-usage
│       ├── ui/              # UI: astroui, heirline, noice, transparent, smear-cursor
│       ├── editing/         # Editing: surround, grug-far, dial, luasnip, treesj
│       ├── tools/           # Tools: neo-tree, mason, overseer, undotree, arrow
│       ├── git/             # Git: git-conflict, open-github-url
│       ├── content/         # Content: render-markdown, rainbow-csv, log-highlight
│       └── _disabled/       # Disabled plugins (kept for reference)
├── snippets/                # VS Code-style snippets (js.json, package.json)
└── lazy-lock.json           # Plugin version lockfile
```

## Build/Lint/Test Commands

There are no build or test commands for this configuration. Use the following tools:

### Formatting (StyLua)
```bash
# Format all Lua files
stylua .

# Format a single file
stylua lua/plugins/core/astrocore.lua

# Check formatting without writing
stylua --check .
```

### Linting (Selene)
```bash
# Lint all Lua files
selene .

# Lint a single file
selene lua/plugins/core/astrocore.lua
```

### Neovim Commands
```vim
:Lazy              " Plugin manager UI
:Lazy sync         " Update all plugins
:Mason             " LSP/tool installer UI
:checkhealth       " Diagnose configuration issues
:LspInfo           " Show active LSP clients
:LspRestart        " Restart LSP servers
```

## Code Style Guidelines

### Formatting Rules (from .stylua.toml)
- Column width: 120 characters
- Indentation: 2 spaces
- Line endings: Unix (LF)
- Quote style: Auto prefer double quotes
- Call parentheses: None for single string/table args
- Collapse simple statements: Always

```lua
-- Correct: no parentheses for require with string
local os = require "lib.os_detect"
require "lazy_setup"

-- Correct: parentheses for function calls with multiple args
require("snacks.picker").projects()
```

### File Naming
- Use lowercase with hyphens: `git-conflict.lua`, `smart-splits.lua`
- Directory names are lowercase: `plugins/`, `core/`, `editing/`

### Variable Naming
- Use snake_case for variables: `local null_ls`, `opts.task_list`
- Use snake_case for functions: `function setup_keymaps()`

### Type Annotations
Always add LuaCATS type annotations for plugin specs and options:

```lua
---@type LazySpec
return { ... }

---@type AstroCoreOpts
opts = { ... }

---@type AstroLSPOpts
opts = { ... }

---@module 'overseer'
---@param opts overseer.Config
opts = function(_, opts) ... end

-- Suppress diagnostics when needed
---@diagnostic disable-next-line: missing-fields
```

### Plugin Spec Pattern

Single plugin:
```lua
---@type LazySpec
return {
  "plugin/name",
  opts = { ... },
}
```

Multiple plugins:
```lua
return {
  { "plugin/one", opts = {} },
  { "plugin/two", opts = {} },
}
```

### Options Patterns

Static configuration:
```lua
opts = {
  enable_git_status = true,
  filesystem = { ... },
},
```

Dynamic configuration (modify existing opts):
```lua
opts = function(_, opts)
  local maps = opts.mappings
  -- modify opts table
  opts.task_list = { direction = "bottom" }
end,
```

### Keymap Style

In astrocore mappings table:
```lua
mappings = {
  n = {
    ["<Leader>y"] = { '"+y', desc = "Yank to system clipboard" },
    ["<tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    -- Disable a mapping
    ["gra"] = false,
  },
  v = { ... },
  t = { ... },
},
```

In plugin keys table:
```lua
keys = {
  { "<leader>fp", function() require("snacks.picker").projects() end, desc = "Find Projects" },
  { mode = { "n", "x" }, "<leader>ss", function() ... end, desc = "Search" },
},
```

### OS-Specific Configuration
```lua
local os = require "lib.os_detect"

-- Conditional import
os.is_win and { import = "astrocommunity/pack/cs" } or {},
{ import = "astrocommunity/pack/nix", enabled = os.is_linux },
```

### Disabling Plugins

Disable entire file (place at top):
```lua
if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
```

Disable specific plugin:
```lua
{ "plugin/name", enabled = false, optional = true },
```

### Import Style
- Local requires at file top for utilities
- Inline requires in functions for lazy-loaded modules

```lua
-- Top of file
local os = require "lib.os_detect"

-- Inside functions (lazy-loaded)
function() require("snacks.picker").projects() end
```

### Error Handling
- Use `pcall` for operations that may fail
- Check plugin availability before use:
```lua
if require("astrocore").is_available "toggleterm.nvim" then
  opts.strategy = "toggleterm"
end
```

### Comments
- Use `-- stylua: ignore` to prevent formatting of next line
- Add descriptive comments for non-obvious configuration
- Reference documentation with `:h <topic>`

```lua
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
```

## Selene Linting Rules (from selene.toml)
- Standard: neovim
- Allowed: global_usage, if_same_then_else, incorrect_standard_library_use, mixed_table, multiple_statements
