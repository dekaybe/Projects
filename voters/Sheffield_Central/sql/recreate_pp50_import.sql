/*
23-Mar-2015
Table holds pp50 import data
*/

\u srgp

DROP TABLE IF EXISTS srgp_pp50_import
;

-- Key is created with awk as below:
-- awk '{ print FNR "," $0 }'
CREATE TABLE srgp_pp50_import
  ( pi_id                        INTEGER(7) NOT NULL 
  , pi_PD                        VARCHAR(10)
  , pi_ENO                       VARCHAR(10)
  , pi_Status                    VARCHAR(10)
  , pi_Title                     VARCHAR(20)
  , pi_First_Names               VARCHAR(100)
  , pi_Initials                  VARCHAR(100) -- Middle Name
  , pi_Surname                   VARCHAR(100)
  , pi_Suffix                    VARCHAR(10)
  , pi_Date_of_Attainment        VARCHAR(10)
  , pi_Franchise_Flag            VARCHAR(10)
  , pi_Address_1                 VARCHAR(100)
  , pi_Address_2                 VARCHAR(100)
  , pi_Address_3                 VARCHAR(100)
  , pi_Address_4                 VARCHAR(100)
  , pi_Address_5                 VARCHAR(100)
  , pi_Address_6                 VARCHAR(100)
  , pi_Address_7                 VARCHAR(100)
  , pi_Address_8                 VARCHAR(100)
  , pi_Address_9                 VARCHAR(100)
  , pi_Postcode                  VARCHAR(10)
  , PRIMARY KEY (pi_id)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds pp50 imports"
;

\q
