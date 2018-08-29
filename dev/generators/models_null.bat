for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\
		copy dev\ref\null.vtx %%A
	) || (
		mkdir %%A
		dev\HLExtract.exe -p "../../tf2_misc_dir.vpk" -d %%A\..\ -e %%A -m -v -s
		for /f "delims=" %%f in ('dir /s /b %%A\*.mdl') do del "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.vvd') do del "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.phy') do del "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.sw.vtx') do del "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.vtx') do copy dev\ref\null.vtx "%%f"
	)
)
