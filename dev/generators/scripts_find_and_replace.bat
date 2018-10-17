@echo off
call dev\generators\scripts_copy.bat %1 scripts
dev\fart.exe scripts\%1 %2 %3