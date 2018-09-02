@ECHO OFF

:FLAT
set /P c=would you like flat materials? Y/N
if /I "%c%" EQU "Y" goto :FLAT_GEN
if /I "%c%" EQU "N" goto :END
echo "invalid input"
goto :FLAT

:FLAT_GEN
echo "generating flat textures"
goto :END

:END
echo "thank you for using Clean TF2+"
pause