#!/bin/sh 

for line in $(cat $1); do
	case "$line" in
		*.*)
			DIR=$(dirname "$line")
			mkdir -p $DIR
			cp dev/ref/null.vtx $line
		;;
		*)
			mkdir -p $line
			$2 l $3 | grep "$line" | grep ".vtx" | grep -v ".sw.vtx" > vpk_list.txt

			for file in $(cat vpk_list.txt); do
				DIR=$(dirname "$file")
				mkdir -p $DIR
				cp dev/ref/null.vtx $file
			done

			rm vpk_list.txt
		;;
	esac
done
 
