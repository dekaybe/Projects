SELECT    v_Forename
        , v_Middle
        , v_Surname
        , v_Address_Line_1
        , v_Address_Line_2
        , v_Address_Line_3
        , v_Address_Line_4
        , v_Address_Line_5
        , v_Address_Line_6
        , v_Address_Line_7
        , v_Address_Postcode 
INTO OUTFILE '/tmp/leaflet1.csv'     
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'     
LINES TERMINATED BY '\r\n' 
FROM      srgp_voters
WHERE     v_leaflet_num IN (2,3) 
ORDER BY  v_Address_Postcode
;
