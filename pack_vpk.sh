#!/bin/bash

# starting
echo preparing folder structure
mkdir cleantf2
mv cfg materials models scripts cleantf2/

# generating readme
cp dev/ref/vpk.txt cleantf2/readme.txt
echo "\n\n" >> cleantf2/readme.txt
echo Current options: >> cleantf2/readme.txt
cat dev/current_options.txt >> cleantf2/readme.txt

# creating vpk
echo creating vpk
dev/linux/vpk.sh -M cleantf2

# moving vpk files
echo movinf vpk files
mv cleantf2_*.vpk ..

# regenerating folder structure
echo regenerating folder structure
rm cleantf2/readme.txt
mv cleantf2/* .
rm -rf cleantf2/

# donw
echo done
