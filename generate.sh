#!/bin/sh

dev/generators/textures_flat.sh dev/lists/linux/flat.txt "../../tf2_textures_dir.vpk" 2

dev/generators/models_null.sh dev/lists/linux/nohats.txt "../../../bin/vpk.sh" "../../tf2_misc_dir.vpk"
