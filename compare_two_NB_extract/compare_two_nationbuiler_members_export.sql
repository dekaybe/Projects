\u srgp

delimiter //

DROP PROCEDURE IF EXISTS compare_two_nationbuiler_members_export;

CREATE PROCEDURE compare_two_nationbuiler_members_export ()
BEGIN
--
DECLARE done                              INTEGER DEFAULT 0; -- Used to break out of loops
-- DECLARE v_count                           INTEGER DEFAULT 0;
DECLARE v_column_name                     varchar(64);
DECLARE v_alias_name                      varchar(64);
DECLARE v_first_name                      varchar(50);
DECLARE v_last_name                       varchar(50);
DECLARE v_old_value                       varchar(2000);
DECLARE v_new_value                       varchar(2000);
DECLARE v_nbwe_nationbuilder_id           int(11);
DECLARE v_nbwe_civicrm_id                 varchar(50);
--
--
DECLARE cursor_nationbuilder_old CURSOR FOR
 (
  SELECT   nbwe_nationbuilder_id
         , nbwe_civicrm_id
  FROM     srgp_NB_weekly_export0
--  WHERE    nbwe_nationbuilder_id IN (43306)
  ORDER BY nbwe_nationbuilder_id
  )
;
--
DECLARE cursor_nationbuilder_cols CURSOR FOR
 (
  SELECT smcf_field
       , smcf_alias
  FROM   srgp_member_compare_field
  )
;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
SELECT "NB_ID,CIVICRM_ID,FIRST_NAME,LAST_NAME,FIELDNAME,OLD_VALUE,NEW_VALUE";
--
OPEN cursor_nationbuilder_old;
--
read_loop: LOOP
  --
  FETCH cursor_nationbuilder_old INTO v_nbwe_nationbuilder_id, v_nbwe_civicrm_id;
  --
  IF done THEN
    LEAVE read_loop;
  END IF;
  --
  OPEN cursor_nationbuilder_cols;
  --
  old_new_loop: LOOP
  --
    FETCH cursor_nationbuilder_cols INTO v_column_name, v_alias_name;
    --
    IF done THEN
      LEAVE old_new_loop;
    END IF;
    --
	SET @return_value="";
    CALL dynamic ("srgp_NB_weekly_export0",v_column_name,CONCAT("nbwe_nationbuilder_id=",v_nbwe_nationbuilder_id),@return_value);
	-- SELECT v_column_name;
    SELECT @return_value into v_old_value;
    --
	-- SELECT CONCAT("v_old_value=", v_old_value);
    --
	SET @return_value="";
    CALL dynamic ("srgp_NB_weekly_export1",v_column_name,CONCAT("nbwe_nationbuilder_id=",v_nbwe_nationbuilder_id),@return_value);
    SELECT @return_value into v_new_value;
    --
	-- SELECT CONCAT("v_new_value=", v_new_value);
    --
    --
	SET @return_value="";
    CALL dynamic ("srgp_NB_weekly_export1","nbwe_first_name",CONCAT("nbwe_nationbuilder_id=",v_nbwe_nationbuilder_id),@return_value);
    SELECT @return_value INTO v_first_name;
    --
	SET @return_value="";
    CALL dynamic ("srgp_NB_weekly_export1","nbwe_last_name",CONCAT("nbwe_nationbuilder_id=",v_nbwe_nationbuilder_id),@return_value);
    SELECT @return_value INTO v_last_name;
    --
    --
	IF BINARY v_old_value != BINARY v_new_value THEN
      SELECT v_nbwe_nationbuilder_id, ",", v_nbwe_civicrm_id, ",", v_first_name, ",", v_last_name, ",", v_alias_name, ",", v_old_value, ", ", v_new_value;
	END IF;
	--
  END LOOP;
	--
  CLOSE cursor_nationbuilder_cols;
  --
  SET done=0;
  -- SET v_count=v_count+1;
  -- SELECT v_count;
--
END LOOP;
--
--SELECT COUNT(1) FROM srgp_NB_export;
--
CLOSE cursor_nationbuilder_old;
--
END//
--
delimiter ;
--
CALL compare_two_nationbuiler_members_export();
--
