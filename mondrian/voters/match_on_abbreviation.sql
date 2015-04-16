\u srgp

DROP FUNCTION IF EXISTS f_match_on_abbreviation_full_short;
DROP FUNCTION IF EXISTS f_match_on_abbreviation;

DELIMITER //

CREATE FUNCTION f_match_on_abbreviation( p_name1 VARCHAR(100), p_name2 VARCHAR(100) 
                                    ) RETURNS VARCHAR(3)
BEGIN

DECLARE  done                           TINYINT DEFAULT 0;   -- Used to break out of record loops
DECLARE  _count1                        INTEGER(7);
DECLARE  _count2                        INTEGER(7);
DECLARE  _count3                        INTEGER(7);
DECLARE  _short_forename                VARCHAR(100);
DECLARE  _full_forename                 VARCHAR(100);
--
DECLARE  full_short_cur CURSOR FOR
     SELECT da_short_name
     FROM   srgp_abbreviation
     WHERE  da_full_name=p_name1
     ;
DECLARE  short_full_cur CURSOR FOR
--
     SELECT da_full_name
     FROM   srgp_abbreviation
     WHERE  da_short_name=p_name1
     ;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN full_short_cur;
  read_loop: LOOP
    FETCH full_short_cur into _short_forename;
    --
    IF done THEN
      LEAVE read_loop;
    END IF;
    --
    IF _short_forename=p_name2 THEN
      return "YES";
      SET done=1;
    END IF; 
    --
    --
    END LOOP;
    --
CLOSE full_short_cur;
--
SET done=0;
--
OPEN short_full_cur;
  read_loop: LOOP
    FETCH short_full_cur into _full_forename;
    --
    IF done THEN
      LEAVE read_loop;
    END IF;
    --
    IF _full_forename=p_name2 THEN
      return "YES";
      SET done=1;
    END IF; 
    --
    --
    END LOOP;
    --
CLOSE short_full_cur;
--
  return "NO";
--
END//

DELIMITER ;

select f_match_on_abbreviation("David","Dave"); -- Me
select f_match_on_abbreviation("Dave","David"); -- Me

