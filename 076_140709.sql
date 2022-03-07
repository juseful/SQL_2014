-- 2014 단체
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.CONTNO IS NOT NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')

-- 2013 단체
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20130630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.CONTNO IS NOT NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')

-- 2014 신규 단체
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", C.CUSTNM, COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
     , (-- 2014년 신규 계약처
        SELECT B.CUSTNM, A.*
          FROM SMCUSTCT A, SMCUST0T B
         WHERE A.STARTDATE > '2013-12-31'
           AND NOT EXISTS (
                           SELECT 'Y'
                             FROM SMCUSTCT X
                            WHERE A.CUSTCODE = X.CUSTCODE
                              AND X.STARTDATE < '2014-01-01'
                          )
           AND A.CUSTCODE = B.CUSTCODE
        ORDER BY A.CUSTCODE, A.STARTDATE
       ) C
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.CONTNO IS NOT NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND A.CONTNO = C.CONTNO
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), C.CUSTNM

-- 2014 맞춤
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", COUNT(A.PATNO) CNT
  FROM SMRSV00T A
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE LIKE 'MM%'
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')

-- 2013 맞춤
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", COUNT(A.PATNO) CNT
  FROM SMRSV00T A
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20130630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE LIKE 'MM%'
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')

-- 신규… 환자정보보안
-- 2014 맞춤 초진
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", COUNT(A.PATNO) CNT
  FROM
       (SELECT PATNO, MIN(ORDDATE) ORDDATE, PKGCODE
          FROM
               (SELECT DISTINCT A.PATNO, B.ORDDATE, B.PKGCODE
                  FROM
                       (SELECT DISTINCT PATNO
                         FROM SMRSV00T
                        WHERE ORDDATE BETWEEN TO_DATE(&D1,'yyyymmdd') AND TO_DATE(&D2,'yyyymmdd')
                          AND CANCELTIME IS NULL
                          AND PKGCODE LIKE 'MM%') A, SMRSV00T B
                 WHERE A.PATNO = B.PATNO
                   AND B.CANCELTIME IS NULL
                   AND B.ORDDATE IS NOT NULL
                   AND B.PKGCODE LIKE 'MM%')
         GROUP BY PATNO, PKGCODE) A
 WHERE A.ORDDATE BETWEEN TO_DATE(&D1,'yyyymmdd') AND TO_DATE(&D2,'yyyymmdd')
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM');

-- 2014 초진
        -- 초진자 인원 최종
                SELECT   --DECODE(A.CONTNO,'','개인(초진)','단체(초진)') GUBUN
                       --,
                         TO_CHAR(A.ORDDATE,'YYYY-MM') YYYY
                       , DECODE(DECODE(A.TYP,'1C',A.TYP,DECODE(SUBSTR(A.TYP,1,1),'3',A.TYP,SUBSTR(A.TYP,1,1)))
             ,'0','맞춤','1','정밀','1C','위너스','2','건강의학','3A','임원','3B','임원부인','3C','단체임원','4','숙박','5','특화','6','생습','8','IHS','') TYP
--                       , A.MEDLOCATFG
                       , COUNT(A.PATNO) CNT
                  FROM (-- 건진 이력 따져서 랭킹 매기기
                        SELECT   DISTINCT A.PATNO
                               , B.ORDDATE
                               , B.PKGCODE
                               , B.MEDLOCATFG
                               , B.CONTNO
                               , DECODE(C.PKGTYP,'1C',C.PKGTYP,DECODE(SUBSTR(C.pkgtyp,1,1),'3',C.PKGTYP,SUBSTR(C.pkgtyp,1,1))) TYP
                               , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY B.ORDDATE) RN
                         FROM (-- 이번 달 건진 한 사람들....
                               SELECT DISTINCT A.PATNO
                                 FROM SMRSV00T A, SMPKGMST B
                                WHERE A.ORDDATE BETWEEN TO_DATE(&D1,'yyyymmdd') AND TO_DATE(&D2,'yyyymmdd')
                                  AND A.CANCELTIME IS NULL
                                  AND A.PKGCODE = B.PKGCODE
                                  AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                                  AND A.PKGCODE != 'THSL') A, SMRSV00T B, SMPKGMST C
                        WHERE A.PATNO = B.PATNO
                          AND B.CANCELTIME IS NULL
                          AND B.ORDDATE IS NOT NULL
                          AND B.PKGCODE = C.PKGCODE
                          AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')) A, SMPKGMST B
                 WHERE A.RN = 1
                   AND A.ORDDATE BETWEEN TO_DATE(&D1,'yyyymmdd') AND TO_DATE(&D2,'yyyymmdd')
                   AND A.PKGCODE = B.PKGCODE
                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                 GROUP BY DECODE(A.CONTNO,'','개인(초진)','단체(초진)'), TO_CHAR(A.ORDDATE,'YYYY-MM'),
                 DECODE(DECODE(A.TYP,'1C',A.TYP,DECODE(SUBSTR(A.TYP,1,1),'3',A.TYP,SUBSTR(A.TYP,1,1)))
             ,'0','맞춤','1','정밀','1C','위너스','2','건강의학','3A','임원','3B','임원부인','3C','단체임원','4','숙박','5','특화','6','생습','8','IHS','')

-- 2013 초진
        -- 초진자 인원 최종
                SELECT   --DECODE(A.CONTNO,'','개인(초진)','단체(초진)') GUBUN
                       --,
                         TO_CHAR(A.ORDDATE,'YYYY-MM') YYYY
                       , DECODE(DECODE(A.TYP,'1C',A.TYP,DECODE(SUBSTR(A.TYP,1,1),'3',A.TYP,SUBSTR(A.TYP,1,1)))
             ,'0','맞춤','1','정밀','1C','위너스','2','건강의학','3A','임원','3B','임원부인','3C','단체임원','4','숙박','5','특화','6','생습','8','IHS','') TYP
--                       , A.MEDLOCATFG
                       , COUNT(A.PATNO) CNT
                  FROM (-- 건진 이력 따져서 랭킹 매기기
                        SELECT   DISTINCT A.PATNO
                               , B.ORDDATE
                               , B.PKGCODE
                               , B.MEDLOCATFG
                               , B.CONTNO
                               , DECODE(C.PKGTYP,'1C',C.PKGTYP,DECODE(SUBSTR(C.pkgtyp,1,1),'3',C.PKGTYP,SUBSTR(C.pkgtyp,1,1))) TYP
                               , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY B.ORDDATE) RN
                         FROM (-- 이번 달 건진 한 사람들....
                               SELECT DISTINCT A.PATNO
                                 FROM SMRSV00T A, SMPKGMST B
                                WHERE A.ORDDATE BETWEEN TO_DATE(&D1,'yyyymmdd') AND TO_DATE(&D2,'yyyymmdd')
                                  AND A.CANCELTIME IS NULL
                                  AND A.PKGCODE = B.PKGCODE
                                  AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                                  AND A.PKGCODE != 'THSL') A, SMRSV00T B, SMPKGMST C
                        WHERE A.PATNO = B.PATNO
                          AND B.CANCELTIME IS NULL
                          AND B.ORDDATE IS NOT NULL
                          AND B.PKGCODE = C.PKGCODE
                          AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')) A, SMPKGMST B
                 WHERE A.RN = 1
                   AND A.ORDDATE BETWEEN TO_DATE(&D1,'yyyymmdd') AND TO_DATE(&D2,'yyyymmdd')
                   AND A.PKGCODE = B.PKGCODE
                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                 GROUP BY DECODE(A.CONTNO,'','개인(초진)','단체(초진)'), TO_CHAR(A.ORDDATE,'YYYY-MM'),
                 DECODE(DECODE(A.TYP,'1C',A.TYP,DECODE(SUBSTR(A.TYP,1,1),'3',A.TYP,SUBSTR(A.TYP,1,1)))
             ,'0','맞춤','1','정밀','1C','위너스','2','건강의학','3A','임원','3B','임원부인','3C','단체임원','4','숙박','5','특화','6','생습','8','IHS','')

-- 날짜기준 자동적용으로 수정함….
-- 2014 초재진, 과거 5년 동안의 초진자 중 이번달이 정규건진 2회차인 사람...
SELECT --DECODE(A.CONTNO,'','개인(초재진)','단체(초재진)') GUBUN
--     ,
       TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH"
     , DECODE(A.PKGTYP,'1C',A.PKGTYP,DECODE(SUBSTR(A.pkgtyp,1,1),'3',A.PKGTYP,SUBSTR(A.pkgtyp,1,1))) PKGTYP
     , DECODE(DECODE(A.PKGTYP,'1C',A.PKGTYP,DECODE(SUBSTR(A.pkgtyp,1,1),'3',A.PKGTYP,SUBSTR(A.pkgtyp,1,1)))
             ,'0','맞춤','1','정밀','1C','위너스','2','건강의학','3A','임원','3B','임원부인','3C','단체임원','4','숙박','5','특화','6','생습','8','IHS','') TYP
--     , A.MEDLOCATFG
     , COUNT(A.PATNO) CNT
  FROM (-- 해당월 건진자의 결과 통합
        SELECT A.*
          FROM (-- 해당월 건진자의 과거이력
                SELECT A.PATNO, A.RSVNOSM, B.MEDLOCATFG, B.ORDDATE, A.CONTNO, B.PKGCODE, C.PKGTYP
                     , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY B.ORDDATE) RN
                  FROM (
                        SELECT A.PATNO, A.RSVNOSM, A.ORDDATE, A.MEDLOCATFG, A.CONTNO
                          FROM SMRSV00T A, SMPKGMST B
                         WHERE A.ORDDATE BETWEEN TO_DATE(&D1,'YYYYMMDD')
                                             AND TO_DATE(&D2,'YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.PKGCODE = B.PKGCODE
                           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                       ) A
                     , SMRSV00T B
                     , SMPKGMST C
                 WHERE A.PATNO = B.PATNO
                   AND B.CANCELTIME IS NULL
                   AND B.ORDDATE IS NOT NULL
                   AND B.PKGCODE = C.PKGCODE
                   AND B.ORDDATE > (TO_CHAR(TO_DATE(&D1,'YYYYMMDD'),'YYYY')-6)||'-12-31' -- 과거 5년까지만으로 한정함...
                   AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) A
       ) A
 WHERE A.RN = '2'
   AND A.ORDDATE BETWEEN TO_DATE(&D1,'YYYYMMDD')
                     AND TO_DATE(&D2,'YYYYMMDD')
 GROUP BY --DECODE(A.CONTNO,'','개인(초재진)','단체(초재진)')
--     ,
       TO_CHAR(A.ORDDATE,'YYYY-MM')
     , DECODE(A.PKGTYP,'1C',A.PKGTYP,DECODE(SUBSTR(A.pkgtyp,1,1),'3',A.PKGTYP,SUBSTR(A.pkgtyp,1,1)))
     , DECODE(DECODE(A.PKGTYP,'1C',A.PKGTYP,DECODE(SUBSTR(A.pkgtyp,1,1),'3',A.PKGTYP,SUBSTR(A.pkgtyp,1,1)))
             ,'0','맞춤','1','정밀','1C','위너스','2','건강의학','3A','임원','3B','임원부인','3C','단체임원','4','숙박','5','특화','6','생습','8','IHS','')
--     , A.MEDLOCATFG
 ORDER BY 1,2

