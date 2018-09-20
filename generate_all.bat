:: generate_flat_textures
call dev\generators\textures_flat.bat dev\lists\flat.txt "../../tf2_textures_dir.vpk" 1
call dev\generators\textures_flat.bat dev\lists\flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk" 1

:: generate_nohats
call dev\generators\models_null.bat dev\lists\nohats.txt

:: generate_nodraw_textures
call dev\generators\textures_nodraw.bat dev\lists\nodraw.txt

:: generate_model_removal
call dev\generators\models_null.bat dev\lists\shell_removal.txt

:: generate_scripts
call dev\generators\scripts_copy.bat extra_models.txt scripts
call dev\generators\scripts_copy.bat soundscapes_manifest.txt scripts
call dev\generators\scripts_copy.bat surfaceproperties_manifest.txt scripts
call dev\generators\scripts_find_and_replace.bat surfaceproperties.txt "REPLACEME" " "