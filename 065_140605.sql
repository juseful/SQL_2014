SELECT A.ORDDATE, A.PATNO
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , C.SEX
     , TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12) AGE
     , MAX(DECODE(B.EXAMCODE,'NR1107',B.RSLTNUM,'')) PSA
  FROM SMRSV00T A, STRESULT B, APPATBAT C
 WHERE A.ORDDATE BETWEEN TO_DATE('20030101','YYYYMMDD') AND TO_DATE('20091231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND B.EXAMCODE = 'NR1107'
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND A.PATNO = C.PATNO
 GROUP BY A.ORDDATE, A.PATNO, C.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12)
