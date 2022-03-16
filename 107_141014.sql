SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS"
     , CASE
            WHEN 나이계산펑션(a.patno, a.orddate) < '20' THEN '1.20세 미만'
            WHEN 나이계산펑션(a.patno, a.orddate) < '30' THEN '2.20대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '40' THEN '3.30대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '50' THEN '4.40대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '60' THEN '5.50대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '70' THEN '6.60대'
       ELSE '7.70세 이상'
       END AGEGRP
     , A.MEDLOCATFG
     , COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B, APPATBAT C
 WHERE A.ORDDATE BETWEEN TO_DATe('20030101','YYYYMMDD') AND TO_dATe('20140930','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND A.PATNO = C.PATNO
   AND C.SEX = 'F'
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')
     , CASE
            WHEN 나이계산펑션(a.patno, a.orddate) < '20' THEN '1.20세 미만'
            WHEN 나이계산펑션(a.patno, a.orddate) < '30' THEN '2.20대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '40' THEN '3.30대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '50' THEN '4.40대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '60' THEN '5.50대'
            WHEN 나이계산펑션(a.patno, a.orddate) < '70' THEN '6.60대'
       ELSE '7.70세 이상'
       END
     , A.MEDLOCATFG
 ORDER BY 1,2,3
