@echo off
for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\ >nul 2>nul
		dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s >nul 2>nul
		call dev\batch\vtf-to-tga.bat %%A >nul 2>nul
		for %%f in (%%A\..\*.tga) do >nul 2>nul (
			call dev\batch\clear-image.bat %%f >nul 2>nul
			call dev\batch\tga-to-vtf.bat %%f >nul 2>nul
			del %%f >nul 2>nul
		)
	) || (
		mkdir %%A
		dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s
		for %%f in (%%A\*.vtf) do call dev\batch\vtf-to-tga.bat %%f >nul 2>nul
		for %%f in (%%A\*.tga) do >nul 2>nul (
			call dev\batch\clear-image.bat %%f >nul 2>nul
			call dev\batch\tga-to-vtf.bat %%f >nul 2>nul
			del %%f >nul 2>nul
		)
		for /d %%d in (%%A\*) do rmdir /s /q %%d
	)
)
