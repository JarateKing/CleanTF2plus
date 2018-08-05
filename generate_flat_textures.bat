for /F "tokens=*" %%A in (dev\lists\flat.txt) do (
	mkdir %%A
	dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s
	
	for %%f in (%%A\*.vtf) do (
		dev\batch\vtf-to-png.bat %%f
	)
	for %%f in (%%A\*.png) do (
		dev\batch\average-color.bat %%f
		dev\batch\png-to-vtf.bat %%f
		del %%f
	)
)
pause
