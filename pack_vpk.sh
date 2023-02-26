#!/bin/bash

# starting
echo preparing folder structure
mkdir cleantf2 > /dev/null 2>&1
mv cfg materials models scripts cleantf2/ > /dev/null 2>&1

# generating readme
cp dev/ref/vpk.txt cleantf2/readme.txt > /dev/null 2>&1
echo "\n\n" >> cleantf2/readme.txt
echo Current options: >> cleantf2/readme.txt
cat dev/current_options.txt >> cleantf2/readme.txt

# creating vpk
echo creating vpk
dev/linux/vpk.sh -M cleantf2 > /dev/null 2>&1

# moving vpk files
echo moving vpk files
mv cleantf2_*.vpk .. > /dev/null 2>&1

# regenerating folder structure
echo regenerating folder structure
rm cleantf2/readme.txt > /dev/null 2>&1
mv cleantf2/* . > /dev/null 2>&1
rm -rf cleantf2/ > /dev/null 2>&1

# done
echo done
