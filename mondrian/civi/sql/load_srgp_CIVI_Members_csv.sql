/*
12-Mar-2015
Table holds initial load of import data from NB 
*/

\u srgp

TRUNCATE TABLE srgp_CIVI_members_import
;

-- ALTER TABLE srgp_CIVI_members_import DROP COLUMN cmi_sp_id
-- ;

-- ALTER TABLE srgp_CIVI_members_import DROP COLUMN cmi_sps_id
-- ;

LOAD DATA INFILE '/tmp/SRGP_MembersAll_20150322-2128.csv'
INTO TABLE srgp_CIVI_members_import
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES
;

show warnings;

select count(1) from srgp_CIVI_members_import;

ALTER TABLE srgp_CIVI_members_import ADD cmi_sp_id int AFTER cmi_Postal_Code
;

ALTER TABLE srgp_CIVI_members_import ADD cmi_sps_id int AFTER cmi_sp_id
;

-- Remove all spaces from postcodes
UPDATE srgp_CIVI_members_import
SET    cmi_Postal_Code=REPLACE(cmi_Postal_Code,' ','')
;

-- Then tidy them by ading spaces where they ought to be
UPDATE srgp_CIVI_members_import
SET    cmi_Postal_Code=IF(cmi_Postal_Code REGEXP '[A-Z]..[0-9]'
                        , CONCAT(LEFT(cmi_Postal_Code,3)
                                ," "
                                ,RIGHT(cmi_Postal_Code,3)
                                 )
                        , CONCAT(LEFT(cmi_Postal_Code,2)
                                ," "
                                ,RIGHT(cmi_Postal_Code,3)
                                 )
                         )
WHERE  ISNULL(cmi_sp_id)
;

-- Update the postcode id
UPDATE srgp_CIVI_members_import
SET    cmi_sp_id= ( SELECT sp_id
                    FROM   srgp_S_postcode
                    WHERE  cmi_Postal_Code=sp_Postcode
                  )
;

-- Update the short postcode id
UPDATE srgp_CIVI_members_import
SET    cmi_sps_id= ( SELECT sp_Postcode_short_id
                     FROM   srgp_S_postcode
                     WHERE  cmi_Postal_Code=sp_Postcode
                  )
;

-- Create Start Date date id column
ALTER TABLE srgp_CIVI_members_import ADD cmi_Start_Date_date_id int AFTER cmi_Start_Date
;

-- Fill the Start Date date id column
UPDATE srgp_CIVI_members_import
SET    cmi_Start_Date_date_id=( SELECT date_id 
                                FROM   dim_date
                                WHERE  cmi_Start_Date=date
                               )
;

ALTER TABLE srgp_CIVI_members_import ADD cmi_Member_Since_date_id int AFTER cmi_Member_Since
;

UPDATE srgp_CIVI_members_import 
SET    cmi_Member_Since_date_id=( SELECT date_id 
                                  FROM   dim_date 
                                  WHERE  cmi_Member_Since=date
                                 )
;

select count(1) from srgp_CIVI_members_import;

\q
