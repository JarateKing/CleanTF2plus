@echo off
for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\ >nul 2>nul
		echo flat texturizing %%A
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s >nul 2>nul
		call dev\batch\vtf-to-tga.bat %%A >nul 2>nul
		for %%f in (%%A\..\*.tga) do >nul 2>nul (
			call dev\batch\average-color.bat %%f >nul 2>nul
			if NOT "%~3"=="" call dev\batch\resize-image.bat %%f %3 >nul 2>nul
			call dev\batch\tga-to-vtf.bat %%f >nul 2>nul
			del %%f >nul 2>nul
		)
	) || (
		mkdir %%A >nul 2>nul
		echo flat texturizing %%A
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s >nul 2>nul
		for %%f in (%%A\*.vtf) do call dev\batch\vtf-to-tga.bat %%f >nul 2>nul
		for %%f in (%%A\*.tga) do >nul 2>nul (
			call dev\batch\average-color.bat %%f >nul 2>nul
			if NOT "%~3"=="" call dev\batch\resize-image.bat %%f %3 >nul 2>nul
			call dev\batch\tga-to-vtf.bat %%f >nul 2>nul
			del %%f
		)
		for /d %%d in (%%A\*) do rmdir /s /q %%d >nul 2>nul
	)
)