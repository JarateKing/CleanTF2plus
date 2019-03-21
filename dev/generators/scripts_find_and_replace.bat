@echo off
call dev\generators\scripts_copy.bat %1 scripts >nul 2>nul
dev\fart.exe scripts\%1 %2 %3 >nul 2>nul