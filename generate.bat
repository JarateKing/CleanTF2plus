@ECHO OFF

:FLAT
set /P c=would you like flat materials? Y/N/Help     
if /I "%c%" EQU "Y" goto :FLAT_GEN
if /I "%c%" EQU "N" goto :OVERLAY
if /I "%c%" EQU "HELP" (echo flat materials make all world textures one solid color, also known as quake textures) else (echo invalid input)
goto :FLAT

:FLAT_GEN
set /P c=would you like flat textures resized? Y/N/Help     
if /I "%c%" EQU "Y" goto :FLAT_GEN_RESIZED
if /I "%c%" EQU "N" goto :FLAT_GEN_STANDARD
if /I "%c%" EQU "HELP" (echo resized flat textures causes grainyness on sv_pure, non-resized appears as stock tf2 textures) else (echo invalid input)
goto :FLAT_GEN

:FLAT_GEN_STANDARD
echo generating flat textures
call dev\generators\textures_flat.bat dev\lists\flat.txt "../../tf2_textures_dir.vpk"
call dev\generators\textures_flat.bat dev\lists\flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk"
goto :OVERLAY

:FLAT_GEN_RESIZED
echo generating flat textures
call dev\generators\textures_flat.bat dev\lists\flat.txt "../../tf2_textures_dir.vpk" 1
call dev\generators\textures_flat.bat dev\lists\flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk" 1
goto :OVERLAY

:OVERLAY
set /P c=would you like to remove overlay materials? Y/N/Help     
if /I "%c%" EQU "Y" goto :OVERLAY_GEN
if /I "%c%" EQU "N" goto :NOHATS
if /I "%c%" EQU "HELP" (echo this removes materials that get overlayed on the world) else (echo invalid input)
goto :OVERLAY

:OVERLAY_GEN
echo removing overlay materials
call dev\generators\textures_nodraw.bat dev\lists\nodraw.txt
call dev\generators\scripts_copy.bat extra_models.txt
goto :NOHATS

:NOHATS
set /P c=would you like to remove hats? Y/N/Help     
if /I "%c%" EQU "Y" goto :NOHATS_GEN
if /I "%c%" EQU "N" goto :MODELS
if /I "%c%" EQU "HELP" (echo this removes all hats and cosmetics from players) else (echo invalid input)
goto :NOHATS

:NOHATS_GEN
echo removing hats
call dev\generators\models_null.bat dev\lists\nohats.txt
goto :MODELS

:MODELS
set /P c=would you like to remove non-essential models? Y/N/Help     
if /I "%c%" EQU "Y" goto :MODELS_GEN
if /I "%c%" EQU "N" goto :SURFACEPROPERTIES
if /I "%c%" EQU "HELP" (echo this removes small, unnecessary or comsetic models on the map) else (echo invalid input)
goto :MODELS

:MODELS_GEN
echo removing non-essential models
call dev\generators\models_null.bat dev\lists\modelremoval.txt
goto :SURFACEPROPERTIES

:SURFACEPROPERTIES
set /P c=would you like to add surfaceproperties? Y/N/Help     
if /I "%c%" EQU "Y" goto :SURFACEPROPERTIES_GEN
if /I "%c%" EQU "N" goto :SOUNDSCAPES
if /I "%c%" EQU "HELP" (echo this removes bullet impacts and sets all footstep sounds to be the same) else (echo invalid input)
goto :SURFACEPROPERTIES

:SURFACEPROPERTIES_GEN
echo adding surfaceproperties
call dev\generators\scripts_copy.bat surfaceproperties_manifest.txt
call dev\generators\scripts_find_and_replace.bat surfaceproperties.txt "REPLACEME" " "
goto :SOUNDSCAPES

:SOUNDSCAPES
set /P c=would you like to remove soundscapes? Y/N/Help     
if /I "%c%" EQU "Y" goto :SOUNDSCAPES_GEN
if /I "%c%" EQU "N" goto :END
if /I "%c%" EQU "HELP" (echo this removes many world sounds from maps) else (echo invalid input)
goto :SOUNDSCAPES

:SOUNDSCAPES_GEN
echo removing soundscapes
call dev\generators\scripts_copy.bat soundscapes_manifest.txt
goto :END

:END
echo thank you for using Clean TF2+
pause