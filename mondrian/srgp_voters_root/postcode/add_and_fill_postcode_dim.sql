
/*
desc srgp_S_postcode;

Steps 
1)  Add postcode dim column
2)  Fill with lookup to srgp_S_postcode

*/

ALTER TABLE srgp_voters_root ADD COLUMN v_sp_id int(7) AFTER v_Address_Postcode
;

UPDATE srgp_voters_root 
SET    v_sp_id= (  SELECT   sp_id
                   FROM     srgp_S_postcode
                   WHERE    sp_Postcode=v_Address_Postcode
                 )
;


