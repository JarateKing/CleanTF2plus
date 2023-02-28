#!/bin/bash

PATH=$(dirname $0)
LD_LIBRARY_PATH="$PATH/lib" "$PATH/HLExtract" $*
