@echo off
for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\ >nul 2>nul
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s >nul 2>nul
		call dev\batch\fullbright-ify.bat %%A >nul 2>nul
	) || (
		mkdir %%A >nul 2>nul
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s >nul 2>nul
		for %%f in (%%A\*.vmt) do call dev\batch\fullbright-ify.bat %%f >nul 2>nul
		for /d %%d in (%%A\*) do rmdir /s /q %%d >nul 2>nul
	)
)