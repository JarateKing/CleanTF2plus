#!/bin/bash

dev/generators/scripts_copy.sh $1 scripts
dev/linux/fart.sh scripts/$1 $2 $3
