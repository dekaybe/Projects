\u srgp

insert into srgp_abbreviation (da_short_name,da_full_name) VALUES ("Margo", "Margaret");

SELECT   cmi_Contact_ID
       , cmi_First_Name
       , cmi_Last_Name
       , cmi_Street_Address
       , cmi_Postal_Code 
FROM     srgp_CIVI_members_import 
WHERE    f_is_member_a_voter(cmi_Contact_ID)="NO" 
AND      cmi_Ward in ("Broomhill", "Central", "Nether Edge", "Manor Castle", "Walkley") 
AND      cmi_Status in ("Current","Grace","New")
-- AND      cmi_Contact_ID=122756
ORDER BY cmi_Last_Name
       , cmi_Postal_Code
;

/*
insert into srgp_abbreviation (da_short_name,da_full_name) VALUES ("Emma", "Elizabeth");

98943 is prob voter RF/1426
114340 TC/812
137178 TE/461 - postcode is probably S7 1HL
137754 could be TE/20
30967  could be TD/911
2717   TA/972 - postcode is probably S11 9FU
146618 could be EB/339



*/

