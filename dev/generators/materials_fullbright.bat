for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s
		call dev\batch\fullbright-ify.bat %%A
	) || (
		mkdir %%A
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s
		for %%f in (%%A\*.vmt) do call dev\batch\fullbright-ify.bat %%f
		for /d %%d in (%%A\*) do rmdir /s /q %%d
	)
)