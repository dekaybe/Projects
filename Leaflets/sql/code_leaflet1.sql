\u srgp
--
-- Reset all leaflet numbers
UPDATE srgp_voters
SET    v_leaflet_num=0
;
-- Mark all 'Other Electors' - These have no addresses and are therefore useless to us
UPDATE srgp_voters
SET    v_leaflet_num=1
WHERE  v_Address_Line_4='Other Electors'
;
--
DROP PROCEDURE IF EXISTS add_unique_postal_address
; 
--
DELIMITER //
--
CREATE PROCEDURE add_unique_postal_address()
BEGIN
--
DECLARE  done                           INT DEFAULT 0;   -- Used to break out of record loops
DECLARE  pv_id                          INTEGER(7);
--
-- Create a recordet of the first Postal voter at an address who are not 'Other Electors' 
DECLARE cur_min_id_at_address_postal CURSOR FOR 
 (
  SELECT    t1.a
  FROM    ( SELECT   MIN(v_id)          a
            FROM     srgp_voters 
            WHERE    v_leaflet_num=0
            AND      v_import_source='A'
            GROUP BY v_Address_md5
          ) t1 
  ORDER BY  t1.a
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
  -- Update these voters to a v_leaflet_num of 2
  UPDATE srgp_voters
  SET    v_leaflet_num=2
  WHERE  v_id=pv_id
  ;
  --
END LOOP;

CLOSE cur_min_id_at_address_postal; 
 
END //

delimiter ;

CALL add_unique_postal_address();
--
--
--
--
--
DROP PROCEDURE IF EXISTS Insert_srgp_leaflet1
; 
--
DELIMITER //
--
CREATE PROCEDURE Insert_srgp_leaflet1()
BEGIN
/* Updates addresses to a 3 if no-one at that address is already a 2
*/

DECLARE  done                           INT DEFAULT 0;   -- Used to break out of record loops
DECLARE  v_count_at_address             TINYINT;
DECLARE  v_address_hash                 CHAR(32);
DECLARE  vo_id                          INTEGER(7);
DECLARE  v_leaflet_level                TINYINT;
--
-- Create a recordset of the first voter, and max v_leaflet_num number an address 
-- If an address has already had a leaflet, then max v_leaflet_num number will be 2.
-- We only want those that haven't had one yet.
--
DECLARE cur_srgp_voters CURSOR FOR 
 (
  SELECT   MIN(v_id)           a
         , MAX(v_leaflet_num)  b
  FROM     srgp_voters 
  GROUP BY v_Address_md5
  ORDER BY a
  )
;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
OPEN cur_srgp_voters;
--
read_loop: LOOP
  --
  FETCH cur_srgp_voters INTO vo_id, v_leaflet_level;
  --
  IF done THEN
    LEAVE read_loop;
  END IF;
  -- 
  IF v_leaflet_level=0 THEN
    --
	-- If address hasn't had a leaflet then mark first address as getting one 
    UPDATE   srgp_voters 
    SET      v_leaflet_num=3
    WHERE    v_id=vo_id
	;
    --
  END IF;
--
END LOOP;
--
CLOSE cur_srgp_voters; 
-- 
END //
--
delimiter ;
--
CALL Insert_srgp_leaflet1();
--
\q
