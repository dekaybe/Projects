/*
12-Mar-2015
Table holds initial load of import data from NB 
cat /tmp/S_postcodes.csv | awk '{ print FNR "," $0 }' > /tmp/S_postcodes_FNR.csv
*/

\u srgp

TRUNCATE TABLE srgp_ABSENT_import
;

LOAD DATA INFILE '/tmp/ABSENT_FNR.csv'
INTO TABLE srgp_ABSENT_import
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES
;

show warnings;

\q
