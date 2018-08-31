call dev\generators\scripts_copy.bat extra_models.txt
call dev\generators\scripts_copy.bat soundscapes_manifest.txt
call dev\generators\scripts_copy.bat surfaceproperties_manifest.txt
call dev\generators\scripts_find_and_replace.bat surfaceproperties.txt "REPLACEME" " "