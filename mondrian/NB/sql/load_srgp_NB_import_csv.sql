/*
12-Mar-2015
Table holds initial load of import data from NB 
*/

\u srgp

TRUNCATE TABLE srgp_NB_import
;

LOAD DATA INFILE '/tmp/20150320_members.csv' 
INTO TABLE srgp_NB_import
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
;

show warnings;
show errors;

\q
