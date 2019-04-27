#!/bin/sh

sed -i 's/LightmappedGeneric/UnlitGeneric/gI' $1
sed -i 's/WorldVertexTransition/UnlitTwoTexture/gI' $1
sed -i 's/$basetexture2/$texture2/gI' $1
sed -i 's/$envmap/$REMOVEDenvmap/gI' $1
