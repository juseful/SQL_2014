SELECT A.RSLTCODE, B.RSLTCODENM, COUNT(A.PATNO) CNT
  FROM SMRSLTCT A, SMCDRSMT B
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.EXAMCODE = 'SM3750'
   AND A.EXAMCODE = B.EXAMCODE
   AND A.RSLTCODE = B.RSLTCODE
   AND A.RSLTCODE LIKE 'S%'
 GROUP BY A.RSLTCODE, B.RSLTCODENM;

SELECT COUNT(A.PATNO) CNT
  FROM MMEXMORT A
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.ORDCODE = 'SM3600'
   AND A.PROCSTAT > 'C'