#!/bin/ksh

#set -x
# load data from any civi file
# takes filename as argument
TMP_NB_FILE=/tmp/NB.csv

# this script is to be run after a weekely load has been done
# it will need to chose different files if live
# eval `ls -lrt /SRGP/data/upload/NationBuilder/nationbuilder-people-export* | tail -3 | head -2 | awk '{print "NB_file_and_path_"FNR"="$9}'`
#
# echo $NB_file_and_path_1;
# echo $NB_file_and_path_2;
#
# NB_file_and_path_1="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-70-2015-03-08.csv"
# NB_file_and_path_2="/SRGP/data/upload/NationBuilder/nationbuilder-people-export-71-2015-03-15.csv"
#
NB_file_and_path_1=$1
NB_file_and_path_2=$2
#
echo $NB_file_and_path_1;
echo $NB_file_and_path_2;
#
COUNT_1=`head -1 $NB_file_and_path_1 | sed 's/,/\n/g' | wc -l`
COUNT_2=`head -1 $NB_file_and_path_2 | sed 's/,/\n/g' | wc -l`

[[ $COUNT_1 -ne $COUNT_2 ]] && 
{
  echo "Different number of fields in two files"
  exit 1
} || {
  echo "Two files have the same number of fields"
}

NB_file_only_1=`echo $NB_file_and_path_1 | sed 's/.*\/\(.*\)/\1/'` 
NB_file_only_2=`echo $NB_file_and_path_2 | sed 's/.*\/\(.*\)/\1/'` 

cp -p $NB_file_and_path_1 /tmp
mv /tmp/$NB_file_only_1 $TMP_NB_FILE
chmod 777  $TMP_NB_FILE
COUNT_BEFORE=`cat $TMP_NB_FILE | wc -l`
TEST_COUNT=`expr $COUNT_BEFORE - 1`
mysql -uadmin -ppassword < /SRGP/database/sql/load_srgp_nb0.sql

COUNT_AFTER=`mysql --disable-column-names -uadmin -ppassword < /SRGP/database/sql/load_count_after_nb0.sql`

[[ $COUNT_AFTER -eq $TEST_COUNT ]] &&
{
  /bin/echo -n "Count of file 1, before and after was OK:"
  echo $COUNT_AFTER
} || {
  echo "DIFFERENT NUMBER OF ROWS AFTER LOAD!!!"
}
rm -rf     $TMP_NB_FILE

cp -p $NB_file_and_path_2 /tmp
mv /tmp/$NB_file_only_2 $TMP_NB_FILE
chmod 777  $TMP_NB_FILE
COUNT_BEFORE=`cat $TMP_NB_FILE | wc -l`
TEST_COUNT=`expr $COUNT_BEFORE - 1`
mysql -uadmin -ppassword < /SRGP/database/sql/load_srgp_nb1.sql

COUNT_AFTER=`mysql --disable-column-names -uadmin -ppassword < /SRGP/database/sql/load_count_after_nb1.sql`

[[ $COUNT_AFTER -eq $TEST_COUNT ]] &&
{
  /bin/echo -n "Count of file 2, before and after was OK:"
  echo $COUNT_AFTER
} || {
  echo "DIFFERENT NUMBER OF ROWS AFTER LOAD!!!"
}
rm -rf     $TMP_NB_FILE

