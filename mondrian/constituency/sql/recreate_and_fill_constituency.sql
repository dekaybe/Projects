
\u srgp

DROP TABLE IF EXISTS dim_constituency
;

CREATE TABLE dim_constituency
(   dc_id   tinyint NOT NULL AUTO_INCREMENT
  , dc_name VARCHAR(100)
  , dc_notes  TEXT
  , PRIMARY KEY (dc_id)
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds Constituency Dimension"
;

INSERT INTO dim_constituency (dc_name, dc_notes) VALUES ("None Assigned","");
INSERT INTO dim_constituency (dc_name, dc_notes) VALUES ("Sheffield Central",
"http://en.wikipedia.org/wiki/Sheffield_Central_%28UK_Parliament_constituency%29#Constituency_profile");

\q
