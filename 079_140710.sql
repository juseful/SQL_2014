SELECT TO_CHAR(A.MEDDATE,'YYYY-MM') "MONTH", A.MEDDATE, COUNT(A.PATNO) CNT
  FROM APOPDLST A
 WHERE A.MEDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
   AND A.MEDDEPT = 'SMU'
   and (/*20080423 부도처리 조건.  */
--           (a.MEDDATE <  trunc(sysdate)
--           and
--            a.MEDYN = 'N'
--           AND (
--                nvl(TRUNC(a.REJTTIME),to_date('29991231','yyyymmdd')) >= a.MEDDATE
--               )
--           and rsvtyp not in ('8','9')
--           )
--         or
           (
            (a.MEDDATE <  trunc(sysdate) and a.MEDYN = 'Y')
            or
            (a.MEDDATE >= trunc(sysdate))
            and a.REJTTIME is null
           )
       )
 GROUP BY A.MEDDATE
