-- 뇌, 췌장, 담낭암
SELECT TO_CHAR(A.REGTIME,'YYYY') "YEAR"
     , TO_CHAR(A.REGTIME,'YYYY-MM-DD') "DATE"
     , PATNO
     , 성별찾기펑션(A.PATNO) SEX
     , 나이계산펑션(a.patno, a.orddate) AGE
     , (
        SELECT OPTION2
          FROM CCCOMCDT X
         WHERE X.GRPCODE = 'SM304'
           AND A.BDYPART = X.OPTION1
       ) BODYPART
     , A.EXAMCODE
     , B.ORDNAME EXAM
  FROM SMDIS00T A
     , MMORDRCT B
 WHERE A.REGTIME BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
   AND A.DISTYP = 'C'
   AND A.BDYPART IN (
                     'CAN001' -- BRAIN
                    ,'CAN010' -- PANCREAS
                    ,'CAN011' -- GALL BLADDER
                  )
   AND A.EXAMCODE||A.DECICODE NOT IN (-- 종괴 제외, 암의심만 고려함.
                                  'RM3170HC1015'
                                 ,'RM3170N1015'
                                 ,'RS10102011'
                                 ,'RS10105001'
                                 ,'RS10108888'
                                 ,'RS10312011'
                                 ,'RS10315001'
                                 ,'RS10318888'
                                 ,'RC12411043'
                                 ,'RC20101015'
                                 ,'RM3170N1003'
                                 ,'RM3170N1024'
                                 ,'RM3170N1052'
                                 ,'RS10101011'
                                 ,'RS10103010'
                                 ,'RS10311011'
                                 ,'RS10313010'
                                 )
   AND A.EXAMCODE = B.ORDCODE

-- 갑상선암
SELECT TO_CHAR(A.REGTIME,'YYYY') "YEAR"
     , TO_CHAR(A.REGTIME,'YYYY-MM-DD') "DATE"
     , PATNO
     , 성별찾기펑션(A.PATNO) SEX
     , 나이계산펑션(a.patno, a.orddate) AGE
     , (
        SELECT OPTION2
          FROM CCCOMCDT X
         WHERE X.GRPCODE = 'SM304'
           AND A.BDYPART = X.OPTION1
       ) BODYPART
     , A.EXAMCODE
     , B.ORDNAME EXAM
  FROM SMDIS00T A
     , MMORDRCT B
 WHERE A.REGTIME BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
   AND A.DISTYP = 'C'
   AND A.BDYPART IN (
--                     'CAN001' -- BRAIN
--                    ,'CAN010' -- PANCREAS
--                    ,'CAN011' -- GALL BLADDER
                     'CAN002' -- THYOID
                  )
   AND A.EXAMCODE||A.DECICODE NOT IN (-- 종괴 제외, 암의심만 고려함.
                                  'RS10318888'
                                 ,'RS11721003'
                                 ,'RS11722000'
                                 )
   AND A.EXAMCODE = B.ORDCODE

-- 년도별 검사 총인원, 1년 단위로 작업.
SELECT TO_CHAR(A.ORDDATE,'YYYY') "YEAR", A.ORDCODE, B.ORDNAME, COUNT(A.PATNO) CNT
  FROM MMEXMORT A, MMORDRCT B
 WHERE A.ORDDATE BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20101231','YYYYMMDD')
   AND A.PATFG = 'G'
   AND A.ORDCODE IN (
                     'BL3712'
                    ,'BL3717'
                    ,'BL4401'
                    ,'NR1104'
                    ,'NX1001'
                    ,'RC2050'
                    ,'RC2060'
                    ,'RC3120'
                    ,'RM1010'
                    ,'RM1010HC'
                    ,'RM2040'
                    ,'RM3170HC'
                    ,'RM3170N'
                    ,'RS1010'
                    ,'RS1031'
                    ,'RS1172'
                    )
   AND A.PROCSTAT > 'C'
   AND A.ORDCODE = B.ORDCODE
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY') , A.ORDCODE, B.ORDNAME

-- 전체건진인원, 2010~2013
SELECT TO_CHAR(A.ORDDATE,'YYYY') "YEAR", COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20131201','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND (SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       OR
        B.PKGTYP IN ('5D' -- 뇌
                    ,'5G' -- 소화기
                    --,'5T' -- 갑상선
                    )
       )
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY')

--2014년
SELECT TO_CHAR(A.ORDDATE,'YYYY') "YEAR", COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND (SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       OR
        B.PKGTYP IN ('5D' -- 뇌
                    ,'5G' -- 소화기
                    ,'5T' -- 갑상선
                    )
       )
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY')
