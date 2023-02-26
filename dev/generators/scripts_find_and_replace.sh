#!/bin/bash

dev/generators/scripts_copy.sh $1 scripts > /dev/null 2>&1
sed -i "s/$2/$3/" scripts/$1 > /dev/null 2>&1
