#mysql --skip-column-names -uadmin -ppassword srgp < ./database/sql/compare_two_nationbuiler_members_export.sql > kk
#cat kk | sed -f no_spaces_sed > ss
#rm kk
# ss is the file with the MODS in it

COMPARE_SQL="/SRGP/Projects/compare_two_NB_extract/compare_two_nationbuiler_members_export.sql"
SED_CLEAR_DOWN="/SRGP/Projects/compare_two_NB_extract/no_spaces_sed"

NB_file_and_path_1="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-70-2015-03-08.csv"
NB_file_and_path_2="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-71-2015-03-15.csv"

TEMP_FILE="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-70-2015-03-08MODS_TEMP.csv"
MODS_FILE="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-70-2015-03-08MODS.csv"

/SRGP/Projects/compare_two_NB_extract/load_two_NB_files.ksh $NB_file_and_path_1 $NB_file_and_path_2

mysql --skip-column-names -uadmin -ppassword srgp < $COMPARE_SQL > $TEMP_FILE

cat $TEMP_FILE | sed -f $SED_CLEAR_DOWN > $MODS_FILE

ls -l $MODS_FILE

