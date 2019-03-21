@echo off
for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\ >nul 2>nul
		echo removing model %%A
		copy dev\ref\null.vtx %%A >nul 2>nul
	) || (
		%2 l %3 | findstr "%%A" | findstr ".vtx" | findstr /V ".sw.vtx" > vpk_list.txt
	
		echo removing models in %%A
		for /F "tokens=*" %%F in (vpk_list.txt) do (
			mkdir "%%F\..\" >nul 2>nul
			copy dev\ref\null.vtx "%%F" >nul 2>nul
		)
		
		del vpk_list.txt >nul 2>nul
	)
)