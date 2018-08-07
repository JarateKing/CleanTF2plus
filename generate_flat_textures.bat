for /F "tokens=*" %%A in (dev\lists\flat.txt) do (
	mkdir %%A
	dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s
	
	for %%f in (%%A\*.vtf) do (
		dev\batch\vtf-to-tga.bat %%f
	)
	for %%f in (%%A\*.tga) do (
		dev\batch\average-color.bat %%f
		dev\batch\tga-to-vtf.bat %%f
		del %%f
	)
)
pause
