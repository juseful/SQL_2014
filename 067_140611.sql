SELECT *
  FROM (
SELECT /* INDEX(A MMEXMORT_IDX10) INDEX(A MMEXMORT_IDX12) */
       A.ORDDATE, A.PATNO, C.PATNAME, C.SEX, C.ZIPCODE
  FROM SMRSV00T A, MMEXMORT B, APPATBAT C
 WHERE A.ORDDATE BETWEEN TO_DATE('20130601','YYYYMMDD') AND TO_DATE('20140610','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND B.PATFG = 'G'
   AND B.ORDCODE LIKE 'RM%HC'
   AND B.PROCSTAT > 'C'
   AND A.PATNO = C.PATNO
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND X.ORDCODE LIKE 'RM%HC'
                  AND X.PATFG = 'G'
                  AND A.ORDDATE > X.ORDDATE
                  AND X.PROCSTAT > 'C'
              )
       ) A
 WHERE (
        A.ZIPCODE LIKE '135%' -- 강남구
      OR
        A.ZIPCODE LIKE '137%' -- 서초구
       )
