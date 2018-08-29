for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\
		dev\HLExtract.exe -p %2 -d %%A\..\ -e %%A -m -v -s
		call dev\batch\vtf-to-tga.bat %%A
		for %%f in (%%A\..\*.tga) do (
			call dev\batch\average-color.bat %%f
			if NOT "%~3"=="" call dev\batch\resize-image.bat %%f %3
			call dev\batch\tga-to-vtf.bat %%f
			del %%f
		)
	) || (
		mkdir %%A
		dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s
		for %%f in (%%A\*.vtf) do call dev\batch\vtf-to-tga.bat %%f
		for %%f in (%%A\*.tga) do (
			call dev\batch\average-color.bat %%f
			if NOT "%~3"=="" call dev\batch\resize-image.bat %%f %3
			call dev\batch\tga-to-vtf.bat %%f
			del %%f
		)
		for /d %%d in (%%A\*) do rmdir /s /q %%d
	)
)