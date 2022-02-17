SELECT *
  FROM (
        SELECT MAX(A.ORDDATE) ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.PKGCODE LIKE 'AMP%'
           AND A.CANCELTIME IS NULL
           AND A.ORDDATE IS NOT NULL
         GROUP BY A.PATNO
       ) A
 WHERE NOT EXISTS (
                   SELECT 'Y'
                     FROM SMRSV00T X, SMPKGMST Y
                    WHERE A.PATNO = X.PATNO
                      AND A.ORDDATE < X.ORDEPTDATE
                      AND X.CANCELTIME IS NULL
                      AND X.PKGCODE = Y.PKGCODE
                      AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
                  );
