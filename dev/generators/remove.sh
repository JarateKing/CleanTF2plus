#!/bin/bash

for line in $(cat $1); do
        case "$line" in
                *.*)
			rm $line
                ;;
                *)
			rm -rf $line
                ;;
        esac
done
