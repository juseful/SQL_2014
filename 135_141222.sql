SELECT TO_CHAR(A.ORDEPTDATE,'YYYY-MM') "MONTH"
     , B.SEX
     , CASE
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 30 THEN '1. 30미만'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 40 THEN '2. 30대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 50 THEN '3. 40대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 60 THEN '4. 50대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 70 THEN '5. 60대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 80 THEN '6. 70대'
            ELSE '7.80 이상'
        END AGEGRP
     , COUNT(A.PATNO) CNT
  FROM SMRSV00T A, APPATBAT B
 WHERE A.ORDEPTDATE BETWEEN TO_DATE('20150102','YYYYMMDD') AND TO_DATE('20150630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE LIKE 'MM%'
   AND A.PATNO = B.PATNO
 GROUP BY TO_CHAR(A.ORDEPTDATE,'YYYY-MM')
     , B.SEX
     , CASE
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 30 THEN '1. 30미만'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 40 THEN '2. 30대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 50 THEN '3. 40대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 60 THEN '4. 50대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 70 THEN '5. 60대'
            WHEN TRUNC(MONTHS_BETWEEN(A.ORDEPTDATE,B.BIRTHDAY)/12) < 80 THEN '6. 70대'
            ELSE '7.80 이상'
        END
