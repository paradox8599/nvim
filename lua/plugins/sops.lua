return {
  enabled = false,
  "lucidph3nx/nvim-sops",
  event = { "BufEnter" },
  opts = {},
  keys = {
    { "<leader>be", vim.cmd.SopsEncrypt, desc = "Encrypt file" },
    { "<leader>bd", vim.cmd.SopsDecrypt, desc = "Decrypt File" },
  },
}
