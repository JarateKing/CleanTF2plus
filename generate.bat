@ECHO OFF

:FLAT
set /P c=would you like flat materials? Y/N
if /I "%c%" EQU "Y" goto :FLAT_GEN
if /I "%c%" EQU "N" goto :OVERLAY
echo invalid input
goto :FLAT

:FLAT_GEN
echo generating flat textures
goto :OVERLAY

:OVERLAY
set /P c=would you like to remove overlay materials? Y/N
if /I "%c%" EQU "Y" goto :OVERLAY_GEN
if /I "%c%" EQU "N" goto :NOHATS
echo invalid input
goto :OVERLAY

:OVERLAY_GEN
echo removing overlay materials
goto :NOHATS

:NOHATS
set /P c=would you like to remove hats? Y/N
if /I "%c%" EQU "Y" goto :NOHATS_GEN
if /I "%c%" EQU "N" goto :MODELS
echo invalid input
goto :NOHATS

:NOHATS_GEN
echo removing overlay materials
goto :MODELS

:MODELS
set /P c=would you like to remove non-essential models? Y/N
if /I "%c%" EQU "Y" goto :MODELS_GEN
if /I "%c%" EQU "N" goto :SCRIPTS
echo invalid input
goto :MODELS

:MODELS_GEN
echo removing overlay materials
goto :SCRIPTS

:SCRIPTS
set /P c=would you like to add some cleanliness scripts? Y/N
if /I "%c%" EQU "Y" goto :SCRIPTS_GEN
if /I "%c%" EQU "N" goto :END
echo invalid input
goto :SCRIPTS

:SCRIPTS_GEN
echo removing overlay materials
goto :END

:END
echo thank you for using Clean TF2+
pause