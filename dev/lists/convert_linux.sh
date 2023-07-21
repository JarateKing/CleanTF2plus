#!/bin/bash

mkdir linux
for filename in *.txt; do
	cp $filename linux/$filename
	sed -i 's/\\/\//g' linux/$filename
done 
