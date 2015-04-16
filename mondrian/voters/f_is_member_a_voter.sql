\u srgp

DROP PROCEDURE IF EXISTS f_is_member_a_voter;
DROP FUNCTION IF EXISTS f_is_member_a_voter;

DELIMITER //

-- CREATE PROCEDURE  f_is_voter_a_member( p_v_id INTEGER(7) )
CREATE FUNCTION f_is_member_a_voter( p_cmi_Contact_ID INTEGER(7) 
                                    ) RETURNS VARCHAR(100) 
BEGIN
-- THIS ASSUMES AN ABBRIEVIATED NAME STARTS WITH THE SAME LETTER AS THE FULL NAME
-- THIS ASSUMES AN ABBRIEVIATED NAME STARTS WITH THE SAME LETTER AS THE FULL NAME

DECLARE  done                           TINYINT DEFAULT 0;   -- Used to break out of record loops
DECLARE  _count1                        INTEGER(7);
DECLARE  _count2                        INTEGER(7);
DECLARE  _count3                        INTEGER(7);
DECLARE  _forename_voter                VARCHAR(100);
DECLARE  _forename                      VARCHAR(100);
DECLARE  _forename_contains_space       INTEGER(1);
DECLARE  _lastname                      VARCHAR(100);
DECLARE  _postcode                      VARCHAR(10);
--
DECLARE  voter_cur CURSOR FOR 
     SELECT v_Forename
     FROM   srgp_voters_root
     WHERE  v_Surname=_lastname
     AND    v_Address_Postcode=_postcode
	 AND    v_valid=1
     ;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
-- Is there a match on first charactor of p_forename, p_surname and p_postcode
-- SELECT "-------------------------";
-- SELECT concat("Called with:", p_v_id); 
--
SELECT  REPLACE(cmi_First_Name,'Mrs ','')
      , REPLACE(cmi_First_Name,'Mrs ','') REGEXP ' '
	  , cmi_Last_Name
	  , cmi_Postal_Code
INTO    _forename
      , _forename_contains_space
	  , _lastname
	  , _postcode
FROM    srgp_CIVI_members_import
WHERE   cmi_Contact_ID=p_cmi_Contact_ID
;
--
IF _forename_contains_space=1 THEN
  SELECT COUNT(1)
  INTO   _count1
  FROM   srgp_voters_root
  WHERE  concat(v_Forename," ",v_Middle)=_forename
  AND    v_Surname=_lastname
  AND    v_Address_Postcode=_postcode
  AND    v_valid=1
  ;
ELSE
  SELECT COUNT(1)
  INTO   _count1
  FROM   srgp_voters_root
  WHERE  v_Forename=_forename
  AND    v_Surname=_lastname
  AND    v_Address_Postcode=_postcode
  AND    v_valid=1
  ;

END IF
;
--
IF     _count1=1 THEN
  -- Only one CIVI person at this postcode with same p_forename and p_surname
  -- This is enough, 122756 has _count1=2
  return "YES";
  -- return "57:YES";
ELSE 
  --
  SELECT COUNT(1)
  INTO   _count2
  FROM   srgp_voters_root
  WHERE  v_Surname=_lastname
  AND    v_Address_Postcode=_postcode
  AND    v_valid=1
  ;

    -- 
  IF _count2=0 THEN
      return "NO";
      -- return "71:NO";
  ELSE	  
      -- This is not enough
      -- return "Maybe";
	  -- Does the person who lives use an abbreviated name
      OPEN voter_cur;
	  read_loop: LOOP

      FETCH voter_cur INTO _forename_voter;

	  IF done THEN
	    LEAVE read_loop;
	  END IF;

      -- SELECT concat("Test this: ", _forename_civi, ", ", _forename);
	  --
	  IF f_match_on_abbreviation(_forename_voter, _forename)="YES" THEN
	    return "YES";
	    -- return concat("89:YES",_forename_voter, _forename);
	  END IF;
	  --
      END LOOP;

	  CLOSE voter_cur;

  END IF;
  --
END IF;
--
return "NO";
-- return concat("101:NO",_forename);
--
END//

DELIMITER ;

-- CALL f_is_voter_a_member(70005); -- Me
-- CALL f_is_voter_a_member(72406);
-- CALL f_is_voter_a_member(72407);

-- Passed CIVI ID
SELECT f_is_member_a_voter(109197); -- Me
SELECT f_is_member_a_voter(70005);
SELECT f_is_member_a_voter(12426);
SELECT f_is_member_a_voter(112105);
SELECT f_is_member_a_voter(122756); -- Farmer
SELECT f_is_member_a_voter(115478); -- Mrs Merinda J   Haake



