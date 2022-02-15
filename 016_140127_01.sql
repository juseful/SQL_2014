SELECT A.PATNO
            , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
                   THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
               ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , A.CNT, B.AMT
  FROM (-- 건진횟수
        SELECT A.PATNO, COUNT(B.ORDDATE) CNT
          FROM (
                SELECT DISTINCT PATNO
                  FROM SMRSV00T A
                 WHERE A.ORDDATE BETWEEN TO_DATE('20000101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE LIKE 'MM%'
               ) A
             , SMRSV00T B
             , SMPKGMST C
         WHERE A.PATNO = B.PATNO
           AND B.ORDDATE BETWEEN TO_DATE('20000101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
           AND B.CANCELTIME IS NULL
           AND B.ORDDATE IS NOT NULL
           AND B.PKGCODE = C.PKGCODE
           AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
         GROUP BY A.PATNO
       ) A
     , (-- 건진수납액
        SELECT A.PATNO, SUM(B.CREAMT)/1000 AMT
          FROM (
                SELECT A.PATNO, B.ORDDATE, B.RSVNOSM
                  FROM (
                        SELECT DISTINCT PATNO
                          FROM SMRSV00T A
                         WHERE A.ORDDATE BETWEEN TO_DATE('20000101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.PKGCODE LIKE 'MM%'
                       ) A
                     , SMRSV00T B
                     , SMPKGMST C
                 WHERE A.PATNO = B.PATNO
                   AND B.ORDDATE BETWEEN TO_DATE('20000101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                   AND B.CANCELTIME IS NULL
                   AND B.ORDDATE IS NOT NULL
                   AND B.PKGCODE = C.PKGCODE
                   AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) A
             , SMRCP00T B
         WHERE A.RSVNOSM = B.RSVNOSM
           AND B.RCPTYP IN ('0','7','8')
         GROUP BY A.PATNO
       ) B
 WHERE A.PATNO = B.PATNO
