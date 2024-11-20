local jit = require "jit"

return {
  is_win = jit.os == "Windows",
  is_mac = jit.os == "OSX",
  is_linux = jit.os == "Linux",
}
