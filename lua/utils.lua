local is_win = jit.os == "Windows"
local is_mac = jit.os == "OSX"
local is_linux = jit.os == "Linux"
return {
  is_win = is_win,
  is_mac = is_mac,
  is_linux = is_linux
}
