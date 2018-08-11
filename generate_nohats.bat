:: go through entire nohats.txt list
for /F "tokens=*" %%A in (dev\lists\nohats.txt) do (
	:: do the first if it's a file, second if it's a folder
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\
		copy dev\ref\null.vtx %%A
	) || (
		mkdir %%A
		dev\HLExtract.exe -p "../../tf2_misc_dir.vpk" -d %%A\..\ -e %%A -m -v -s
		for /f "delims=" %%f in ('dir /s /b %%A\*.vtx') do copy dev\ref\null.vtx "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.mdl') do del "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.vvd') do del "%%f"
		for /f "delims=" %%f in ('dir /s /b %%A\*.phy') do del "%%f"
	)
)
