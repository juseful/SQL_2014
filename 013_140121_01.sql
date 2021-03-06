-- 영상 및 심초
SELECT '1.검사및판독' GUBUN, TO_CHAR(A.EXECTIME,'YYYY-MM') "MONTHS", A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR, COUNT(A.CNT) CNT
  FROM (
-- MD
--검사실별 의사별 검사 건수, 다시 수정 2009.12.01
-- 김영주 방사선사 요청으로 인해 PM기준시간을 1300 -> 1200으로 변경함. 2010.09월 통계부터~~~
SELECT A.EXECTIME, a.meddept
     , DECODE(TO_CHAR(A.EXECTIME,'D'),'1','주말','7','주말','주중') GUBUN2
     , A.ORDCODE EXAM, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') "TIME",
       CASE WHEN TO_CHAR(A.EXECTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END "APM",
       A.PATFG,
       A.MEDLOCATFG MEDCENTER,
       A.READDR1||'-'||C.USERNAME DR,
       COUNT(A.PATNO)  CNT
  FROM MMEXMORT A, MMORDRCT B, CSUSERMT C
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_dATE(&D2,'YYYYMMDD')+.99999
   AND (A.EXAMTYP = 'SR' OR A.ORDCODE = 'BS2231')
   AND A.ORDCODE NOT LIKE 'RC%'
   AND A.ORDCODE NOT LIKE 'RM%'
   AND A.ORDCODE NOT LIKE 'RG%'
   AND A.ORDCODE NOT LIKE 'RF%'
   AND A.ORDCODE NOT IN ( 'RS2010','RG9214')
   AND A.PATFG = 'G'
   AND A.ORDCODE = B.ORDCODE
   AND A.READDR1 = C.USERID
 GROUP BY A.EXECTIME, a.meddept
       , DECODE(TO_CHAR(A.EXECTIME,'D'),'1','주말','7','주말','주중')
       , A.ORDCODE, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') ,
       CASE WHEN TO_CHAR(A.EXECTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END ,
       A.PATFG,
       A.MEDLOCATFG,
       A.READDR1||'-'||C.USERNAME
       ) A
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM'), A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR

--부인과
SELECT '1.검사및판독' GUBUN, TO_CHAR(A.EXECTIME,'YYYY-MM') "MONTHS", A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR, COUNT(A.CNT) CNT
  FROM (
-- MD
--검사실별 의사별 검사 건수, 다시 수정 2009.12.01
-- 김영주 방사선사 요청으로 인해 PM기준시간을 1300 -> 1200으로 변경함. 2010.09월 통계부터~~~
SELECT A.EXECTIME, a.meddept
     , DECODE(TO_CHAR(A.EXECTIME,'D'),'1','주말','7','주말','주중') GUBUN2
     , A.ORDCODE EXAM, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') "TIME",
       CASE WHEN TO_CHAR(A.EXECTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END "APM",
       A.PATFG,
       A.MEDLOCATFG MEDCENTER,
       A.READDR1||'-'||C.USERNAME DR,
       COUNT(A.PATNO)  CNT
  FROM MMEXMORT A, MMORDRCT B, CSUSERMT C
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_dATE(&D2,'YYYYMMDD')+.99999
   AND A.ORDCODE IN ('SM1801','SM1805')
   AND A.ORDCODE NOT LIKE 'RC%'
   AND A.ORDCODE NOT LIKE 'RM%'
   AND A.ORDCODE NOT LIKE 'RG%'
   AND A.ORDCODE NOT LIKE 'RF%'
   AND A.ORDCODE NOT IN ( 'RS2010','RG9214')
   AND A.PATFG = 'G'
   AND A.ORDCODE = B.ORDCODE
   AND A.READDR1 = C.USERID
 GROUP BY A.EXECTIME, a.meddept
       , DECODE(TO_CHAR(A.EXECTIME,'D'),'1','주말','7','주말','주중')
       , A.ORDCODE, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') ,
       CASE WHEN TO_CHAR(A.EXECTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END ,
       A.PATFG,
       A.MEDLOCATFG,
       A.READDR1||'-'||C.USERNAME
       ) A
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM'), A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR;

--내시경
SELECT '1.검사및판독' GUBUN, TO_CHAR(A.EXECTIME,'YYYY-MM') "MONTHS", A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR, COUNT(A.CNT) CNT
  FROM (
-- MD
--검사실별 의사별 검사 건수, 다시 수정 2009.12.01
-- 김영주 방사선사 요청으로 인해 PM기준시간을 1300 -> 1200으로 변경함. 2010.09월 통계부터~~~
SELECT A.EXECTIME, a.meddept
     , DECODE(TO_CHAR(A.EXECTIME,'D'),'1','주말','7','주말','주중') GUBUN2
     , A.ORDCODE EXAM, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') "TIME",
       CASE WHEN TO_CHAR(A.EXECTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END "APM",
       A.PATFG,
       A.MEDLOCATFG MEDCENTER,
       A.READDR1||'-'||C.USERNAME DR,
       COUNT(A.PATNO)  CNT
  FROM MMEXMORT A, MMORDRCT B, CSUSERMT C
 WHERE A.EXECTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_dATE(&D2,'YYYYMMDD')+.99999
   AND A.EXAMTYP = 'SO'
--   AND A.PATFG = 'G'
   AND A.ORDCODE = B.ORDCODE
   AND A.READDR1 = C.USERID
   AND C.DEPTCODE = 'SM'
 GROUP BY A.EXECTIME, a.meddept
       , DECODE(TO_CHAR(A.EXECTIME,'D'),'1','주말','7','주말','주중')
       , A.ORDCODE, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') ,
       CASE WHEN TO_CHAR(A.EXECTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END ,
       A.PATFG,
       A.MEDLOCATFG,
       A.READDR1||'-'||C.USERNAME
       ) A
 GROUP BY TO_CHAR(A.EXECTIME,'YYYY-MM'), A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR;

-- 영상
SELECT '2.판독' GUBUN, TO_CHAR(A.READTIME,'YYYY-MM') "MONTHS", A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR, COUNT(A.CNT) CNT
  FROM (
-- READ
--의사별 판독건수(판독일 기준) : 영상  ..2009.02.04..CT의 SWWORKMT EXAMTYP을 SR -> SM 변경
 SELECT /*+ ORDERED USE_NL(A B) INDEX(A SWWORKMT_IDX9) INDEX(B CSUSERMT_PK) */
         A.READTIME, a.meddept
       , DECODE(TO_CHAR(A.READTIME,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN') "DAY"
       , TO_CHAR(A.READTIME,'D') GUBUN
       , DECODE(TO_CHAR(A.READTIME,'D'),'1','주말','7','주말','주중') GUBUN2
       , A.PATFG, A.EXAMCODE "EXAM", C.ORDNAME,
       A.MEDCENTER ,
        A.READDR1||'-'||B.USERNAME DR, COUNT(A.PATNO) CNT
  FROM SWWORKMT A, CSUSERMT B, MMORDRCT C
 WHERE A.READTIME BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+.99999
   AND (A.EXAMTYP = 'SR' OR SUBSTR(A.EXAMCODE,1,2) ='RC' or examcode = 'BS1701')
   AND A.EXAMCODE NOT LIKE 'RS%'
--   AND A.PATFG = 'G' <-- 2013년 부터 입원, 외래 처방의 경우도 포함하기로 함.
   AND A.READDR1 = B.USERID
   AND B.DEPTCODE LIKE 'SM'
   AND A.EXAMCODE = C.ORDCODE
 GROUP BY A.READTIME, a.meddept
       , DECODE(TO_CHAR(A.READTIME,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN')
       , TO_CHAR(A.READTIME,'D')
       , DECODE(TO_CHAR(A.READTIME,'D'),'1','주말','7','주말','주중')
       , A.PATFG, A.EXAMCODE, C.ORDNAME,
       A.MEDCENTER ,
        A.READDR1||'-'||B.USERNAME
       ) A
 GROUP BY TO_CHAR(A.READTIME,'YYYY-MM'), A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR

--심전도
SELECT /*+ INDEX(A MMEXMORT_IDX3) INDEX(A MMEXMORT_IDX9) INDEX(A MMEXMORT_IDX7)*/
       '2.판독' GUBUN, TO_CHAR(A.REPTTIME,'YYYY-MM') "MONTHS", A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR, COUNT(A.CNT) CNT
  FROM (
-- MD
--검사실별 의사별 검사 건수, 다시 수정 2009.12.01
-- 김영주 방사선사 요청으로 인해 PM기준시간을 1300 -> 1200으로 변경함. 2010.09월 통계부터~~~
SELECT A.REPTTIME, a.meddept
     , DECODE(TO_CHAR(A.REPTTIME,'D'),'1','주말','7','주말','주중') GUBUN2
     , A.ORDCODE EXAM, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') "TIME",
       CASE WHEN TO_CHAR(A.REPTTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END "APM",
       A.PATFG,
       A.MEDLOCATFG MEDCENTER,
       A.READDR1||'-'||C.USERNAME DR,
       COUNT(A.PATNO)  CNT
  FROM MMEXMORT A, MMORDRCT B, CSUSERMT C
 WHERE A.REPTTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_dATE(&D2,'YYYYMMDD')+.99999
   AND A.ORDCODE = 'BS2111'
   AND A.PATFG = 'G'
   AND A.ORDCODE = B.ORDCODE
   AND A.READDR1 = C.USERID
   AND C.DEPTCODE = 'SM'
 GROUP BY A.REPTTIME, a.meddept
       , DECODE(TO_CHAR(A.REPTTIME,'D'),'1','주말','7','주말','주중')
       , A.ORDCODE, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') ,
       CASE WHEN TO_CHAR(A.REPTTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END ,
       A.PATFG,
       A.MEDLOCATFG,
       A.READDR1||'-'||C.USERNAME
       ) A
 GROUP BY TO_CHAR(A.REPTTIME,'YYYY-MM'), A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR;

--폐기능
SELECT /*+ INDEX(A MMEXMORT_IDX3) INDEX(A MMEXMORT_IDX9) INDEX(A MMEXMORT_IDX7)*/
       '2.판독' GUBUN, TO_CHAR(A.REPTTIME,'YYYY-MM') "MONTHS", A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR, COUNT(A.CNT) CNT
  FROM (
-- MD
--검사실별 의사별 검사 건수, 다시 수정 2009.12.01
-- 김영주 방사선사 요청으로 인해 PM기준시간을 1300 -> 1200으로 변경함. 2010.09월 통계부터~~~
SELECT A.REPTTIME, a.meddept
     , DECODE(TO_CHAR(A.REPTTIME,'D'),'1','주말','7','주말','주중') GUBUN2
     , A.ORDCODE EXAM, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') "TIME",
       CASE WHEN TO_CHAR(A.REPTTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END "APM",
       A.PATFG,
       A.MEDLOCATFG MEDCENTER,
       A.READDR1||'-'||C.USERNAME DR,
       COUNT(A.PATNO)  CNT
  FROM MMEXMORT A, MMORDRCT B, CSUSERMT C
 WHERE A.REPTTIME BETWEEN TO_dATE(&D1,'YYYYMMDD') AND TO_dATE(&D2,'YYYYMMDD')+.99999
   AND A.ORDCODE = 'SM0450'
   AND A.PATFG = 'G'
   AND A.ORDCODE = B.ORDCODE
   AND A.READDR1 = C.USERID
   AND C.DEPTCODE = 'SM'
 GROUP BY A.REPTTIME, a.meddept
       , DECODE(TO_CHAR(A.REPTTIME,'D'),'1','주말','7','주말','주중')
       , A.ORDCODE, B.ORDNAME,
--       TO_CHAR(A.EXECTIME,'HH24:MI') ,
       CASE WHEN TO_CHAR(A.REPTTIME,'HH24MI') < '1200' THEN 'AM'
       ELSE 'PM' END ,
       A.PATFG,
       A.MEDLOCATFG,
       A.READDR1||'-'||C.USERNAME
       ) A
 GROUP BY TO_CHAR(A.REPTTIME,'YYYY-MM'), A.GUBUN2, a.meddept, A.PATFG, A.EXAM, A.ORDNAME, A.MEDCENTER, A.DR;
