-- 오전수면 대장경
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", A.EPTEXAMRMCODE, A.MEDLOCATFG, COUNT(A.PATNO) CNT
  FROM SMMEDSTT A, SMRSV00T C, MMEXMORT B
 WHERE A.ORDDATE BETWEEN TO_DATE('20090101','YYYYMMDD') AND TO_DATe('20131231','YYYYMMDD')
   AND A.EPTEXAMRMCODE IN ('AR254','CU254')
   AND A.EXAMEPTTYP NOT IN ('N','S')
   AND A.RSVNOSM = C.RSVNOSM -- 추후 재검자도 포함하기 위함.
   AND C.PATNO = B.PATNO
   AND C.ORDDATE = B.ORDDATE
   AND B.ORDCODE = 'BS4141'
   AND B.PATFG = 'G'
   AND B.EXECTIME IS NOT NULL -- 추후 재검자도 포함하기 위함.
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), A.EPTEXAMRMCODE, A.MEDLOCATFG;

-- 오전 직장, 대장경
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", A.EPTEXAMRMCODE, A.MEDLOCATFG, COUNT(A.PATNO) CNT
  FROM SMMEDSTT A
 WHERE A.ORDDATE BETWEEN TO_DATE('20090101','YYYYMMDD') AND TO_DATe('20131231','YYYYMMDD')
   AND A.EPTEXAMRMCODE IN ('AR252','AR253','CU252','CU253')
   AND A.EXAMEPTTYP NOT IN ('N','S')
   AND TO_CHAR(A.EXAMSTTIME,'HH24:MI') < '13:31'
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), A.EPTEXAMRMCODE, A.MEDLOCATFG;
