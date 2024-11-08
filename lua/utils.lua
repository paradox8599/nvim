-- jit.os == "Windows" | "OSX"
local is_win = vim.loop.os_uname().sysname == "Windows_NT"
local is_mac = vim.loop.os_uname().sysname == "Darwin"
local is_linux = vim.loop.os_uname().sysname == "Linux"
return {
  is_win = is_win,
  is_mac = is_mac,
  is_linux = is_linux,
}
