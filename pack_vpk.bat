@echo off
:: starting
echo preparing folder structure
mkdir cleantf2 > nul 2> nul
move cfg cleantf2\ > nul 2> nul
move materials cleantf2\ > nul 2> nul
move models cleantf2\ > nul 2> nul
move scripts cleantf2\ > nul 2> nul

:: generating readme
copy dev\ref\vpk.txt cleantf2\readme.txt > nul 2> nul
echo.>> cleantf2\readme.txt
echo.>> cleantf2\readme.txt
echo Current Options:>> cleantf2\readme.txt
type dev\current_options.txt >> cleantf2\readme.txt

:: creating vpk
echo creating vpk
..\..\..\bin\vpk.exe -M cleantf2 > nul 2> nul

:: moving vpk files
echo moving vpk files
move cleantf2_*.vpk ..

:: regenerating folder structure
echo regenerating folder structure
del cleantf2\readme.txt > nul 2> nul
move cleantf2\cfg .\ > nul 2> nul
move cleantf2\materials .\ > nul 2> nul
move cleantf2\models .\ > nul 2> nul
move cleantf2\scripts .\ > nul 2> nul
rmdir cleantf2 > nul 2> nul

:: done
echo done
pause