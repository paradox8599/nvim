local is_win = vim.loop.os_uname().sysname == "Windows_NT"
return {
  is_win = is_win,
}
