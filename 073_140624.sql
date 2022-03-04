-- CT, MRI동시진행
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", COUNT(A.PATNO) CNT
  FROM SMRSV00T A
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE LIKE 'RC%'
                  AND X.PROCSTAT > 'C'
              )
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE LIKE 'RM%'
                  AND X.PROCSTAT > 'C'
              )
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM');

-- CT 전체인원
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", COUNT(A.PATNO) CNT
  FROM SMRSV00T A
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE LIKE 'RC%'
                  AND X.PROCSTAT > 'C'
              )
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM');
