#!/bin/sh
sed -i "s/AstroNvim loaded/VSCode loaded/g" "$HOME/AppData/Local/nvim-data/lazy/AstroNvim/lua/astronvim/plugins/configs/alpha.lua"
sleep 2 && sed -i "s/VSCode/AstroNvim/g" "$HOME/AppData/Local/nvim-data/lazy/AstroNvim/lua/astronvim/plugins/configs/alpha.lua" &
