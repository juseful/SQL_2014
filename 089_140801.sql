-- 최종
SELECT A.PATNO, A.ORDDATE
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , A.SEX, A.AGE
     , C.BIRTHDAY DOB
     , (-- 신문진 음주여부
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'3-0-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-0-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('3-0-1','3-0-2')
       ) "NEW_DRINKYN"
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
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y','1'
                                                                      ,'10211022C029Y','2'
                                                                      ,'10211022C030Y','3'
                                                                      ,'10211022C031Y','4'
                                                                      ,'10211022C032Y','5'
                                                                      ,'10211022C033Y','6' -- 정밀
                                                                      ,'10361022C028Y','1'
                                                                      ,'10361022C029Y','2'
                                                                      ,'10361022C030Y','3'
                                                                      ,'10361022C031Y','4'
                                                                      ,'10361022C032Y','5'
                                                                      ,'10361022C033Y','6' -- 재진
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
                                                                            ,'0S','2.PAST'--,'1'-- PAST
                                                                            ,'0N','1.NEVER'--'0'-- NEVER
                                                                            ,'YN',''
                                                                            ,'0Y','3.CURRENT'--'2'-- CURRENT
                                                                            ,'YY','3.CURRENT'--'2'
                                                                            ,'Y0','2.PAST'--'1'
                                                                            ,'YS','2.PAST'--'1'
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A102Y','Y'
                                                ,'6-1-1-1CY','Y'
                                                ,'6-1-1-2CY','Y'
                                                ,'6-1-1-3CY','Y'
                                                ,'6-1-1-4CY','Y'
                                                ,'6-1-1-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-1%'
               )
       )  "Hx_고혈압"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A105Y','Y'
                                                ,'6-1-2-1CY','Y'
                                                ,'6-1-2-2CY','Y'
                                                ,'6-1-2-3CY','Y'
                                                ,'6-1-2-4CY','Y'
                                                ,'6-1-2-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-2%'
               )
       )   "Hx_당뇨병"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A103Y','Y'
                                                ,'6-1-3-1CY','Y'
                                                ,'6-1-3-2CY','Y'
                                                ,'6-1-3-3CY','Y'
                                                ,'6-1-3-4CY','Y'
                                                ,'6-1-3-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-3%'
               )
       )   "Hx_고지혈증"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-4-1CY','Y'
                                                ,'6-1-4-2CY','Y'
                                                ,'6-1-4-3CY','Y'
                                                ,'6-1-4-4CY','Y'
                                                ,'6-1-4-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-4%'
               )
       )   "Hx_협심증"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-5-1CY','Y'
                                                ,'6-1-5-2CY','Y'
                                                ,'6-1-5-3CY','Y'
                                                ,'6-1-5-4CY','Y'
                                                ,'6-1-5-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-5%'
               )
       )   "Hx_심근경색"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A104Y','Y'
                                                ,'6-1-6-1CY','Y'
                                                ,'6-1-6-2CY','Y'
                                                ,'6-1-6-3CY','Y'
                                                ,'6-1-6-4CY','Y'
                                                ,'6-1-6-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-6%'
               )
       )   "Hx_뇌졸중/중풍"
     , MAX(DECODE(B.EXAMCODE,'BL3113',B.RSLTNUM,'')) "Cholesterol"
     , MAX(DECODE(B.EXAMCODE,'BL3118',B.RSLTNUM,'')) "Glucose(Fasting)"
     , MAX(DECODE(B.EXAMCODE,'BL3141',B.RSLTNUM,'')) "TG"
     , MAX(DECODE(B.EXAMCODE,'BL3142',B.RSLTNUM,'')) "HDL"
     , MAX(DECODE(B.EXAMCODE,'BL314201',B.RSLTNUM,'')) "LDL"
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,'')) "BMI"
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) DBP
     , MAX(DECODE(B.EXAMCODE,'SM053101',B.RSLTNUM,'')) "Rt.distall CCA:IMT"
     , MAX(DECODE(B.EXAMCODE,'SM053111',B.RSLTNUM,'')) "Lt.distall CCA:IMT"
     , MAX(DECODE(B.EXAMCODE,'SM055011',B.RSLTNUM,'')) "Stenotic IMT:RT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM055012',B.RSLTNUM,'')) "Stenotic Length:RT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM055013',B.RSLTNUM,'')) "Stenotic diameter:RT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM055021',B.RSLTNUM,'')) "Stenotic IMT:RT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM055022',B.RSLTNUM,'')) "Stenotic Length:RT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM055023',B.RSLTNUM,'')) "Stenotic diameter:RT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM055031',B.RSLTNUM,'')) "Stenotic IMT:RT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM055032',B.RSLTNUM,'')) "Stenotic Length:RT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM055033',B.RSLTNUM,'')) "Stenotic diameter:RT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM055041',B.RSLTNUM,'')) "Stenotic IMT:RT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM055042',B.RSLTNUM,'')) "Stenotic Length:RT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM055043',B.RSLTNUM,'')) "Stenotic diameter:RT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM055051',B.RSLTNUM,'')) "Stenotic IMT:RT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM055052',B.RSLTNUM,'')) "Stenotic Length:RT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM055053',B.RSLTNUM,'')) "Stenotic diameter:RT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM055061',B.RSLTNUM,'')) "Stenotic IMT:RT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM055062',B.RSLTNUM,'')) "Stenotic Length:RT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM055063',B.RSLTNUM,'')) "Stenotic diameter:RT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM055071',B.RSLTNUM,'')) "Stenotic IMT:RT VA"
     , MAX(DECODE(B.EXAMCODE,'SM055072',B.RSLTNUM,'')) "Stenotic Length:RT VA"
     , MAX(DECODE(B.EXAMCODE,'SM055073',B.RSLTNUM,'')) "Stenotic diameter:RT VA"
     , MAX(DECODE(B.EXAMCODE,'SM055081',B.RSLTNUM,'')) "Stenotic IMT:RT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM055082',B.RSLTNUM,'')) "Stenotic Length:RT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM055083',B.RSLTNUM,'')) "Stenotic diameter:RT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM055111',B.RSLTNUM,'')) "Stenotic IMT:LT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM055112',B.RSLTNUM,'')) "Stenotic Length:LT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM055113',B.RSLTNUM,'')) "Stenotic diameter:LT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM055121',B.RSLTNUM,'')) "Stenotic IMT:LT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM055122',B.RSLTNUM,'')) "Stenotic Length:LT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM055123',B.RSLTNUM,'')) "Stenotic diameter:LT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM055131',B.RSLTNUM,'')) "Stenotic IMT:LT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM055132',B.RSLTNUM,'')) "Stenotic Length:LT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM055133',B.RSLTNUM,'')) "Stenotic diameter:LT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM055141',B.RSLTNUM,'')) "Stenotic IMT:LT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM055142',B.RSLTNUM,'')) "Stenotic Length:LT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM055143',B.RSLTNUM,'')) "Stenotic diameter:LT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM055151',B.RSLTNUM,'')) "Stenotic IMT:LT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM055152',B.RSLTNUM,'')) "Stenotic Length:LT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM055153',B.RSLTNUM,'')) "Stenotic diameter:LT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM055161',B.RSLTNUM,'')) "Stenotic IMT:LT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM055162',B.RSLTNUM,'')) "Stenotic Length:LT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM055163',B.RSLTNUM,'')) "Stenotic diameter:LT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM055171',B.RSLTNUM,'')) "Stenotic IMT:LT VA"
     , MAX(DECODE(B.EXAMCODE,'SM055172',B.RSLTNUM,'')) "Stenotic Length:LT VA"
     , MAX(DECODE(B.EXAMCODE,'SM055173',B.RSLTNUM,'')) "Stenotic diameter:LT VA"
     , MAX(DECODE(B.EXAMCODE,'SM055181',B.RSLTNUM,'')) "Stenotic IMT:LT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM055182',B.RSLTNUM,'')) "Stenotic Length:LT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM055183',B.RSLTNUM,'')) "Stenotic diameter:LT SCA"
     , MAX(DECODE(B.EXAMCODE,'RS2010',TO_CHAR(B.RSLTTEXT),'')) "Carotid_US"
     , (
        SELECT 'Y'
          FROM SMRSLTCT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND X.EXAMCODE = 'RS2010'
           AND X.RSLTCODE = '102'
       ) RSLTCODE_102
     , (
        SELECT 'Y'
          FROM SMRSLTCT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND X.EXAMCODE = 'RS2010'
           AND X.RSLTCODE = '103'
       ) RSLTCODE_103
     , (
        SELECT 'Y'
          FROM SMRSLTCT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND X.EXAMCODE = 'RS2010'
           AND X.RSLTCODE = '104'
       ) RSLTCODE_104
     , (
        SELECT 'Y'
          FROM SMRSLTCT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND X.EXAMCODE = 'RS2010'
           AND X.RSLTCODE = '105'
       ) RSLTCODE_105
     , (
        SELECT 'Y'
          FROM SMRSLTCT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND X.EXAMCODE = 'RS2010'
           AND X.RSLTCODE = '113'
       ) RSLTCODE_113
     , (
        SELECT 'Y'
          FROM SMRSLTCT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND X.EXAMCODE = 'RS2010'
           AND X.RSLTCODE = '114'
       ) RSLTCODE_114
  FROM (
-- 전미랑 기본대상자
SELECT A.PATNO, A.ORDDATE, 성별찾기펑션(A.PATNO) SEX
     , 나이계산펑션(a.patno, a.orddate) age
  FROM SMRSV00T A, SMPKGMST B--, APPATSBT D
 WHERE A.ORDDATE BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
--   AND A.PATNO = D.PATNO
--   AND D.AGREEYN1||D.AGREEYN2 = 'YY' -- 연구 대상자
   AND EXISTS (-- STENOTIC LESION
               SELECT /*+ index(X STRESULT_PK) */
                      'Y'
                 FROM STRESULT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND NVL(X.MODIFYYN,'N') != 'Y'
                  AND X.EXAMCODE = 'SM0550'
                  AND X.RSLTNUM = 'Y'
              )
   AND EXISTS (-- 결과코드 해당자
               SELECT 'Y'
                 FROM SMRSLTCT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.EXAMCODE = 'RS2010'
                  AND X.RSLTCODE IN ('102','103','104','105','113','114')
              )
       ) A
     , STRESULT B
     , APPATBAT C
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
   AND A.PATNO = C.PATNO
 GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE, C.BIRTHDAY
