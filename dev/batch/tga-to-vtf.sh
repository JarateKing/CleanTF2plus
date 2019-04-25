#!/bin/sh 

wine dev/VTFCmd.exe -file $1 -format DXT1 -alphaformat DXT3 -nomipmaps -version 7.2
