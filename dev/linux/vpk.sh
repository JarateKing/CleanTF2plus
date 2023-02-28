#!/bin/bash

BINPATH=$(dirname $0)/../../../../../bin
LD_LIBRARY_PATH=$BINPATH $BINPATH/vpk_linux32 $*
