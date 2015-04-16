/*
23-Mar-2015
Table holds pp50 import data
*/

\u srgp

DROP TABLE IF EXISTS srgp_ABSENT_import
;

-- Key is created with awk as below:
-- awk '{ print FNR "," $0 }'
CREATE TABLE srgp_ABSENT_import
  ( Ai_id                        INTEGER(7) NOT NULL 
  , Ai_AV_Type                   VARCHAR(12)
  , Ai_PD                        VARCHAR(2)
  , Ai_ENO                       VARCHAR(5)
  , Ai_Elector_Surname           VARCHAR(100)
  , Ai_Elector_Forename          VARCHAR(100)
  , Ai_Elector_Initials          VARCHAR(100)
  , Ai_Elector_Suffix            VARCHAR(100)
  , Ai_Elector_Title             VARCHAR(100)
  , Ai_Corres_Address_Line_1     VARCHAR(100)
  , Ai_Corres_Address_Line_2     VARCHAR(100)
  , Ai_Corres_Address_Line_3     VARCHAR(100)
  , Ai_Corres_Address_Line_4     VARCHAR(100)
  , Ai_Corres_Address_Line_5     VARCHAR(100)
  , Ai_Corres_Address_Postcode   VARCHAR(100)
  , Ai_Corres_Address_Country    VARCHAR(100)
  , Ai_Proxy_Name                VARCHAR(100)
  , Ai_Send_Address_Line_1       VARCHAR(100)
  , Ai_Send_Address_Line_2       VARCHAR(100)
  , Ai_Send_Address_Line_3       VARCHAR(100)
  , Ai_Send_Address_Line_4       VARCHAR(100)
  , Ai_Send_Address_Line_5       VARCHAR(100)
  , Ai_Send_Address_Postcode     VARCHAR(100)
  , PRIMARY KEY (Ai_id)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds ABSENT imports"
;

\q
