#!/bin/sh
sed -i "s/AstroNvim loaded/VSCode loaded/g" "$HOME/AppData/Local/nvim-data/lazy/AstroNvim/lua/astronvim/plugins/configs/alpha.lua"
sleep 3 && sed -i "s/VSCode/AstroNvim/g" "$HOME/AppData/Local/nvim-data/lazy/AstroNvim/lua/astronvim/plugins/configs/alpha.lua" &
