SELECT DISTINCT A.ORDCODE, C.ORDNAME
  FROM SMPKGMDT A, MMORDRCT B, MMORDRCT C
 WHERE A.PKGCODE LIKE 'SM72%'
   AND A.PKGCODE = B.ORDCODE
   AND A.ORDCODE = C.ORDCODE
   AND NOT EXISTS (
                   SELECT 'Y'
                     FROM SMPKGMDT X
                    WHERE A.ORDCODE = X.ORDCODE
                      AND X.PKGCODE = 'SM7010'
                  )
