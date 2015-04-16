\u srgp

DROP PROCEDURE IF EXISTS p_is_member_a_voter;

DELIMITER //

CREATE PROCEDURE  p_is_member_a_voter( p_cmi_Contact_ID INTEGER(7) )
BEGIN
-- THIS ASSUMES AN ABBRIEVIATED NAME STARTS WITH THE SAME LETTER AS THE FULL NAME
-- THIS ASSUMES AN ABBRIEVIATED NAME STARTS WITH THE SAME LETTER AS THE FULL NAME

DECLARE  done                           TINYINT DEFAULT 0;   -- Used to break out of record loops
DECLARE  _count1                        INTEGER(7);
DECLARE  _count2                        INTEGER(7);
DECLARE  _count3                        INTEGER(7);
DECLARE  _forename_voter                VARCHAR(100);
DECLARE  _forename                      VARCHAR(100);
DECLARE  _lastname                      VARCHAR(100);
DECLARE  _postcode                      VARCHAR(10);
--
DECLARE  voter_cur CURSOR FOR 
     SELECT v_Forename
     FROM   srgp_voters_root
     WHERE  v_Surname=_lastname
     AND    v_Address_Postcode=_postcode
     ;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
-- Is there a match on first charactor of p_forename, p_surname and p_postcode
-- SELECT "-------------------------";
-- SELECT concat("Called with:", p_v_id); 
--
SELECT  cmi_First_Name, cmi_Last_Name, cmi_Postal_Code
INTO    _forename, _lastname, _postcode
FROM    srgp_CIVI_members_import
WHERE   cmi_Contact_ID=p_cmi_Contact_ID
;
--
select _forename;
select _lastname;
select _postcode;
--
SELECT COUNT(1)
INTO   _count1
FROM   srgp_voters_root
WHERE  v_Forename=_forename
AND    v_Surname=_lastname
AND    v_Address_Postcode=_postcode
;
--
SELECT _count1;
--
IF     _count1=1 THEN
  -- Only one CIVI person at this postcode with same p_forename and p_surname
  -- This is enough
  select "57:YES";
ELSE 
  --
  SELECT COUNT(1)
  INTO   _count2
  FROM   srgp_CIVI_members_import
  WHERE  cmi_Last_Name=_lastname
  AND    cmi_Postal_Code=_postcode
  ;
    --
	SELECT _count2;
    -- 
  IF _count2=0 THEN
      select "70:NO";
  ELSE	  
      -- This is not enough
      -- select "Maybe";
	  -- Does the person who lives use an abbreviated name
      OPEN voter_cur;
	  read_loop: LOOP

      FETCH voter_cur INTO _forename_voter;
      --
	  IF done THEN
	    LEAVE read_loop;
	  END IF;
	  --
	  SELECT _forename_voter;
	  --
	  SELECT _forename;
      --
      -- SELECT concat("Test this: ", _forename_civi, ", ", _forename);
	  --
	  IF f_match_on_abbreviation(_forename_voter, _forename)="YES" THEN
	    select "91:YES";
      ELSE
	    select "93:NO";
	  END IF;
	  --
      END LOOP;

	  CLOSE voter_cur;

  END IF;
  --
END IF;
--
--select "104:NO";
--
END//

DELIMITER ;

CALL p_is_member_a_voter(112105); -- Me


