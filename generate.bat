@ECHO OFF

:FLAT
set /P c=would you like flat materials? Y/N
if /I "%c%" EQU "Y" goto :FLAT_GEN
if /I "%c%" EQU "N" goto :OVERLAY
echo invalid input
goto :FLAT

:FLAT_GEN
echo generating flat textures
call dev\generators\textures_flat.bat dev\lists\flat.txt "../../tf2_textures_dir.vpk" 1
call dev\generators\textures_flat.bat dev\lists\flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk" 1
goto :OVERLAY

:OVERLAY
set /P c=would you like to remove overlay materials? Y/N
if /I "%c%" EQU "Y" goto :OVERLAY_GEN
if /I "%c%" EQU "N" goto :NOHATS
echo invalid input
goto :OVERLAY

:OVERLAY_GEN
echo removing overlay materials
call dev\generators\textures_nodraw.bat dev\lists\nodraw.txt
call dev\generators\scripts_copy.bat extra_models.txt
goto :NOHATS

:NOHATS
set /P c=would you like to remove hats? Y/N
if /I "%c%" EQU "Y" goto :NOHATS_GEN
if /I "%c%" EQU "N" goto :MODELS
echo invalid input
goto :NOHATS

:NOHATS_GEN
echo removing hats
call dev\generators\models_null.bat dev\lists\nohats.txt
goto :MODELS

:MODELS
set /P c=would you like to remove non-essential models? Y/N
if /I "%c%" EQU "Y" goto :MODELS_GEN
if /I "%c%" EQU "N" goto :SCRIPTS
echo invalid input
goto :MODELS

:MODELS_GEN
echo removing non-essential models
call dev\generators\models_null.bat dev\lists\modelremoval.txt
goto :SCRIPTS

:SCRIPTS
set /P c=would you like to add some cleanliness scripts? Y/N
if /I "%c%" EQU "Y" goto :SCRIPTS_GEN
if /I "%c%" EQU "N" goto :END
echo invalid input
goto :SCRIPTS

:SCRIPTS_GEN
echo adding scripts
call dev\generators\scripts_copy.bat soundscapes_manifest.txt
call dev\generators\scripts_copy.bat surfaceproperties_manifest.txt
call dev\generators\scripts_find_and_replace.bat surfaceproperties.txt "REPLACEME" " "
goto :END

:END
echo thank you for using Clean TF2+
pause