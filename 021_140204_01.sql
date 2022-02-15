-- 추가요청!! 실제검사실시시간 정보를 요청함.
SELECT A.PATNO, A.ORDDATE
     , MAX(DECODE(SUBSTR(B.ORDCODE,1,2),'NX',B.EXECTIME,'')) PET_EXETIME
     , MAX(DECODE(B.ORDCODE,'RG9214',B.EXECTIME,'')) BMD_EXETIME
  FROM (
        SELECT  /*+ INDEX(B MMEXMORT_IDX10) INDEX(B MMEXMORT_IDX12) */
               A.PATNO, A.ORDDATE, A.MEDLOCATFG
          FROM SMRSV00T A, MMEXMORT B
         WHERE A.ORDDATE BETWEEN TO_DATE('20120101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PATNO = B.PATNO
           AND A.ORDDATE = B.ORDDATE
           AND B.PATFG = 'G'
           AND B.PROCSTAT > 'C'
           AND B.ORDCODE LIKE 'NX%'
           AND EXISTS (
                       SELECT 'Y'
                         FROM MMEXMORT X
                        WHERE A.PATNO = X.PATNO
                          AND A.ORDDATE = X.ORDDATE
                          AND X.PATFG = 'G'
                          AND X.ORDCODE = 'RG9214'
                          AND X.PROCSTAT > 'C'
                      )
       ) A
     , MMEXMORT B
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
 GROUP BY A.PATNO, A.ORDDATE
