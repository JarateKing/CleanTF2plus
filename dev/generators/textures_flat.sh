#!/bin/sh 

for line in $(cat $1); do
	case "$line" in
		*.*)
			DIR=$(dirname "$line")
			mkdir -p $DIR
			dev/HLExtract.sh -p $2 -d $line/../ -e $line -m -v -s
			dev/batch/vtf-to-tga.sh $line
			for file in $DIR/*.tga; do
				dev/batch/average-color.sh $file
				if [ ! -z "$3" ]; then
					dev/batch/resize-image.sh $file $3
				fi
				dev/batch/tga-to-vtf.sh $file
			done
		;;
		*)
			mkdir -p $line
			dev/linux/HLExtract.sh -p $2 -d $line/../ -e $line -m -v -s
			for file in $line/*.vtf; do
				dev/batch/vtf-to-tga.sh $file
			done
			for file in $line/*.tga; do
				dev/batch/average-color.sh $file
				if [ ! -z "$3" ]; then
					dev/batch/resize-image.sh $file $3
				fi
				dev/batch/tga-to-vtf.sh $file
			done
		;;
	esac
done
