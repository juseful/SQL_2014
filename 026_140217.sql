SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') MONTHS, B.MEDLOCATFG, A.EPTEXAMRMCODE, B.EPTEXAMRMNM
     , CASE
            WHEN TO_CHAR(EXAMSTTIME,'HH24') < '12' THEN '1.12시이전'
            WHEN TO_CHAR(EXAMSTTIME,'HH24') < '13' THEN '2.12~13시'
       ELSE '3.13시이후'
       END TIMEGR
     , COUNT(A.PATNO) CNT
  FROM (
        SELECT A.PATNO, A.ORDDATE, A.EPTEXAMRMCODE, NVL(A.EXAMSTTIME,'2999-12-31') EXAMSTTIME
          FROM SMMEDSTT A
         WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
           AND A.EPTEXAMRMCODE IN (
                                   'AR05','AR09','AR11','AR12','AR121','AR16','AR161','AR17','AR20','AR201'
                                  ,'AR21','AR22','AR221','AR23','AR24','CF06','CF061','CF07','CF13','CF14'
                                  ,'CF15','CF16','CF161','CF17','CF18','CF181','CM04','CM041','CM07','CM12'
                                  ,'CM13','CM14','CM141','CM19','CU19','CU22','CU23'
                                  )
           AND A.EXAMEPTTYP NOT IN ('N','S')
       ) A
     , SMMEDSXT B
 WHERE A.EXAMSTTIME != '2999-12-31'
   AND A.EPTEXAMRMCODE = B.EPTEXAMRMCODE
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), B.MEDLOCATFG, A.EPTEXAMRMCODE, B.EPTEXAMRMNM, B.MEDLOCATFG
     , CASE
            WHEN TO_CHAR(EXAMSTTIME,'HH24') < '12' THEN '1.12시이전'
            WHEN TO_CHAR(EXAMSTTIME,'HH24') < '13' THEN '2.12~13시'
       ELSE '3.13시이후'
       END
 ORDER BY 1,2,3,5;
