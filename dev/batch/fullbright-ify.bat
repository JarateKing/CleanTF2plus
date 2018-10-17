@echo off
dev\fart.exe -i %1 "LightmappedGeneric" "UnlitGeneric"
:: blend textures
dev\fart.exe -i %1 "WorldVertexTransition" "UnlitTwoTexture"
dev\fart.exe -i %1 "$basetexture2" "$texture2"