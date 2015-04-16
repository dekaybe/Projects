\u srgp

TRUNCATE TABLE srgp_voters
;

INSERT INTO srgp_voters ( v_PD
                        , v_ENO
                        , v_Title
                        , v_Forename
                        , v_Middle
                        , v_Surname
                        , v_Address_Line_1
                        , v_Address_Line_2
                        , v_Address_Line_3
                        , v_Address_Line_4
                        , v_Address_Line_5
                        , v_Address_Line_6
                        , v_Address_Line_7
                        , v_Address_Postcode
                        , v_Address_Country
                        , v_import_source
)
(
SELECT                    pi_PD
                        , pi_ENO
                        , pi_Title
                        , pi_First_Names
                        , pi_Initials
                        , pi_Surname
                        , pi_Address_1
                        , pi_Address_2
                        , pi_Address_3
                        , pi_Address_4
                        , pi_Address_5
                        , pi_Address_6
                        , pi_Address_7
                        , pi_Postcode
                        , "UK"
                        , "p"
FROM                      srgp_pp50_import
)
;

UPDATE srgp_voters SET  v_Address_md5=MD5(CONCAT( v_Address_Line_1
                                                , v_Address_Line_2
                                                , v_Address_Line_3
                                                , v_Address_Line_4
                                                , v_Address_Line_5
                                                , v_Address_Line_6
                                                , v_Address_Line_7
                                                , v_Address_Postcode
                                                )
                                          )
;


DROP PROCEDURE IF EXISTS Update_Voters_For_Postal
; 

DELIMITER //

CREATE PROCEDURE Update_Voters_For_Postal()
BEGIN

DECLARE  done                           INT DEFAULT 0;   -- Used to break out of record loops
DECLARE  rc                             TINYINT;
DECLARE  v_Ai_PD                        CHAR(2);
DECLARE  v_Ai_ENO                       INTEGER(7);
--
DECLARE cur_ABSENT CURSOR FOR 
 (
  SELECT   Ai_PD, Ai_ENO
  FROM     srgp_ABSENT_import
  ORDER BY Ai_PD, Ai_ENO ASC 
  )
;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
open cur_ABSENT;
--
read_loop: LOOP
  --
  FETCH cur_ABSENT INTO v_Ai_PD, v_Ai_ENO;
  --
  UPDATE    srgp_voters
  SET       v_import_source='A'
  WHERE     v_PD=v_Ai_PD
  AND       v_ENO=v_Ai_ENO
  ;
  --
  IF done THEN
    LEAVE read_loop;
  END IF;
  --
END LOOP;

CLOSE cur_ABSENT; 
 
END //

delimiter ;

CALL Update_Voters_For_Postal();

\q
