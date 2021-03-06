-- CNT, 2014년 1월부터 기준 변경. 실시정보 기준임.
SELECT TO_CHAR(A.EXECTIME,'YYYY-MM') EXECMONTHS
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END "TIME"
     , A.ROOMCODE||'-'||C.ROOMNAME ROOMINFO, COUNT(A.PATNO) CNT
  FROM SWWORKMT A, STROOMCT C
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+0.99999
   AND A.ROOMCODE IN ('XS01','XS02','XS03','XS04','XS05','XS06','XS07','XS08','XS09','XS10','XS11'
                     ,'XS12','YF01','YF02','YF03','YF04','YF05','YF06','YF07','YF08','YF09','YM01'
                     ,'YM02','YM03','YM04','YM05','YM06','YM07','YM08','YM09','YM10'
                     )
   AND A.ROOMCODE = C.ROOMCODE
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM')
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END
     , A.ROOMCODE||'-'||C.ROOMNAME
union all
SELECT TO_CHAR(A.EXECTIME,'YYYY-MM') EXECMONTHS
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END "TIME"
     , 'PET' ROOMINFO, COUNT(A.PATNO) CNT
  FROM SWWORKMT A
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+0.99999
   AND A.EXAMCODE = 'NX1001'
   AND A.PATFG = 'G'
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM')
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END
union all
SELECT TO_CHAR(A.EXECTIME,'YYYY-MM') EXECMONTHS
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END "TIME"
     , 'MRI' ROOMINFO, COUNT(A.PATNO) CNT
  FROM SWWORKMT A
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+0.99999
   AND A.EXAMCODE LIKE 'RM%'
   AND A.PATFG = 'G'
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM')
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END
union all
SELECT TO_CHAR(A.EXECTIME,'YYYY-MM') EXECMONTHS
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END "TIME"
     , 'UGIS' ROOMINFO, COUNT(A.PATNO) CNT
  FROM SWWORKMT A
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+0.99999
   AND A.EXAMCODE LIKE 'RF1040'
   AND A.PATFG = 'G'
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM')
     , CASE WHEN NVL(TO_CHAR(A.EXECTIME,'HH24MI'),'0000') < '1200' THEN 'AM'
            ELSE 'PM'
       END;
