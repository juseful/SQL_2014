SELECT CASE
            WHEN 나이계산펑션(a.patno, a.orddate) > '54' THEN '1.55세 이상'
            WHEN 나이계산펑션(a.patno, a.orddate) > '49' THEN '2.50~54세'
            ELSE '3. 50세미만'
       END AGEGRP
     , 성별찾기펑션(A.PATNO) SEX
     , COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4','5')
 GROUP BY CASE
            WHEN 나이계산펑션(a.patno, a.orddate) > '54' THEN '1.55세 이상'
            WHEN 나이계산펑션(a.patno, a.orddate) > '49' THEN '2.50~54세'
            ELSE '3. 50세미만'
       END
     , 성별찾기펑션(A.PATNO)
