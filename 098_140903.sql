SELECT A.CUSTNM, A.RSVNOSM, SUM(B.CREAMT)/1000 AMT
  FROM (
-- 2013 신규 단체
SELECT A.RSVNOSM, C.CUSTNM
  FROM SMRSV00T A, SMPKGMST B
     , (-- 2014년 신규 계약처
        SELECT B.CUSTNM, A.*
          FROM SMCUSTCT A, SMCUST0T B
         WHERE A.STARTDATE > '2012-12-31'
           AND NOT EXISTS (
                           SELECT 'Y'
                             FROM SMCUSTCT X
                            WHERE A.CUSTCODE = X.CUSTCODE
                              AND X.STARTDATE < '2013-01-01'
                          )
           AND A.CUSTCODE = B.CUSTCODE
        ORDER BY A.CUSTCODE, A.STARTDATE
       ) C
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20130630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.CONTNO IS NOT NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND A.CONTNO = C.CONTNO
       ) A
     , SMRCP00T B
 WHERE A.RSVNOSM = B.RSVNOSM
   AND B.RCPTYP IN ('0','7','8')
--   AND B.PSNGRPTYP = 'G'
 GROUP BY A.CUSTNM, A.RSVNOSM

SELECT A.CUSTNM, A.RSVNOSM, SUM(B.CREAMT)/1000 AMT
  FROM (
-- 2014 신규 단체
SELECT A.RSVNOSM, C.CUSTNM
  FROM SMRSV00T A, SMPKGMST B
     , (-- 2014년 신규 계약처
        SELECT B.CUSTNM, A.*
          FROM SMCUSTCT A, SMCUST0T B
         WHERE A.STARTDATE > '2013-12-31'
           AND NOT EXISTS (
                           SELECT 'Y'
                             FROM SMCUSTCT X
                            WHERE A.CUSTCODE = X.CUSTCODE
                              AND X.STARTDATE < '2014-01-01'
                          )
           AND A.CUSTCODE = B.CUSTCODE
        ORDER BY A.CUSTCODE, A.STARTDATE
       ) C
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.CONTNO IS NOT NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND A.CONTNO = C.CONTNO
       ) A
     , SMRCP00T B
 WHERE A.RSVNOSM = B.RSVNOSM
   AND B.RCPTYP IN ('0','7','8')
--   AND B.PSNGRPTYP = 'G'
 GROUP BY A.CUSTNM, A.RSVNOSM
