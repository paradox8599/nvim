vim.keymap.del("n", "<leader>fl")

-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function() vim.lsp.enable("eslint", false) end,
-- })

-- ============================================================
-- .ipynb notebook viewer/editor via jupytext CLI (zero-plugin)
-- Opens .ipynb as python percent-format, converts back on save
-- ============================================================

vim.api.nvim_create_augroup("jupytext_ipynb", { clear = true })

vim.api.nvim_create_autocmd("BufReadCmd", {
  group = "jupytext_ipynb",
  pattern = "*.ipynb",
  callback = function(args)
    local file = vim.fn.expand(args.file)
    local stdout = vim.fn.system({ "jupytext", "--to", "py:percent", "--output", "-", file })
    if vim.v.shell_error ~= 0 then
      vim.notify("jupytext: " .. vim.trim(stdout), vim.log.levels.ERROR)
      vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, { "# jupytext error reading " .. file })
      return
    end
    vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, vim.split(stdout, "\n"))
    vim.bo[args.buf].filetype = "python"
    vim.bo[args.buf].modified = false
    vim.api.nvim_buf_set_name(args.buf, file)
  end,
})

vim.api.nvim_create_autocmd("BufWriteCmd", {
  group = "jupytext_ipynb",
  pattern = "*.ipynb",
  callback = function(args)
    local file = vim.fn.expand(args.file)
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
    local stdout = vim.fn.system({ "jupytext", "--from", "py:percent", "--to", "notebook", "--output", file, "-" }, lines)
    if vim.v.shell_error ~= 0 then
      vim.notify("jupytext: " .. vim.trim(stdout), vim.log.levels.ERROR)
      return
    end
    vim.bo[args.buf].modified = false
  end,
})
