for /F "tokens=*" %%A in (%1) do (
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\
		copy dev\ref\null.vtx %%A
	) || (
		"../../../bin/vpk.exe" l "../../tf2_misc_dir.vpk" | findstr "%%A" | findstr ".vtx" | findstr /V ".sw.vtx" > vpk_list.txt
	
		for /F "tokens=*" %%F in (vpk_list.txt) do (
			mkdir "%%F\..\"
			copy dev\ref\null.vtx "%%F"
		)
		
		del vpk_list.txt
	)
)