#!/bin/bash

dev/generators/scripts_copy.sh $1 scripts > /dev/null 2>&1
dev/linux/fart.sh scripts/$1 $2 $3 > /dev/null 2>&1
