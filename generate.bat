@ECHO OFF

:: DATA

:: used variables
:: these are set through questions
set "flat=0"
set "nohats=0"
set "playergibs=0"
set "shells=0"
set "weapongibs=0"
set "surfaceproperties=0"
set "soundscapes=0"
set "mtp=0"

:: obsolete variables
:: to manually enable, set to 1
set "overlay=0"

:: QUESTIONS

:FLAT
set /P c=would you like flat materials? Y/N/Help     
if /I "%c%" EQU "Y" goto :FLAT_GEN
if /I "%c%" EQU "N" goto :NOHATS
if /I "%c%" EQU "HELP" (echo flat materials make all world textures one solid color, also known as quake textures) else (echo invalid input)
goto :FLAT

:FLAT_GEN
set /P c=would you like flat textures resized? Y/N/Help     
if /I "%c%" EQU "Y" goto :FLAT_GEN_RESIZED
if /I "%c%" EQU "N" goto :FLAT_GEN_STANDARD
if /I "%c%" EQU "HELP" (echo resized flat textures causes grainyness on sv_pure, non-resized appears as stock tf2 textures) else (echo invalid input)
goto :FLAT_GEN

:FLAT_GEN_STANDARD
set "flat=1"
goto :NOHATS

:FLAT_GEN_RESIZED
set "flat=2"
goto :NOHATS

:NOHATS
set /P c=would you like to remove hats? Y/N/Help     
if /I "%c%" EQU "Y" goto :NOHATS_GEN
if /I "%c%" EQU "N" goto :PLAYERGIBS
if /I "%c%" EQU "HELP" (echo this removes all hats and cosmetics from players) else (echo invalid input)
goto :NOHATS

:NOHATS_GEN
set /P c=would you like to keep heads and feet? Y/N/Help     
if /I "%c%" EQU "Y" goto :NOHATS_GEN_HEADSFEET
if /I "%c%" EQU "N" goto :NOHATS_GEN_FULL
if /I "%c%" EQU "HELP" (echo this keeps cosmetics that replace parts of the body so they aren't invisible) else (echo invalid input)
goto :NOHATS_GEN

:NOHATS_GEN_FULL
set "nohats=1"
goto :PLAYERGIBS

:NOHATS_GEN_HEADSFEET
set "nohats=2"
goto :PLAYERGIBS

:PLAYERGIBS
set /P c=would you like to remove player gibs? Y/N/Help     
if /I "%c%" EQU "Y" goto :PLAYERGIBS_GEN
if /I "%c%" EQU "N" goto :SHELLS
if /I "%c%" EQU "HELP" (echo this removes the flying body parts when people explode) else (echo invalid input)
goto :PLAYERGIBS

:PLAYERGIBS_GEN
set "playergibs=1"
goto :SHELLS

:SHELLS
set /P c=would you like to remove shells from guns? Y/N/Help     
if /I "%c%" EQU "Y" goto :SHELLS_GEN
if /I "%c%" EQU "N" goto :WEAPONGIBS
if /I "%c%" EQU "HELP" (echo this removes the shells that are ejected from some guns) else (echo invalid input)
goto :SHELLS

:SHELLS_GEN
set "shells=1"
goto :WEAPONGIBS

:WEAPONGIBS
set /P c=would you like to remove weapon gibs? Y/N/Help     
if /I "%c%" EQU "Y" goto :WEAPONGIBS_GEN
if /I "%c%" EQU "N" goto :SURFACEPROPERTIES
if /I "%c%" EQU "HELP" (echo this removes some gibs from certain projectiles) else (echo invalid input)
goto :WEAPONGIBS

:WEAPONGIBS_GEN
set "weapongibs=1"
goto :SURFACEPROPERTIES

:SURFACEPROPERTIES
set /P c=would you like to add surfaceproperties? Y/N/Help     
if /I "%c%" EQU "Y" goto :SURFACEPROPERTIES_GEN
if /I "%c%" EQU "N" goto :SOUNDSCAPES
if /I "%c%" EQU "HELP" (echo this removes bullet impacts and sets all footstep sounds to be the same) else (echo invalid input)
goto :SURFACEPROPERTIES

:SURFACEPROPERTIES_GEN
set /P c=would you want there to be footstep sounds or no sounds? Y/N/Help     
if /I "%c%" EQU "Y" goto :SURFACEPROPERTIES_GEN_METAL
if /I "%c%" EQU "N" goto :SURFACEPROPERTIES_GEN_NOSTEPS
if /I "%c%" EQU "HELP" (echo choosing yes will let there be metal footstep sounds on all materials, otherwise there will be no footstep sounds) else (echo invalid input)
goto :SURFACEPROPERTIES_GEN

:SURFACEPROPERTIES_GEN_METAL
set "surfaceproperties=1"
goto :SOUNDSCAPES

:SURFACEPROPERTIES_GEN_NOSTEPS
set "surfaceproperties=2"
goto :SOUNDSCAPES

:SOUNDSCAPES
set /P c=would you like to remove soundscapes? Y/N/Help     
if /I "%c%" EQU "Y" goto :SOUNDSCAPES_GEN
if /I "%c%" EQU "N" goto :MTP
if /I "%c%" EQU "HELP" (echo this removes many world sounds from maps) else (echo invalid input)
goto :SOUNDSCAPES

:SOUNDSCAPES_GEN
set "soundscapes=1"
goto :MTP

:MTP
set /P c=would you like to add mtp.cfg? Y/N/Help     
if /I "%c%" EQU "Y" goto :MTP_GEN
if /I "%c%" EQU "N" goto :END
if /I "%c%" EQU "HELP" (echo this sets which maps are affected by pyrovision) else (echo invalid input)
goto :MTP

:MTP_GEN
set "mtp=1"
goto :END

:: GENERATION

:END
del dev\current_options.txt > nul 2> nul
if %flat% EQU 1 (
	echo generating flat textures
	call dev\generators\textures_flat.bat dev\lists\flat.txt "../../tf2_textures_dir.vpk" >nul 2> nul
	call dev\generators\textures_flat.bat dev\lists\flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk" >nul 2> nul
	echo "flat textures (unresized)" >> dev\current_options.txt
	echo done
)
if %flat% EQU 2 (
	echo generating flat textures
	call dev\generators\textures_flat.bat dev\lists\flat.txt "../../tf2_textures_dir.vpk" 1 >nul 2> nul
	call dev\generators\textures_flat.bat dev\lists\flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk" 1 >nul 2> nul
	echo "flat textures (resized)" >> dev\current_options.txt
	echo done
)
if %overlay% EQU 1 (
	echo removing overlay materials
	call dev\generators\textures_nodraw.bat dev\lists\nodraw.txt >nul 2> nul
	call dev\generators\scripts_copy.bat extra_models.txt scripts >nul 2> nul
	echo "no overlays" >> dev\current_options.txt
	echo done
)
if %nohats% EQU 1 (
	echo removing hats
	call dev\generators\models_null.bat dev\lists\nohats.txt >nul 2> nul
	echo "nohats" >> dev\current_options.txt
	echo done
)
if %nohats% EQU 2 (
	echo removing hats headsfeet
	call dev\generators\models_null.bat dev\lists\nohats.txt >nul 2> nul
	call dev\generators\remove.bat dev\lists\nohats_headsfeet.txt >nul 2> nul
	echo "nohats headsfeet" >> dev\current_options.txt
	echo done
)
if %playergibs% EQU 1 (
	echo removing player gibs
	call dev\generators\models_null.bat dev\lists\model_removal_gibs_player.txt >nul 2> nul
	echo "no player gibs" >> dev\current_options.txt
	echo done
)
if %shells% EQU 1 (
	echo removing shell models
	call dev\generators\models_null.bat dev\lists\model_removal_shells.txt >nul 2> nul
	echo "no shells" >> dev\current_options.txt
	echo done
)
if %weapongibs% EQU 1 (
	echo removing weapon gibs
	call dev\generators\models_null.bat dev\lists\model_removal_gibs_weapons.txt >nul 2> nul
	echo "no weapon gibs" >> dev\current_options.txt
	echo done
)
if %surfaceproperties% EQU 1 (
	echo adding surfaceproperties
	call dev\generators\scripts_copy.bat surfaceproperties_manifest.txt scripts >nul 2> nul
	call dev\generators\scripts_find_and_replace.bat surfaceproperties.txt "REPLACEME" "SolidMetal.StepLeft" >nul 2> nul
	echo "empty surface properties (metal footsteps)" >> dev\current_options.txt
	echo done
)
if %surfaceproperties% EQU 2 (
	echo adding surfaceproperties
	call dev\generators\scripts_copy.bat surfaceproperties_manifest.txt scripts >nul 2> nul
	call dev\generators\scripts_find_and_replace.bat surfaceproperties.txt "REPLACEME" " " >nul 2> nul
	echo "empty surface properties (no footsteps)" >> dev\current_options.txt
	echo done
)
if %soundscapes% EQU 1 (
	echo removing soundscapes
	call dev\generators\scripts_copy.bat soundscapes_manifest.txt scripts >nul 2> nul
	echo "no soundscapes" >> dev\current_options.txt
	echo done
)
if %mtp% EQU 1 (
	echo removing soundscapes
	call dev\generators\scripts_copy.bat mtp.cfg cfg >nul 2> nul
	echo "no pyrovision textures" >> dev\current_options.txt
	echo done
)
echo thank you for using Clean TF2+
pause