SET @v_Address_Postcode="S6 2PL";
SET @v_Surname="Klabis";

select   v_id
       , concat(v_PD,"/",v_ENO)
       , v_Forename
	   , v_Surname
	   , v_Address_Line_2
	   , v_Address_Postcode 
from     srgp_voters_root 
where    v_Address_Postcode=@v_Address_Postcode
and      v_valid=1
order by v_Surname
       , v_Forename
;

select "##############################";

select   v_id
       , concat(v_PD,"/",v_ENO)
       , v_Forename
	   , v_Middle
	   , v_Surname
	   , v_Address_Line_2
	   , v_Address_Line_4
	   , v_Address_Postcode 
from     srgp_voters_root 
where    v_Surname=@v_Surname
and      v_valid=1
-- where    v_Forename="Kirsty"
-- and      v_Surname="Brian"
order by v_Forename
;

-- select * from srgp_voters_root where v_id in (13481,13482);

