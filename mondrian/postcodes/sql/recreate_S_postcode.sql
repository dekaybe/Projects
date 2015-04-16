/*
23-Mar-2015
Table holds postcode dimension
*/

\u srgp

DROP TABLE IF EXISTS srgp_S_postcode
;

CREATE TABLE srgp_S_postcode
  (  
    sp_id                              INTEGER(7) NOT NULL AUTO_INCREMENT
  , sp_Postcode                        VARCHAR(10)
  , sp_Latitude                        NUMERIC(8,6)
  , sp_Longitude                       NUMERIC(8,6)
  , sp_Easting                         int
  , sp_Northing                        int
  , sp_GridRef                         char(8)
  , sp_County                          char(10)
  , sp_District                        char(10)
  , sp_Ward                            char(20)
  , sp_DistrictCode                    char(10)
  , sp_WardCode                        char(10)
  , sp_Country                         char(7)
  , sp_CountyCode                      char(9)
  , sp_Constituency                    char(17)
  , sp_Introduced                      date
  , sp_Terminated                      date 
  , sp_Parish                          VARCHAR(10)
  , sp_NationalPark                    char(1)
  , sp_Population                      int
  , sp_Households                      int
  , sp_Built_up_area                   VARCHAR(100)
  , sp_Built_up_sub_division           VARCHAR(100)
  , sp_Lower_layer_super_output_area   VARCHAR(20)
  , sp_Rural_urban                     VARCHAR(100)
  , sp_Region                          VARCHAR(100)
  , PRIMARY KEY (sp_id)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds Postcode Dimension"
;

\q
