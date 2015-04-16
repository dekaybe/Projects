\u srgp


DROP TABLE IF EXISTS dim_gender
;

CREATE TABLE dim_gender ( g_id tinyint UNSIGNED AUTO_INCREMENT PRIMARY KEY
                        , g_gender varchar(4)
						)
;

INSERT INTO dim_gender (g_gender) VALUES ("F")
;

INSERT INTO dim_gender (g_gender) VALUES ("M")
;

INSERT INTO dim_gender (g_gender) VALUES ("-")
;

ALTER TABLE srgp_voters_root DROP COLUMN g_id 
;

ALTER TABLE srgp_voters_root ADD COLUMN g_id tinyint AFTER v_Title
;

UPDATE srgp_voters_root
SET    g_id=1
WHERE  v_Title="Miss"
;

UPDATE srgp_voters_root
SET    g_id=1
WHERE  v_Title="Ms"
;

UPDATE srgp_voters_root
SET    g_id=1
WHERE  v_Title="Mrs"
;

UPDATE srgp_voters_root
SET    g_id=1
WHERE  v_Title="Lady"
;

UPDATE srgp_voters_root
SET    g_id=2
WHERE  v_Title="Mr"
;

UPDATE srgp_voters_root
SET    g_id=2
WHERE  v_Title="Lord"
;

UPDATE srgp_voters_root
SET    g_id=3
WHERE  v_Title="Gender Neutral"
;

UPDATE srgp_voters_root
SET    g_id=3
WHERE  v_Title=""
;

select   v_Forename 
from     srgp_voters_root 
where    g_id is null 
-- AND      v_Title="Dr" 
group by v_Forename 
order by v_Forename
;



\q

