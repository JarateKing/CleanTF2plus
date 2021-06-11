#!/bin/sh 

wine dev/VTFCmd.exe -file $1 -format BGR888 -alphaformat ABGR8888 -flag MINMIP -version 7.4
