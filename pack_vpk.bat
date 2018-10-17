@echo off
echo preparing folder structure
mkdir cleantf2 > nul 2> nul
move cfg cleantf2\ > nul 2> nul
move materials cleantf2\ > nul 2> nul
move models cleantf2\ > nul 2> nul
move scripts cleantf2\ > nul 2> nul
copy dev\ref\vpk.txt cleantf2\readme.txt > nul 2> nul
echo creating vpk
..\..\..\bin\vpk.exe -M cleantf2 > nul 2> nul
echo regenerating folder structure
del cleantf2\readme.txt > nul 2> nul
move cleantf2\cfg .\ > nul 2> nul
move cleantf2\materials .\ > nul 2> nul
move cleantf2\models .\ > nul 2> nul
move cleantf2\scripts .\ > nul 2> nul
rmdir cleantf2 > nul 2> nul
echo done
pause