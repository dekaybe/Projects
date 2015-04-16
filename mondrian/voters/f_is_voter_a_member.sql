\u srgp

DROP PROCEDURE IF EXISTS f_is_voter_a_member;
DROP FUNCTION IF EXISTS f_is_voter_a_member;

DELIMITER //

-- CREATE PROCEDURE  f_is_voter_a_member( p_v_id INTEGER(7) )
CREATE FUNCTION f_is_voter_a_member( p_v_id INTEGER(7) 
                                    ) RETURNS VARCHAR(100) 
BEGIN
-- THIS ASSUMES AN ABBRIEVIATED NAME STARTS WITH THE SAME LETTER AS THE FULL NAME
-- THIS ASSUMES AN ABBRIEVIATED NAME STARTS WITH THE SAME LETTER AS THE FULL NAME

DECLARE  done                           TINYINT DEFAULT 0;   -- Used to break out of record loops
DECLARE  _count1                        INTEGER(7);
DECLARE  _count2                        INTEGER(7);
DECLARE  _count3                        INTEGER(7);
DECLARE  _forename_initial              CHAR(1);
DECLARE  _forename_civi                 VARCHAR(100);
DECLARE  _forename                      VARCHAR(100);
DECLARE  _lastname                      VARCHAR(100);
DECLARE  _postcode                      VARCHAR(10);
--
DECLARE  civi_cur CURSOR FOR 
     SELECT cmi_First_Name
     FROM   srgp_CIVI_members_import
     WHERE  LEFT(cmi_First_Name,1)=_forename_initial
     AND    cmi_Last_Name=_lastname
     AND    cmi_Postal_Code=_postcode
     ;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
-- Is there a match on first charactor of p_forename, p_surname and p_postcode
-- SELECT "-------------------------";
-- SELECT concat("Called with:", p_v_id); 
--
SELECT  LEFT(v_Forename,1), v_Forename, v_Surname, v_Address_Postcode 
INTO    _forename_initial, _forename, _lastname, _postcode
FROM    srgp_voters_root
WHERE   v_id=p_v_id
;
--
SELECT COUNT(1)
INTO   _count1
FROM   srgp_CIVI_members_import
WHERE  cmi_First_Name=_forename
AND    cmi_Last_Name=_lastname
AND    cmi_Postal_Code=_postcode
;
--
IF     _count1=1 THEN
  -- Only one CIVI person at this postcode with same p_forename and p_surname
  -- This is enough
  return "YES";
ELSE 
  --
  SELECT COUNT(1)
  INTO   _count2
  FROM   srgp_voters_root
  WHERE  LEFT(v_Forename,1)=_forename_initial
  AND    v_Surname=_lastname
  AND    v_Address_Postcode=_postcode
  ;

    -- 
  IF _count2=0 THEN
      return "NO";
  ELSE	  
      -- This is not enough
      -- return "Maybe";
	  -- Does the person who lives use an abbreviated name
      OPEN civi_cur;
	  read_loop: LOOP

      FETCH civi_cur INTO _forename_civi;

	  IF done THEN
	    LEAVE read_loop;
	  END IF;

      -- SELECT concat("Test this: ", _forename_civi, ", ", _forename);
	  --
	  IF f_match_on_abbreviation(_forename_civi, _forename)="YES" THEN
	    return "YES";
      ELSE
	    return "NO";
	  END IF;
	  --
      END LOOP;

	  CLOSE civi_cur;

  END IF;
  --
END IF;
--
return "NO";
--
END//

DELIMITER ;

-- CALL f_is_voter_a_member(70005); -- Me
-- CALL f_is_voter_a_member(72406);
-- CALL f_is_voter_a_member(72407);


SELECT f_is_voter_a_member(70005); -- Me
SELECT f_is_voter_a_member(72406);
SELECT f_is_voter_a_member(72407);



