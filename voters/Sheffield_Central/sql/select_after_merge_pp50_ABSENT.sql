\u srgp

SELECT t1.a, t1.b FROM (SELECT    COUNT(1) a 
                                , v_md5 b 
                        FROM      srgp_voters 
                        WHERE     v_import_source='p'
                        GROUP BY  v_md5) t1 
WHERE  t1.a >8
;

SELECT SUM(t1.a) FROM (SELECT     COUNT(1) a 
                       FROM       srgp_voters 
                       WHERE      v_import_source='p' 
                       GROUP BY   v_md5) t1 
WHERE t1.a >8
;   


SELECT t1.a, t1.b FROM (SELECT    COUNT(1) a 
                                , v_md5 b 
                        FROM      srgp_voters 
                        WHERE     v_import_source='A'
                        GROUP BY  v_md5) t1 
WHERE  t1.a >8
;

SELECT SUM(t1.a) FROM (SELECT     COUNT(1) a 
                       FROM       srgp_voters 
                       WHERE      v_import_source='A' 
                       GROUP BY   v_md5) t1 
WHERE t1.a >8
;   




