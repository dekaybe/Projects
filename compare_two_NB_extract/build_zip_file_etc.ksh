#!/bin/ksh

MODS_FILE=`ls -l | grep MODS | awk '{print $9 }'`
NEW_FILE=`ls -l  | grep NEW  | awk '{print $9 }'`
#ZIP_DIR=`ls -lrt nationbuilder* | grep -v MODS | grep -v NEW | sort | awk '{print $9}' | sed "s/\([^.]*\).*/\1/" | tail -1`
ZIP_DIR=`ls -lrt nationbuilder* | grep -v MODS | grep -v NEW | awk '{print $9}' | sed "s/\([^.]*\).*/\1/" | tail -1`

mkdir $ZIP_DIR
mv $MODS_FILE $NEW_FILE $ZIP_DIR
zip -r $ZIP_DIR.zip $ZIP_DIR
rm -rf $ZIP_DIR
mv $ZIP_DIR.zip /SRGP/data/download
