#!/bin/sh

convert $1 -resize 1x1 -resize 1024x1024 $1.tmp.tga
composite $1.tmp.tga $1 -compose Src $1
rm $1.tmp.tga
