SELECT DISTINCT A.ORDCODE, B.ORDNAME
  FROM (
-- 일반처방항목
SELECT DISTINCT A.ORDCODE
  FROM SMPKGMDT A
 WHERE EXISTS (
               SELECT 'Y'
                 FROM SMPKGMST X
                WHERE A.PKGCODE = X.PKGCODE
                  AND X.PKGUSEYN = 'Y'
                  AND SUBSTR(X.PKGTYP,1,1) IN ('0','1','2','3','4')
              )
   AND NOT EXISTS (
               SELECT 'Y'
                 FROM SMPKGMDT X
                WHERE A.ORDCODE = X.PKGCODE
                  AND X.EXAMTYP = '4'
              )
UNION ALL
-- USERSET 세부항목
SELECT DISTINCT B.ORDCODE
  FROM (
        SELECT DISTINCT A.ORDCODE
          FROM SMPKGMDT A
         WHERE EXISTS (
                       SELECT 'Y'
                         FROM SMPKGMST X
                        WHERE A.PKGCODE = X.PKGCODE
                          AND X.PKGUSEYN = 'Y'
                          AND SUBSTR(X.PKGTYP,1,1) IN ('0','1','2','3','4')
                      )
           AND EXISTS (
                       SELECT 'Y'
                         FROM SMPKGMDT X
                        WHERE A.ORDCODE = X.PKGCODE
                          AND X.EXAMTYP = '4'
                      )
       ) A
     , SMPKGMDT B
 WHERE A.ORDCODE = B.PKGCODE
       ) A
     , MMORDRCT B
 WHERE A.ORDCODE = B.ORDCODE
   AND A.ORDCODE LIKE 'BL%'
