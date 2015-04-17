
COMPARE_SQL="/SRGP/Projects/compare_two_NB_extract/compare_two_nationbuiler_members_export.sql"
SED_CLEAR_DOWN="/SRGP/Projects/compare_two_NB_extract/no_spaces_sed"
DOWNLOAD_DIR="/SRGP/data/download/NationBuilder"

PATH_AND_FILE_1="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-70-2015-03-08.csv"
PATH_AND_FILE_2="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-71-2015-03-15.csv"

FILE1=`echo $PATH_AND_FILE_1 | sed 's/.*\/\(.*\)\..*/\1/'`
FILE2=`echo $PATH_AND_FILE_2 | sed 's/.*\/\(.*\)\..*/\1/'`

TEMP_FILE=${DOWNLOAD_DIR}/${FILE1}"MODS_TEMP.csv"
MODS_FILE=${DOWNLOAD_DIR}/${FILE1}"MODS.csv"

/SRGP/Projects/compare_two_NB_extract/load_two_NB_files.ksh $PATH_AND_FILE_1 $PATH_AND_FILE_2

mysql --skip-column-names -uadmin -ppassword srgp < $COMPARE_SQL > $TEMP_FILE

cat $TEMP_FILE | sed -f $SED_CLEAR_DOWN > $MODS_FILE

[ -f $MODS_FILE ] &&
{
  ls -l $MODS_FILE
  }

