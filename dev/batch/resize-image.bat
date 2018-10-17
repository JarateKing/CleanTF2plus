@echo off
SET SIZE=%2
dev\convert.exe %1 -resize %SIZE%x%SIZE% %1