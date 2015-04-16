#!/bin/ksh
#ls -lrt nationbuilder* | grep -v MODS | grep -v NEW | sort | tail -2 | awk '{print $9}' | sed "s/.*\/\(.*\)/\1/"
ls -lrt data/upload/NationBuilder/nationbuilder* | sort | tail -2 | awk '{print $9}' | sed "s/.*\/\(.*\)/\1/"
