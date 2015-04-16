/*
12-Mar-2015
Table holds initial load of import data from NB 
cat /tmp/S_postcodes.csv | awk '{ print FNR "," $0 }' > /tmp/S_postcodes_FNR.csv
*/

\u srgp

TRUNCATE TABLE srgp_S_postcodes
;

LOAD DATA INFILE '/tmp/S_postcodes_FNR.csv'
INTO TABLE srgp_S_postcodes
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
;

show warnings;

ALTER TABLE srgp_S_postcode 
ADD         sp_Postcode_short CHAR(5) AFTER sp_Postcode
;

ALTER TABLE srgp_S_postcode 
ADD         sp_Postcode_short_id INT AFTER sp_Postcode_short;

UPDATE srgp_S_postcode
SET    sp_Postcode_short=IF(RIGHT(LEFT(sp_Postcode, 3),1)=" ", LEFT(sp_Postcode,4), LEFT(sp_Postcode, 5))
;

INSERT INTO srgp_S_postcode_short ( SELECT NULL
                                         , MIN(sp_Postcode_short) 
                                    FROM   srgp_S_postcode 
                                    GROUP BY sp_Postcode_short
                                   )
;

UPDATE srgp_S_postcode 
SET    sp_Postcode_short_id= ( SELECT sps_id 
                               FROM   srgp_S_postcode_short 
                               WHERE  sps_Postcode_short=sp_Postcode_short
                              )
;

/*
UPDATE srgp_CIVI_members_import
SET    cmi_Postal_Code=IF(cmi_Postal_Code REGEXP '[A-Z]..[0-9]'
                     , CONCAT(LEFT(cmi_Postal_Code,3)
                     ,"_"
                     ,RIGHT(cmi_Postal_Code,3))
                     , LEFT(cmi_Postal_Code,2))
WHERE  ISNULL(cmi_sp_id)
;

SELECT IF(cmi_Postal_Code REGEXP '[A-Z]..[A-Z]', CONCAT(LEFT(cmi_Postal_Code,3),"
",RIGHT(cmi_Postal_Code,2)), cmi_Postal_Code) FROM srgp_CIVI_members_import WHERE ISNULL(cmi_sp_id);

SELECT IF(cmi_Postal_Code REGEXP '[A-Z]..[0-9]',
CONCAT(LEFT(cmi_Postal_Code,3),"_",RIGHT((cmi_Postal_Code,3)), LEFT(cmi_Postal_Code,2)),
cmi_Postal_Code FROM srgp_CIVI_members_import WHERE ISNULL(cmi_sp_id);

UPDATE srgp_CIVI_members_import 
SET    cmi_sp_id= ( SELECT sp_id 
                    FROM   srgp_S_postcode 
                    WHERE  cmi_Postal_Code=sp_Postcode
                  )
;

*/

\q
