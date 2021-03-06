SELECT A.PATNO, A.ORDDATE, A.MEDLOCATFG
     , MAX(DECODE(B.EXAMCODE,'NX1001',C.EXAMSTTIME)) PET_ST
     , MAX(DECODE(B.EXAMCODE,'NX1001',C.EXAMENDTIME)) PET_END
     , MAX(DECODE(B.EXAMCODE,'RG9214',C.EXAMSTTIME)) BMD_ST
     , MAX(DECODE(B.EXAMCODE,'RG9214',C.EXAMENDTIME)) BMD_END
  FROM (
        SELECT  /*+ INDEX(B MMEXMORT_IDX10) INDEX(B MMEXMORT_IDX12) */
               A.PATNO, A.ORDDATE, A.MEDLOCATFG
          FROM SMRSV00T A, MMEXMORT B
         WHERE A.ORDDATE BETWEEN TO_DATE('20120101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PATNO = B.PATNO
           AND A.ORDDATE = B.ORDDATE
           AND B.PATFG = 'G'
           AND B.ORDCODE LIKE 'NX%'
           AND EXISTS (
                       SELECT 'Y'
                         FROM MMEXMORT X
                        WHERE A.PATNO = X.PATNO
                          AND A.ORDDATE = X.ORDDATE
                          AND X.PATFG = 'G'
                          AND X.ORDCODE = 'RG9214'
                      )
       ) A
     , SMORDRCT B
     , SMMEDSTT C
 WHERE A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
   AND (B.EXAMCODE LIKE 'NX1001'
       OR
        B.EXAMCODE = 'RG9214'
       )
   AND (C.EPTEXAMRMCODE = B.MEDROOM1
       OR
        C.EPTEXAMRMCODE = B.MEDROOM2
       OR
        C.EPTEXAMRMCODE = B.MEDROOM3
       )
 GROUP BY A.PATNO, A.ORDDATE, A.MEDLOCATFG