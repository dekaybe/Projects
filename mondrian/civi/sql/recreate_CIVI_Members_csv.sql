/*
12-Mar-2015
Table holds final export of NationBuilder data
http://nationbuilder.com/how_to_import
*/

\u srgp

DROP TABLE IF EXISTS srgp_CIVI_members_import
;

CREATE TABLE srgp_CIVI_members_import
  (  
     cmi_Contact_Name    VARCHAR(200)
   , cmi_Joint_member_name     VARCHAR(200)
   , cmi_Postal_Greeting     VARCHAR(200)
   , cmi_Email_Greeting     VARCHAR(200)
   , cmi_First_Name     VARCHAR(200)
   , cmi_Last_Name     VARCHAR(200)
   , cmi_Do_not_mail     VARCHAR(200)
   , cmi_Addressee     VARCHAR(200)
   , cmi_Contact_ID     INTEGER(11)
   , cmi_Membership_Type     VARCHAR(200)
   , cmi_Start_Date     VARCHAR(200)
   , cmi_End_Date     VARCHAR(200)
   , cmi_Member_Since     VARCHAR(200)
   , cmi_Source     VARCHAR(200)
   , cmi_Status     VARCHAR(200)
   , cmi_Street_Address     VARCHAR(200)
   , cmi_Supplemental_Address_1     VARCHAR(200)
   , cmi_Supplemental_Address_2     VARCHAR(200)
   , cmi_City     VARCHAR(200)
   , cmi_Postal_Code     VARCHAR(200)
   , cmi_Country     VARCHAR(200)
   , cmi_Email     VARCHAR(200)
   , cmi_Phone_primary     VARCHAR(200)
   , cmi_Mobile     VARCHAR(200)
   , cmi_Ward     VARCHAR(200)
   , cmi_Local_authority     VARCHAR(200)
   , cmi_Westminster_parliament_constituency     VARCHAR(200)
   , cmi_Local_party     VARCHAR(200)
   , cmi_Regional_party     VARCHAR(200)
   , cmi_Override_local_party     VARCHAR(200)
   , CONSTRAINT c1_cmi_Contact_ID         UNIQUE ( cmi_Contact_ID )
     )
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds import of CIVI Members data"
;

\q
