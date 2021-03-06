SELECT TO_CHAR(A.EXECTIME,'YYYY-MM') "MONTH", TO_CHAR(A.EXECTIME,'YYYY-MM-DD') EXECDATE, COUNT(A.PATNO) CNT
  FROM MMEXMORT A
 WHERE A.EXECTIME BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')+0.99999
   AND A.ORDCODE IN ('BU1011','BU1319')
   AND A.MEDDEPT = 'SMU'
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM-DD'), TO_CHAR(A.EXECTIME,'YYYY-MM')
