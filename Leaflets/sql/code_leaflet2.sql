\u srgp
--
--
DROP PROCEDURE IF EXISTS add_leaflet2
; 
--
DELIMITER //
--
CREATE PROCEDURE add_leaflet2()
BEGIN
--
DECLARE  done                           INT DEFAULT 0;   -- Used to break out of record loops
DECLARE  dummy                          TINYINT;
DECLARE  pv_id                          INTEGER(7);
--
DECLARE cur_min_id_at_address_postal CURSOR FOR 
 (
   SELECT   MIN(v_id)          a
   FROM     srgp_voters 
   WHERE    v_import_source!='A' -- No Postal Voters as they have already voted
   AND      v_leaflet_num=0      -- *People* (not 'Other Electors') not getting a leaflet yet
   GROUP BY v_Address_md5
   ORDER BY a
  )
;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
OPEN cur_min_id_at_address_postal;
--
read_loop: LOOP
  --
  FETCH cur_min_id_at_address_postal INTO pv_id;
  --
  IF done THEN
    LEAVE read_loop;
  END IF;
  --
  UPDATE srgp_voters
  SET    v_leaflet_num=4
  WHERE  v_id=pv_id
  ;
  --
END LOOP;
--
CLOSE cur_min_id_at_address_postal; 
--
END //
--
delimiter ;
--
CALL add_leaflet2();
--
