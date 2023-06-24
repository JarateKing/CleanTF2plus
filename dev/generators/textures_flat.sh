#!/bin/sh 

for line in $(cat $1); do
	case "$line" in
		*.*)
			DIR=$(dirname "$line")
			mkdir -p $DIR > /dev/null 2>&1
			echo flat texturizing $line
			dev/linux/HLExtract -p $2 -d $line/../ -e $line -m -v -s > /dev/null 2>&1
			dev/batch/vtf-to-tga.sh $line > /dev/null 2>&1
			for file in $DIR/*.tga; do
				dev/batch/average-color.sh $file > /dev/null 2>&1
				if [ ! -z "$3" ]; then
					dev/batch/resize-image.sh $file $3 > /dev/null 2>&1
				fi
				dev/batch/tga-to-vtf.sh $file > /dev/null 2>&1
			done
		;;
		*)
			mkdir -p $line > /dev/null 2>&1
			echo flat texturizing $line
			dev/linux/HLExtract -p $2 -d $line/../ -e $line -m -v -s > /dev/null 2>&1
			for file in $line/*.vtf; do
				dev/batch/vtf-to-tga.sh $file > /dev/null 2>&1
			done
			for file in $line/*.tga; do
				dev/batch/average-color.sh $file > /dev/null 2>&1
				if [ ! -z "$3" ]; then
					dev/batch/resize-image.sh $file $3 > /dev/null 2>&1
				fi
				dev/batch/tga-to-vtf.sh $file > /dev/null 2>&1
			done
		;;
	esac
done
