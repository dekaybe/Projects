/*
23-Mar-2015
Table holds postcode short dimension
*/

\u srgp

DROP TABLE IF EXISTS srgp_S_postcode_short
;

CREATE TABLE srgp_S_postcode_short
  (  
    sps_id                             INTEGER(3) NOT NULL AUTO_INCREMENT
  , sps_Postcode_short                 VARCHAR(5)
  , PRIMARY KEY (sps_id)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds Postcode Short Dimension"
;

\q
