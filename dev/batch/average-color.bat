@echo off
dev\convert.exe %1 -resize 1x1 -resize 1024x1024 %1.tmp.tga
dev\composite.exe %1.tmp.tga %1 -compose Src %1
del %1.tmp.tga