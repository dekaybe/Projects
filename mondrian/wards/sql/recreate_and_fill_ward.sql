
\u srgp

DROP TABLE IF EXISTS dim_ward
;

CREATE TABLE dim_ward
(   dw_id     tinyint NOT NULL AUTO_INCREMENT
  , dw_dc_id  tinyint
  , dw_name   VARCHAR(100)
  , PRIMARY KEY (dw_id)
  , CONSTRAINT fk1_dw_dc_id FOREIGN KEY fk1_dw_dc_id (dw_dc_id) REFERENCES dim_constituency (dc_id)
--  , FOREIGN KEY (dw_dc_id) REFERENCES dim_constituency (dc_id)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds Ward Dimension"
;

INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Arbourthorne");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Beauchief and Greenhill");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Beighton");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Birley");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (2,"Broomhill");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Burngreave");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (2,"Central");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Crookes");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Darnall");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Dore and Totley");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"East Ecclesfield");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Ecclesall");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Firth Park");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Fulwood");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Gleadless Valley");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Graves Park");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Hillsborough");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (2,"Manor Castle");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Mosborough");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (2,"Nether Edge");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Richmond   ");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Shiregreen and Brightside");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Southey");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Stannington");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Stocksbridge and Upper Don");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (2,"Walkley");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"West Ecclesfield");
INSERT INTO dim_ward (dw_dc_id, dw_name) VALUES (1,"Woodhouse");

\q
