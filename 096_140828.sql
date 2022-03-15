SELECT A.PATNO, A.ORDDATE
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , A.SEX, A.AGE
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) DBP
     , MAX(DECODE(B.EXAMCODE,'SM0101',B.RSLTNUM,''))     "height"
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,''))     "weight"
     , MAX(DECODE(B.EXAMCODE,'SM0661',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) "PWV_N_Right"
     , MAX(DECODE(B.EXAMCODE,'SM0661',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) "PWV_N_Left"
     , MAX(DECODE(B.EXAMCODE,'SM066101',TO_CHAR(B.RSLTTEXT),'')) "PWV_T"
     , MAX(DECODE(B.EXAMCODE,'SM0662',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) "ABI_N_Right"
     , MAX(DECODE(B.EXAMCODE,'SM0662',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) "ABI_N_Left"
     , MAX(DECODE(B.EXAMCODE,'SM066201',TO_CHAR(B.RSLTTEXT),'')) "ABI_T"
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                                             ,'9-1-1-1CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_부"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                                             ,'9-1-1-2CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_모"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                                             ,'9-1-1-3CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_형제"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                                             ,'9-1-1-4CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_자녀"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                                             ,'9-1-1-5CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_친조부"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                                             ,'9-1-1-6CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_친조모"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                                             ,'9-1-1-7CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_외조부"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                                             ,'9-1-1-8CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "고혈압_외조모"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                                             ,'9-1-2-1CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_부"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                                             ,'9-1-2-2CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_모"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                                             ,'9-1-2-3CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_형제"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                                             ,'9-1-2-4CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_자녀"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                                             ,'9-1-2-5CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_친조부"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                                             ,'9-1-2-6CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_친조모"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                                             ,'9-1-2-7CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_외조부"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                                             ,'9-1-2-8CY','Y'   ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9003'
               OR
                F.QCODE1 LIKE '9-1-%'
               )
       ) "당뇨병_외조모"
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
     , (-- 음주횟수
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211023C034Y',G.QCODENM
                                                                      ,'10211023C035Y',G.QCODENM
                                                                      ,'10211023C036Y',G.QCODENM
                                                                      ,'10211023C037Y',G.QCODENM
                                                                      ,'10361023C034Y',G.QCODENM
                                                                      ,'10361023C035Y',G.QCODENM
                                                                      ,'10361023C036Y',G.QCODENM
                                                                      ,'10361023C037Y',G.QCODENM
                                                                      ,'3-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f, SMQUESMT G
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 IN ('1021','1036','3-3-1','3-3-2','3-3-3','3-3-4')
           AND F.ANSCODE = G.QCODE(+)
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
     , (-- 신문진 운동여부
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-0-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'5-0-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'5-0-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'5-0-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '5-0-%'
       ) "NEW_EXEC_YN"
     , (-- 신문진 운동횟수
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-1-1CY',SUBSTR(F.QCODENM,3) -- 신문진 운동횟수구분 '없다'
                                                                      ,'5-1-2CY',SUBSTR(F.QCODENM,3) -- 신문진 운동횟수구분
                                                                      ,'5-1-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'5-1-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '5-1-%'
       ) "NEW_EXEC_AMT"
     , (-- 신문진 운동시간
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-2-1CY',SUBSTR(F.QCODENM,3) -- 신문진 운동횟수구분 '없다'
                                                                      ,'5-2-2CY',SUBSTR(F.QCODENM,3) -- 신문진 운동횟수구분
                                                                      ,'5-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'5-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'5-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '5-2-%'
       ) "NEW_EXEC_TIME"
  FROM (
SELECT A.ORDDATE, A.PATNO
     , 성별찾기펑션(A.PATNO) SEX
     , 나이계산펑션(a.patno, a.orddate) age
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.ORDCODE = 'SM0660'
                  AND X.PATFG = 'G'
                  AND X.PROCSTAT > 'C'
              )
       ) A
     , STRESULT B
 WHERE A.SEX = 'M'
   AND A.AGE BETWEEN 40 AND 69
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE B.PATNO = X.PATNO
                  AND B.ORDDATE = B.ORDDATE
                  AND B.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE
