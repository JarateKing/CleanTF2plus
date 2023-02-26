#!/bin/bash

for line in $(cat $1); do
        case "$line" in
                *.*)
			rm $line > /dev/null 2>&1
                ;;
                *)
			rm -rf $line > /dev/null 2>&1
                ;;
        esac
done
