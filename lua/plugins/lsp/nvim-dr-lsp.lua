-- variable definition highlight
return {
  "chrisgrieser/nvim-dr-lsp",
  event = "LspAttach",
  opts = {
    highlightCursorWordReferences = {
      enable = true,
    },
  },
}
