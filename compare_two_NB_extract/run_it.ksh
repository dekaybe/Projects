
COMPARE_SQL="/SRGP/Projects/compare_two_NB_extract/compare_two_nationbuiler_members_MODS.sql"
SED_TRANSFORM_MODS="/SRGP/Projects/compare_two_NB_extract/transform_file_for_download"
DOWNLOAD_DIR="/SRGP/data/download/NationBuilder"

PATH_AND_FILE_1="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-70-2015-03-08.csv"
PATH_AND_FILE_2="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-71-2015-03-15.csv"

FILE1=`echo $PATH_AND_FILE_1 | sed 's/.*\/\(.*\)\..*/\1/'`
FILE2=`echo $PATH_AND_FILE_2 | sed 's/.*\/\(.*\)\..*/\1/'`

TEMP_FILE=${DOWNLOAD_DIR}/${FILE2}"MODS_TEMP.csv"
MODS_FILE=${DOWNLOAD_DIR}/${FILE2}"MODS.csv"

echo $FILE1
echo $FILE2

echo $TEMP_FILE
echo $MODS_FILE

echo $PATH_AND_FILE_1
echo $PATH_AND_FILE_2

/SRGP/Projects/compare_two_NB_extract/load_two_NB_files.ksh $PATH_AND_FILE_1 $PATH_AND_FILE_2

# This does the MODS File
mysql --skip-column-names -uadmin -ppassword srgp < $COMPARE_SQL > $TEMP_FILE

cat $TEMP_FILE | sed -f $SED_TRANSFORM_MODS > $MODS_FILE

[ -f $MODS_FILE ] &&
{
  ls -l $MODS_FILE
  rm -rf $TEMP_FILE
}



