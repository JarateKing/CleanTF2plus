for /F "tokens=*" %%A in (dev\lists\flat.txt) do (
	mkdir %%A
	dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s
)
pause
