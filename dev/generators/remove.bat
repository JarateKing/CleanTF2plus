@echo off
for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		del "%%A" >nul 2>nul
	) || (
		rmdir /s /q "%%A" >nul 2>nul
	)
)