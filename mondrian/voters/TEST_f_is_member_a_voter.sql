\u srgp

SELECT  "f_is_member_a_voter";
SELECT   cmi_Contact_ID
       , cmi_First_Name
       , cmi_Last_Name
       , cmi_Street_Address
       , cmi_Postal_Code 
	   , f_is_member_a_voter(cmi_Contact_ID) is_member_a_voter
FROM     srgp_CIVI_members_import 
WHERE    cmi_Ward in ("Broomhill", "Central", "Nether Edge", "Manor Castle", "Walkley") 
AND      cmi_Contact_ID=112105
ORDER BY cmi_Last_Name
       , cmi_Postal_Code
;

SELECT "srgp_voters";
SELECT   v_id
       , v_Forename
       , v_Surname
	   , v_Address_Postcode
FROM     srgp_voters
WHERE    v_Surname LIKE 'Whiteloc%'
LIMIT 12
;

SELECT  "srgp_CIVI_members_import";
SELECT  cmi_First_Name, cmi_Last_Name, cmi_Postal_Code
FROM    srgp_CIVI_members_import
WHERE   cmi_Contact_ID=112105
;

SELECT "srgp_voters_root";
SELECT v_Forename
FROM   srgp_voters_root
WHERE  v_Surname="Whitelock"
AND    v_Address_Postcode="S10 5BY"
;


