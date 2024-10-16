#!/bin/sh
sed -i "s/AstroNvim loaded/VSCode loaded/g" "$HOME/.local/share/nvim/lazy/AstroNvim/lua/astronvim/plugins/configs/alpha.lua"
sleep 1 && sed -i "s/VSCode/AstroNvim/g" "$HOME/.local/share/nvim/lazy/AstroNvim/lua/astronvim/plugins/configs/alpha.lua" &
