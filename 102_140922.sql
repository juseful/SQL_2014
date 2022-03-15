CREATE TABLE C(
PATNO VARCHAR2(8 BYTE)
, ORDDATE DATE
);

-- 기본대상자
SELECT A.PATNO, MIN(A.ORDDATE)
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20010101','YYYYMMDD') AND TO_DATE('20071231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE IN('SM0200','SM0205')
              )
--  AND EXISTS (
--              SELECT 'Y'
--                FROM APPATSBT X
--               WHERE A.PATNO = X.PATNO
--                 AND X.AGREEYN1||X.AGREEYN2 = 'YY'
--             )
 GROUP BY A.PATNO

-- 최종!!
SELECT A.ORDDATE, A.PATNO
     , 성별찾기펑션(A.PATNO) SEX
     , 나이계산펑션(a.patno, a.orddate) AGE
     , MAX(DECODE(B.EXAMCODE,'SM0101',B.RSLTNUM,'')) "HEIGHT"
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,'')) "WEIGHT"
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM
                            ,'SM3160',B.RSLTNUM,'')) "BMI"
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) DBP
     , MAX(DECODE(B.EXAMCODE,'BL3118',B.RSLTNUM,'')) "Glucose_Fsating"
     , MAX(DECODE(B.EXAMCODE,'BL3113',B.RSLTNUM,'')) "T_Chol"
     , MAX(DECODE(B.EXAMCODE,'BL314201',B.RSLTNUM,'')) "LDL"
     , MAX(DECODE(B.EXAMCODE,'BL3142',B.RSLTNUM,'')) "HDL"
     , MAX(DECODE(B.EXAMCODE,'BL3141',B.RSLTNUM,'')) "TG"
     , MAX(DECODE(B.EXAMCODE,'SM0205',B.RSLTNUM,'')) "Intraocular Pressure"
     , MAX(DECODE(B.EXAMCODE,'SM0210',TO_CHAR(B.RSLTTEXT),'')) "Fundoscopy"
     , (-- 구문진 음주여부
        SELECT /* INDEX(X SMQUESAT_PK)*/
         DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021C008Y','Y','0'))||  -- 과거
                MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211024C008Y','Y'
                                                                             ,'1036C008Y','Y'
                                                                             ,'10211024A005Y','S'
                                                                             ,'1036C236Y','S'
                                                                             ,'1021C027Y','N'
                                                                             ,'1036C027Y','N'
                                                                             ,'0')) -- 현재
                                                                             ,'0S','PAST'
                                                                             ,'0N','NONE'
                                                                             ,'YN','오류'
                                                                             ,'0Y','CURRENT'
                                                                             ,'YY','CURRENT'
                                                                             ,'Y0','PAST'
                                                                             ,'YS','PAST'
                                                                             ,'')
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036')
       ) "DRINKYN"
     , (-- 음주시작연령
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T005',F.ACODE1
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021')
       ) "DRINK_STARTYEAR"
     , (-- 음주기간
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T006',F.ACODE1
                                                                      ,'3-1T',F.ACODE1
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('3-1','1021')
       ) "DRINK_YEAR"
     , (-- 음주횟수
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y',F.QCODENM--,'1'
                                                                      ,'10211022C029Y',F.QCODENM--,'2'
                                                                      ,'10211022C030Y',F.QCODENM--,'3'
                                                                      ,'10211022C031Y',F.QCODENM--,'4'
                                                                      ,'10211022C032Y',F.QCODENM--,'5'
                                                                      ,'10211022C033Y',F.QCODENM--,'6' -- 정밀
                                                                      ,'10361022C028Y',F.QCODENM--,'1'
                                                                      ,'10361022C029Y',F.QCODENM--,'2'
                                                                      ,'10361022C030Y',F.QCODENM--,'3'
                                                                      ,'10361022C031Y',F.QCODENM--,'4'
                                                                      ,'10361022C032Y',F.QCODENM--,'5'
                                                                      ,'10361022C033Y',F.QCODENM--,'6' -- 재진
                                                                      ,'3-2-1CY','1'
                                                                      ,'3-2-2CY','2'
                                                                      ,'3-2-3CY','3'
                                                                      ,'3-2-4CY','4'
                                                                      ,'3-2-5CY','5'
                                                                      ,'3-2-6CY','6'
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-2-1','3-2-2','3-2-3','3-2-4','3-2-5','3-2-6')
       ) "DRINK_NUM"
     , (-- 음주량
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211023C034Y',F.QCODENM--,'1'
                                                                      ,'10211023C035Y',F.QCODENM--,'2'
                                                                      ,'10211023C036Y',F.QCODENM--,'3'
                                                                      ,'10211023C037Y',F.QCODENM--,'4' -- 정밀
                                                                      ,'10361023C034Y',F.QCODENM--,'1'
                                                                      ,'10361023C035Y',F.QCODENM--,'2'
                                                                      ,'10361023C036Y',F.QCODENM--,'3'
                                                                      ,'10361023C037Y',F.QCODENM--,'4' -- 재진
                                                                      ,'3-2-1CY','1'
                                                                      ,'3-2-2CY','2'
                                                                      ,'3-2-3CY','3'
                                                                      ,'3-2-4CY','4'
                                                                      ,'3-2-5CY','5'
                                                                      ,'3-2-6CY','6'
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-2-1','3-2-2','3-2-3','3-2-4','3-2-5','3-2-6')
       ) "DRINK_AMT"
     , (-- 흡연여부
        SELECT /* INDEX(X SMQUESAT_PK)*/
         DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019C008Y','Y','0'))||  -- 과거
               MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10191020C008Y','Y'
                                                                            ,'1035C008Y','Y'
                                                                            ,'2-0-3CY','Y'
                                                                            ,'10191020A005Y','S'
                                                                            ,'1035C236Y','S'
                                                                            ,'2-0-2CY','S'
                                                                            ,'1019C026Y','N'
                                                                            ,'1035C026Y','N'
                                                                            ,'2-0-1CY','N'
                                                                            ,'0')) -- 현재
                                                                            ,'0S','PAST'-- PAST
                                                                            ,'0N','NEVER'-- NEVER
                                                                            ,'YN',''
                                                                            ,'0Y','CURRENT'-- CURRENT
                                                                            ,'YY','CURRENT'
                                                                            ,'Y0','PAST'
                                                                            ,'YS','PAST'
                                                                            ,'')
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1019','1035','2-0-1','2-0-2','2-0-3')
       ) "SMOKEYN"
     , (-- 흡연기간
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T003',F.ACODE1
                                                                      ,'2-2T',F.ACODE1
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('2-2','1019')
       ) "SMOKE_YEAR"
     , (-- 흡연시작나이
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T002',F.ACODE1
                                                                      ,'2-1T',F.ACODE1
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('2-1','1019')
       ) "SMOKE_START_YEAR"
     , (-- 흡연량
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T004',F.ACODE1||'개비'
                                                                      ,'1035T004',F.ACODE1||'개비'
                                                                      ,'1035T004Y',F.ACODE1||'개비'
                                                                      ,'2-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1019','1035','2-3-1','2-3-2','2-3-3','2-3-4')
       ) "SMOKE_AMT"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'9001A102YY','현재치료중'
                                                           ,'9001A102YN','과거치료'
                                                           ,'9001A102Y','치료받은적 없음'
--                                                           ,'6-1-1-1CY','치료받은적 없음'
--                                                           ,'6-1-1-2CY','과거치료'
--                                                           ,'6-1-1-3CY','현재치료중'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               )
       )  "Hx_고혈압"
--        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'9001A102YY','현재치료중'
--                                                           ,'9001A102YN','과거치료'
--                                                           ,'9001A102Y','치료받은적 없음'
----                                                           ,'6-1-1-1CY','치료받은적 없음'
----                                                           ,'6-1-1-2CY','과거치료'
----                                                           ,'6-1-1-3CY','현재치료중'
--                                                                ,''))
--          FROM SMQUESAT f
--         WHERE A.PATNO = f.PATNO
--           AND A.ORDDATE = F.ORDDATE
--           AND (F.QCODE1 LIKE '9001'
--               )
--       )  "Hx_고혈압"
  FROM (
SELECT A.PATNO, MIN(A.ORDDATE) ORDDATE
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20071201','YYYYMMDD') AND TO_DATE('20071205','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE IN('SM0200','SM0205')
              )
--  AND EXISTS (
--              SELECT 'Y'
--                FROM APPATSBT X
--               WHERE A.PATNO = X.PATNO
--                 AND X.AGREEYN1||X.AGREEYN2 = 'YY'
--             )
 GROUP BY A.PATNO
       ) A
     , STRESULT B
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND EXISTS (-- 건진처방 결과만 가져오기
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE B.PATNO = X.PATNO
                  AND B.ORDDATE = X.ORDDATE
                  AND B.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.ORDDATE, A.PATNO;
