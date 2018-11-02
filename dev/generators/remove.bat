@echo off
for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		del "%%A"
	) || (
		rmdir /s /q "%%A"
	)
)