SELECT CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       END PATNO2
     , A.PATNO, COUNT(A.ORDDATE) CNT
  FROM (
SELECT A.PATNO, MAX(A.ORDDATE) ORDDATE
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
 GROUP BY A.PATNO
       ) A
     , SMRSV00T B
     , SMPKGMST C
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE >= B.ORDDATE
   AND B.CANCELTIME IS NULL
   AND B.PKGCODE = C.PKGCODE
   AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
 GROUP BY A.PATNO