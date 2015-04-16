/*
12-Mar-2015
Table holds final export of NationBuilder data
http://nationbuilder.com/how_to_import
*/

\u srgp

DROP TABLE IF EXISTS srgp_NB_import
;

CREATE TABLE srgp_NB_import
  (  
     nationbuilder_id            INTEGER(11) 
   , civicrm_id                  INTEGER(11) 
   , Rough_Age                   VARCHAR(200) 
   , email_opt_in                VARCHAR(200) 
   , email_opt_out               VARCHAR(200) 
   , membership_names            VARCHAR(200) 
   , federal_district            VARCHAR(200) 
   , county_district             VARCHAR(200) 
   , precinct_name               VARCHAR(200) 
   , primary_zip                 VARCHAR(20) 
   , primary_zip_clean1          VARCHAR(20) 
   , primary_zip_clean2          VARCHAR(20) 
   , CONSTRAINT c1_nb_id         UNIQUE ( nationbuilder_id )
   , CONSTRAINT c2_civicrm_id    UNIQUE ( civicrm_id )
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds import of NationBuilder data"
;

\q
