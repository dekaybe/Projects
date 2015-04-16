SELECT  cmi_First_Name
      , REPLACE(cmi_First_Name,'Mrs','')
      , cmi_Last_Name
      , cmi_Postal_Code
FROM    srgp_CIVI_members_import
WHERE   cmi_Contact_ID=115478
;

