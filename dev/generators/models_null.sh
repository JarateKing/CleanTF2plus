#!/bin/sh 

for line in $(cat $1); do
	case "$line" in
		*.*)
			DIR=$(dirname "$line")
			mkdir -p $DIR > /dev/null 2>&1
			echo removing model $line
			cp dev/ref/null.vtx $line > /dev/null 2>&1
		;;
		*)
			mkdir -p $line > /dev/null 2>&1
			$2 l $3 | grep "$line" | grep ".vtx" | grep -v ".sw.vtx" > vpk_list.txt

			echo removing models in $line
			for file in $(cat vpk_list.txt); do
				DIR=$(dirname "$file")
				mkdir -p $DIR > /dev/null 2>&1
				cp dev/ref/null.vtx $file > /dev/null 2>&1
			done

			rm vpk_list.txt > /dev/null 2>&1
		;;
	esac
done
 
