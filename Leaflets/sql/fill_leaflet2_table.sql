\u srgp
--
DROP PROCEDURE IF EXISTS Insert_srgp_leaflet2
; 
--
DELIMITER //
--
CREATE PROCEDURE Insert_srgp_leaflet2()
BEGIN
--
DECLARE  done                           INT DEFAULT 0;   -- Used to break out of record loops
DECLARE  vv_id                          INTEGER(7);
--
DECLARE cur_srgp_voters CURSOR FOR 
      SELECT    v_id
      FROM      srgp_voters
      WHERE     v_id >= 10001 AND v_id < 20000
      AND       v_id NOT IN (
                             SELECT    MIN(v_id)
                             FROM      srgp_voters
                             WHERE     v_id >= 10001 AND v_id < 20000
                             GROUP BY  v_Address_md5
                             )
;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
OPEN cur_srgp_voters;
--
read_loop: LOOP
  --
  FETCH cur_srgp_voters INTO vv_id;
  --
  IF done THEN
    LEAVE read_loop;
  END IF;
  -- 
  UPDATE   srgp_voters
  SET      v_leaflet_num=9
  WHERE    v_id=vv_id
  ;
  --
END LOOP;

CLOSE cur_srgp_voters; 
 
END //

delimiter ;

CALL Insert_srgp_leaflet2();

\q
