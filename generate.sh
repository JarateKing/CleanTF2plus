#!/bin/sh

echo THIS IS A WIP
echo THIS CURRENTLY ONLY DOES:
echo - FLAT TEXTURES
echo - NOHATS

dev/generators/textures_flat.sh dev/lists/linux/flat.txt "../../tf2_textures_dir.vpk" 2

dev/generators/models_null.sh dev/lists/linux/nohats.txt "dev/linux/vpk.sh" "../../tf2_misc_dir.vpk"
