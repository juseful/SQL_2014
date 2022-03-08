-- 횡단연구최종
SELECT A.PATNO, A.ORDDATE
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , (SELECT X.SEX FROM APPATBAT X WHERE A.PATNO = X.PATNO)  SEX
     , (SELECT TRUNC(MONTHS_BETWEEN(A.ORDDATE,X.BIRTHDAY)/12) FROM APPATBAT X WHERE A.PATNO = X.PATNO) AGE
     , MAX(DECODE(B.EXAMCODE,'SM0101',B.RSLTNUM,''))     "height"
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,''))     "weight"
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,''))   "bmi"
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
                                                                            ,'0S','1'--PAST
                                                                            ,'0N','0'--NONE
                                                                            ,'YN',''--ERROR
                                                                            ,'0Y','2'--CURRENT
                                                                            ,'YY','2'--CURRENT
                                                                            ,'Y0','1'--PAST
                                                                            ,'YS','1'--PAST
                                                                            ,'')
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1019','1035','2-0-1','2-0-2','2-0-3')
       ) "SMOKEYN"
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
                                                                             ,'YN',''
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
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y',F.QCODENM
                                                                      ,'10211022C029Y',F.QCODENM
                                                                      ,'10211022C030Y',F.QCODENM
                                                                      ,'10211022C031Y',F.QCODENM
                                                                      ,'10211022C032Y',F.QCODENM
                                                                      ,'10211022C033Y',F.QCODENM -- 정밀
                                                                      ,'10361022C028Y',F.QCODENM
                                                                      ,'10361022C029Y',F.QCODENM
                                                                      ,'10361022C030Y',F.QCODENM
                                                                      ,'10361022C031Y',F.QCODENM
                                                                      ,'10361022C032Y',F.QCODENM
                                                                      ,'10361022C033Y',F.QCODENM -- 재진
                                                                      ,'3-2-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-6CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-2-1','3-2-2','3-2-3','3-2-4','3-2-5','3-2-6')
       ) "DRINK_NUM"
     , (-- 음주량
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211023C034Y',F.QCODENM
                                                                      ,'10211023C035Y',F.QCODENM
                                                                      ,'10211023C036Y',F.QCODENM
                                                                      ,'10211022C037Y',F.QCODENM -- 정밀
                                                                      ,'10361023C034Y',F.QCODENM
                                                                      ,'10361023C035Y',F.QCODENM
                                                                      ,'10361023C036Y',F.QCODENM
                                                                      ,'10361022C037Y',F.QCODENM -- 재진
                                                                      ,'3-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-3-1','3-3-2','3-3-3','3-3-4')
       ) "DRINK_AMT"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-1CY','Y'
                                                ,'8-1-1-2CY','Y'
                                                ,'8-1-1-3CY','Y'
                                                ,'8-1-1-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-1%'
       )       "위암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
       MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-1%'
       )  "위암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-1CY','Y'
                                                ,'8-1-2-2CY','Y'
                                                ,'8-1-2-3CY','Y'
                                                ,'8-1-2-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-2%'
       )  "폐암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-%'
       ) "폐암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-1CY','Y'
                                                ,'8-1-3-2CY','Y'
                                                ,'8-1-3-3CY','Y'
                                                ,'8-1-3-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-3%'
       )  "간암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-%'
       ) "간암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-1CY','Y'
                                                ,'8-1-4-2CY','Y'
                                                ,'8-1-4-3CY','Y'
                                                ,'8-1-4-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-4%'
       )  "대장암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-4%'
       ) "대장암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-1CY','Y'
                                                ,'8-1-5-2CY','Y'
                                                ,'8-1-5-3CY','Y'
                                                ,'8-1-5-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-5%'
       )  "유방암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-5%'
       ) "유방암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-1CY','Y'
                                                ,'8-1-6-2CY','Y'
                                                ,'8-1-6-3CY','Y'
                                                ,'8-1-6-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-6%'
       )  "자궁경부암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-6%'
       ) "자궁경부암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-1CY','Y'
                                                ,'8-1-7-2CY','Y'
                                                ,'8-1-7-3CY','Y'
                                                ,'8-1-7-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-7%'
       )  "갑상선암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-7%'
       ) "갑상선암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-1CY','Y'
                                                ,'8-1-8-2CY','Y'
                                                ,'8-1-8-3CY','Y'
                                                ,'8-1-8-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-8%'
       )  "방광암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-8%'
       ) "방광암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-1CY','Y'
                                                ,'8-1-9-2CY','Y'
                                                ,'8-1-9-3CY','Y'
                                                ,'8-1-9-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-9%'
       )  "식도암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-9%'
       ) "식도암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-1CY','Y'
                                                ,'8-1-10-2CY','Y'
                                                ,'8-1-10-3CY','Y'
                                                ,'8-1-10-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-10%'
       )  "담낭암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-10%'
       ) "담낭암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-1CY','Y'
                                                ,'8-1-11-2CY','Y'
                                                ,'8-1-11-3CY','Y'
                                                ,'8-1-11-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-11%'
       )  "난소암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-11%'
       ) "난소암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-1CY','Y'
                                                ,'8-1-12-2CY','Y'
                                                ,'8-1-12-3CY','Y'
                                                ,'8-1-12-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-12%'
       )  "전립선암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-12%'
       ) "전립선암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-1CY','Y'
                                                ,'8-1-13-2CY','Y'
                                                ,'8-1-13-3CY','Y'
                                                ,'8-1-13-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-13%'
       )  "췌장암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-13%'
       ) "췌장암_진단나이"
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A101Y','Y',''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '9001'
       ) "Hx_천식/알레르기(구)"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-15-1CY','Y'
                                                ,'6-1-15-2CY','Y'
                                                ,'6-1-15-3CY','Y'
                                                ,'6-1-15-4CY','Y'
                                                ,'6-1-15-5CY','Y'
                                                                 ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-15%'
               )
       )   "Hx_천식(신)"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A118Y','Y',''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '9001'
       )   "Hx_갑상선질환(구)"

-- 이건 종단연구용임….. 5년에 가장 가까운 F/U 건진일자 찾기!!
-- 정지영, 2번안… 07~08 모든 TFT, BMD 기본 자료와 이후 F/U 자료
-- 기본대상자
SELECT A.PATNO, A.ORDDATE, A.FSTDATE, A.SNDDATE
     , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY A.ORDDATE) RN
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , (SELECT X.SEX FROM APPATBAT X WHERE A.PATNO = X.PATNO)  SEX
     , (SELECT TRUNC(MONTHS_BETWEEN(A.ORDDATE,X.BIRTHDAY)/12) FROM APPATBAT X WHERE A.PATNO = X.PATNO) AGE
     , MAX(DECODE(B.EXAMCODE,'SM0101',B.RSLTNUM,''))     "height"
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,''))     "weight"
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,''))   "bmi"
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
                                                                            ,'0S','1'--PAST
                                                                            ,'0N','0'--NONE
                                                                            ,'YN',''--ERROR
                                                                            ,'0Y','2'--CURRENT
                                                                            ,'YY','2'--CURRENT
                                                                            ,'Y0','1'--PAST
                                                                            ,'YS','1'--PAST
                                                                            ,'')
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1019','1035','2-0-1','2-0-2','2-0-3')
       ) "SMOKEYN"
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
                                                                             ,'YN',''
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
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y',F.QCODENM
                                                                      ,'10211022C029Y',F.QCODENM
                                                                      ,'10211022C030Y',F.QCODENM
                                                                      ,'10211022C031Y',F.QCODENM
                                                                      ,'10211022C032Y',F.QCODENM
                                                                      ,'10211022C033Y',F.QCODENM -- 정밀
                                                                      ,'10361022C028Y',F.QCODENM
                                                                      ,'10361022C029Y',F.QCODENM
                                                                      ,'10361022C030Y',F.QCODENM
                                                                      ,'10361022C031Y',F.QCODENM
                                                                      ,'10361022C032Y',F.QCODENM
                                                                      ,'10361022C033Y',F.QCODENM -- 재진
                                                                      ,'3-2-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-6CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-2-1','3-2-2','3-2-3','3-2-4','3-2-5','3-2-6')
       ) "DRINK_NUM"
     , (-- 음주량
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211023C034Y',F.QCODENM
                                                                      ,'10211023C035Y',F.QCODENM
                                                                      ,'10211023C036Y',F.QCODENM
                                                                      ,'10211022C037Y',F.QCODENM -- 정밀
                                                                      ,'10361023C034Y',F.QCODENM
                                                                      ,'10361023C035Y',F.QCODENM
                                                                      ,'10361023C036Y',F.QCODENM
                                                                      ,'10361022C037Y',F.QCODENM -- 재진
                                                                      ,'3-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-3-1','3-3-2','3-3-3','3-3-4')
       ) "DRINK_AMT"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-1CY','Y'
                                                ,'8-1-1-2CY','Y'
                                                ,'8-1-1-3CY','Y'
                                                ,'8-1-1-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-1%'
       )       "위암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
       MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-1%'
       )  "위암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-1CY','Y'
                                                ,'8-1-2-2CY','Y'
                                                ,'8-1-2-3CY','Y'
                                                ,'8-1-2-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-2%'
       )  "폐암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-%'
       ) "폐암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-1CY','Y'
                                                ,'8-1-3-2CY','Y'
                                                ,'8-1-3-3CY','Y'
                                                ,'8-1-3-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-3%'
       )  "간암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-%'
       ) "간암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-1CY','Y'
                                                ,'8-1-4-2CY','Y'
                                                ,'8-1-4-3CY','Y'
                                                ,'8-1-4-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-4%'
       )  "대장암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-4%'
       ) "대장암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-1CY','Y'
                                                ,'8-1-5-2CY','Y'
                                                ,'8-1-5-3CY','Y'
                                                ,'8-1-5-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-5%'
       )  "유방암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-5%'
       ) "유방암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-1CY','Y'
                                                ,'8-1-6-2CY','Y'
                                                ,'8-1-6-3CY','Y'
                                                ,'8-1-6-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-6%'
       )  "자궁경부암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-6%'
       ) "자궁경부암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-1CY','Y'
                                                ,'8-1-7-2CY','Y'
                                                ,'8-1-7-3CY','Y'
                                                ,'8-1-7-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-7%'
       )  "갑상선암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-7%'
       ) "갑상선암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-1CY','Y'
                                                ,'8-1-8-2CY','Y'
                                                ,'8-1-8-3CY','Y'
                                                ,'8-1-8-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-8%'
       )  "방광암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-8%'
       ) "방광암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-1CY','Y'
                                                ,'8-1-9-2CY','Y'
                                                ,'8-1-9-3CY','Y'
                                                ,'8-1-9-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-9%'
       )  "식도암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-9%'
       ) "식도암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-1CY','Y'
                                                ,'8-1-10-2CY','Y'
                                                ,'8-1-10-3CY','Y'
                                                ,'8-1-10-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-10%'
       )  "담낭암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-10%'
       ) "담낭암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-1CY','Y'
                                                ,'8-1-11-2CY','Y'
                                                ,'8-1-11-3CY','Y'
                                                ,'8-1-11-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-11%'
       )  "난소암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-11%'
       ) "난소암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-1CY','Y'
                                                ,'8-1-12-2CY','Y'
                                                ,'8-1-12-3CY','Y'
                                                ,'8-1-12-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-12%'
       )  "전립선암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-12%'
       ) "전립선암_진단나이"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-1CY','Y'
                                                ,'8-1-13-2CY','Y'
                                                ,'8-1-13-3CY','Y'
                                                ,'8-1-13-4CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-13%'
       )  "췌장암"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-5T',F.ACODE1,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '8-1-13%'
       ) "췌장암_진단나이"
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A101Y','Y',''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '9001'
       ) "Hx_천식/알레르기(구)"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-15-1CY','Y'
                                                ,'6-1-15-2CY','Y'
                                                ,'6-1-15-3CY','Y'
                                                ,'6-1-15-4CY','Y'
                                                ,'6-1-15-5CY','Y'
                                                                 ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-15%'
               )
       )   "Hx_천식(신)"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A118Y','Y',''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '9001'
       )   "Hx_갑상선질환(구)"

     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-18-1CY','Y'
                                                ,'6-1-18-2CY','Y'
                                                ,'6-1-18-3CY','Y'
                                                ,'6-1-18-4CY','Y'
                                                ,'6-1-18-5CY','Y'
                                                                 ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-18%'
               )
       )   "Hx_갑상선기능저하및항진증(신)"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-19-1CY','Y'
                                                ,'6-1-19-2CY','Y'
                                                ,'6-1-19-3CY','Y'
                                                ,'6-1-19-4CY','Y'
                                                ,'6-1-19-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-19%'
               )
       )   "Hx_갑상선결절및낭종(신)"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-12-1CY','Y'
                                                ,'7-1-12-2CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '7-1-12%'
       ) "PH_갑상선치료"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-13-1CY','Y'
                                                ,'7-1-13-2CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '7-1-13%'
       ) "PH_골다공증"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-14-1CY','Y'
                                                ,'7-1-14-2CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '7-1-14%'
       ) "PH_여성호르몬"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A160Y','Y'
                                                ,'7-1-16-1CY','Y'
                                                ,'7-1-16-2CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-16%'
               )
       ) "PH_칼슘"
     , (
        SELECT MAX(ORDDATE)
          FROM MMMEDORT X
         WHERE A.PATNO = X.PATNO
           AND X.ORDDATE BETWEEN A.FSTDATE AND A.SNDDATE
           AND X.ORDCODE IN (
                             'PDS5'
                            ,'PDS2'
                            ,'PDS1'
                            ,'PD'
                            ,'PD-S'
                            ,'DEXA'
                            ,'DEFL'
                            ,'FC'
                            ,'MPD'
                            ,'HCS'
                            ,'XTA'
                            )
           AND NVL(X.DCYN,'X') = 'N'
       ) "PH_STEROIDS"
     , (-- 폐경여부
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5007C008Y' ,'1'--예
                                                  ,'5007C009Y' ,'0'--아니오
                                                  ,'5007C201Y' ,'0'--있다,없다 함
                                                  ,'5007C202Y' ,'0'--아니오,전과같이나옴
                                                  ,'21-0-1CY'  ,'1'--예
                                                  ,'21-0-2CY'  ,'0'--아니오
                                                  ,'21-0-3CY'  ,'0'--있다,없다함
                                                  ,'21-0-4CY'  ,'0'--아니오,전과같이나옴
                                                  ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '5007'
               OR
                F.QCODE1 LIKE '21-0%'
               )
       ) "MENOPAUSEYN"
     , (-- 폐경원인
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075008C203Y','1'
                                                           ,'50075008C204Y','2,3'
                                                           ,'50075008C205Y','4'
                                                           ,'50075008C206Y','5'
                                                           ,'50075008C038Y','기타'
                                                           ,'21-2-1CY'  ,'1'
                                                           ,'21-2-2CY'  ,'2'
                                                           ,'21-2-3CY'  ,'3'
                                                           ,'21-2-4CY'  ,'4'
                                                           ,'21-2-5CY'  ,'5'
                                                           ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '5007%'
               OR
                F.QCODE1 LIKE '21-2%'
               )
       ) "MENOPAUSE_CAUSE"
     , MAX(DECODE(B.EXAMCODE,'BL2011',B.RSLTNUM,''))     "wbc"
     , MAX(DECODE(B.EXAMCODE,'BL2013',B.RSLTNUM,''))     "hb"
     , MAX(DECODE(B.EXAMCODE,'BL2016',B.RSLTNUM,''))     "platelet"
     , MAX(DECODE(B.EXAMCODE,'BL3119',B.RSLTNUM,''))     "BUN"
     , MAX(DECODE(B.EXAMCODE,'BL3120',B.RSLTNUM,''))     "Creatinine"
     , MAX(DECODE(B.EXAMCODE,'BL3115',B.RSLTNUM,''))     "AST"
     , MAX(DECODE(B.EXAMCODE,'BL3116',B.RSLTNUM,''))     "ALT"
     , MAX(DECODE(B.EXAMCODE,'BL3113',B.RSLTNUM,''))     "T-cholesterol"
     , MAX(DECODE(B.EXAMCODE,'BL3141',B.RSLTNUM,''))     "TG"
     , MAX(DECODE(B.EXAMCODE,'BL314201',B.RSLTNUM,''))   "LDL"
     , MAX(DECODE(B.EXAMCODE,'BL3142',B.RSLTNUM,''))     "HDL"
     , MAX(DECODE(B.EXAMCODE,'BL3122',B.RSLTNUM,''))     "Ca"
     , MAX(DECODE(B.EXAMCODE,'BL3118',B.RSLTNUM,''))     "FBS"
     , MAX(DECODE(B.EXAMCODE,'NR4103',B.RSLTNUM,''))     "TSH"
     , MAX(DECODE(B.EXAMCODE,'NR4303',B.RSLTNUM,''))     "Free_T4"
     , MAX(DECODE(B.EXAMCODE,'NR4101',B.RSLTNUM,''))     "T3 RIA"
     , MAX(DECODE(B.EXAMCODE,'NR4202',B.RSLTNUM,''))     "Microsomal Ab"
     , MAX(DECODE(B.EXAMCODE,'RG9214', TRIM(substr(TO_CHAR(B.RSLTTEXT),INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,1),1) +1,INSTR(TO_CHAR(B.RSLTTEXT),')', INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,1) ,1 )-INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,1),1)-1)))) l_spine
     , MAX(DECODE(B.EXAMCODE,'RG9214', TRIM(substr(TO_CHAR(B.RSLTTEXT),INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,1),2) +1,INSTR(TO_CHAR(B.RSLTTEXT),')', INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,1) ,2 )-INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,1),2)-1)))) l_spine_t
     , MAX(DECODE(B.EXAMCODE,'RG9214', TRIM(substr(TO_CHAR(B.RSLTTEXT),INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,2),1) +1,INSTR(TO_CHAR(B.RSLTTEXT),')', INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,2) ,1 )-INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,2),1)-1)))) femur_neck
     , MAX(DECODE(B.EXAMCODE,'RG9214', TRIM(substr(TO_CHAR(B.RSLTTEXT),INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,2),2) +1,INSTR(TO_CHAR(B.RSLTTEXT),')', INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,2) ,2 )-INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,2),2)-1)))) femur_neck_t
     , MAX(DECODE(B.EXAMCODE,'RG9214', TRIM(substr(TO_CHAR(B.RSLTTEXT),INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,3),1) +1,INSTR(TO_CHAR(B.RSLTTEXT),')', INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,3) ,1 )-INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,3),1)-1)))) femur_total
     , MAX(DECODE(B.EXAMCODE,'RG9214', TRIM(substr(TO_CHAR(B.RSLTTEXT),INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,3),2) +1,INSTR(TO_CHAR(B.RSLTTEXT),')', INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,3) ,2 )-INSTR(TO_CHAR(B.RSLTTEXT),'(',INSTR(TO_CHAR(B.RSLTTEXT), 'BMD',1,3),2)-1)))) femur_total_t
     , MAX(DECODE(B.EXAMCODE,'RG9214', to_char(B.RSLTTEXT), '')) bmd
  FROM (
/* 1번째 건진일자 찾기!! */
SELECT A.PATNO, A.FSTDATE ORDDATE, A.FSTDATE, A.ORDDATE SNDDATE
  FROM (
SELECT A.PATNO, A.FSTDATE, A.SNDDATE ORDDATE, ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1) GAP -- 건진 기간
     , ABS(5 - ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1)) RANK -- 5년에서 가장 가까운 차이 구하기
     , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY ABS(5 - ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1)), A.SNDDATE /*5년에 가장 가까운 기간이므로 GAP이 같다면 빠른 날짜가 먼저 와야 함*/) RN -- 순번 매기기
  FROM (
        SELECT A.*, B.ORDDATE SNDDATE
          FROM (
                SELECT A.PATNO, MIN(A.ORDDATE) FSTDATE
                  FROM SMRSV00T A, SMPKGMST B
                 WHERE
--                       A.PATNO = ''
--                   AND
                       A.ORDDATE BETWEEN TO_DATE('20070101','YYYYMMDD') AND TO_DATE('20081231','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = B.PKGCODE
                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4103' --TSH
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4303' --FREE T4
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4101' --T3
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'RG9214' --BMD
                              )
                 GROUP BY A.PATNO
               ) A
             , SMRSV00T B
             , SMPKGMST C
         WHERE A.PATNO = B.PATNO
           AND A.FSTDATE < B.ORDDATE
           AND B.PKGCODE = C.PKGCODE
           AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
 WHERE EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'NR4103' --TSH
              )
   AND EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'NR4303' --FREE T4
              )
   AND EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'NR4101' --T3
              )
   AND EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'RG9214' --BMD
              )
   AND ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1) > '2.9'-- 3년 이상이므로...
       ) A
 WHERE A.RN = '1'
UNION ALL
/* 2번째 건진일자 찾기!! */
SELECT A.PATNO, A.ORDDATE, A.FSTDATE, A.ORDDATE SNDDATE
  FROM (
SELECT A.PATNO, A.FSTDATE, A.SNDDATE ORDDATE, ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1) GAP -- 건진 기간
     , ABS(5 - ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1)) RANK -- 5년에서 가장 가까운 차이 구하기
     , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY ABS(5 - ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1)), A.SNDDATE /*5년에 가장 가까운 기간이므로 GAP이 같다면 빠른 날짜가 먼저 와야 함*/) RN -- 순번 매기기
  FROM (
        SELECT A.*, B.ORDDATE SNDDATE
          FROM (
                SELECT A.PATNO, MIN(A.ORDDATE) FSTDATE
                  FROM SMRSV00T A, SMPKGMST B
                 WHERE
--                       A.PATNO = ''
--                   AND
                       A.ORDDATE BETWEEN TO_DATE('20070101','YYYYMMDD') AND TO_DATE('20081231','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = B.PKGCODE
                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4103' --TSH
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4303' --FREE T4
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4101' --T3
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'RG9214' --BMD
                              )
                 GROUP BY A.PATNO
               ) A
             , SMRSV00T B
             , SMPKGMST C
         WHERE A.PATNO = B.PATNO
           AND A.FSTDATE < B.ORDDATE
           AND B.PKGCODE = C.PKGCODE
           AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
 WHERE EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'NR4103' --TSH
              )
   AND EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'NR4303' --FREE T4
              )
   AND EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'NR4101' --T3
              )
   AND EXISTS (
               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.SNDDATE = X.ORDDATE
                  AND X.PATFG = 'G'
                  AND X.ORDCODE = 'RG9214' --BMD
              )
   AND ROUND(MONTHS_BETWEEN(A.SNDDATE,A.FSTDATE)/12,1) > '2.9'-- 3년 이상이므로...
       ) A
 WHERE A.RN = '1'
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
 GROUP BY A.PATNO, A.ORDDATE, A.FSTDATE, A.SNDDATE
