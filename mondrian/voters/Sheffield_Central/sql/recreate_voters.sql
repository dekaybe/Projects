/*
23-Mar-2015
Table holds pp50 import data
*/

\u srgp

DROP TABLE IF EXISTS srgp_voters
;

-- Key is created with awk as below:
-- awk '{ print FNR "," $0 }'

--, CONSTRAINT c2 UNIQUE (v_PD, v_ENO)

CREATE TABLE srgp_voters
  ( v_id                    INTEGER(7) NOT NULL AUTO_INCREMENT
  , v_PD                    CHAR(2)
  , v_ENO                   INTEGER(7)
  , v_Title                 VARCHAR(100)
  , v_Forename              VARCHAR(100)
  , v_Middle                VARCHAR(100)
  , v_Surname               VARCHAR(100)
  , v_Address_Line_1        VARCHAR(100)
  , v_Address_Line_2        VARCHAR(100)
  , v_Address_Line_3        VARCHAR(100)
  , v_Address_Line_4        VARCHAR(100)
  , v_Address_Line_5        VARCHAR(100)
  , v_Address_Line_6        VARCHAR(100)
  , v_Address_Line_7        VARCHAR(100)
  , v_Address_Postcode      VARCHAR(100)
  , v_Address_Country       VARCHAR(100)
  , v_Address_md5           CHAR(32)
  , v_import_source         CHAR(1)
  , v_leaflet_num           CHAR(1)
  , PRIMARY KEY (v_id)
  , CONSTRAINT c2 UNIQUE (v_PD, v_ENO)
  , INDEX idx3 (v_Address_md5)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds voters"
;

\q
