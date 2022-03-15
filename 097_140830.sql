SELECT A.*
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
                                                           ,'6-1-1-1CY','치료받은적 없음'
                                                           ,'6-1-1-2CY','과거치료'
                                                           ,'6-1-1-3CY','현재치료중'
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'9001A105YY','현재치료중'
                                                           ,'9001A105YN','과거치료'
                                                           ,'9001A105Y','치료받은적 없음'
                                                           ,'6-1-2-1CY','치료받은적 없음'
                                                           ,'6-1-2-2CY','과거치료'
                                                           ,'6-1-2-3CY','현재치료중'
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'9001A103YY','현재치료중'
                                                           ,'9001A103YN','과거치료'
                                                           ,'9001A103Y','치료받은적 없음'
                                                           ,'6-1-3-1CY','치료받은적 없음'
                                                           ,'6-1-3-2CY','과거치료'
                                                           ,'6-1-3-3CY','현재치료중'
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'9001A104YY','현재치료중'
                                                           ,'9001A104YN','과거치료'
                                                           ,'9001A104Y','치료받은적 없음'
                                                           ,'6-1-6-1CY','치료받은적 없음'
                                                           ,'6-1-6-2CY','과거치료'
                                                           ,'6-1-6-3CY','현재치료중'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-6%'
               )
       )   "Hx_뇌졸중/중풍"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'6-1-6-4CY','Y'
                                                           ,'6-1-6-5CY','N'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-6%'
               )
       )   "Hx_뇌졸중/중풍_OPYN"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'6-1-4-1CY','치료받은적 없음'
                                                           ,'6-1-4-2CY','과거치료'
                                                           ,'6-1-4-3CY','현재치료중'
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'6-1-4-4CY','Y'
                                                           ,'6-1-4-5CY','N'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-4%'
               )
       )   "Hx_협심증_OPYN"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'6-1-5-1CY','치료받은적 없음'
                                                           ,'6-1-5-2CY','과거치료'
                                                           ,'6-1-5-3CY','현재치료중'
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
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'6-1-5-4CY','Y'
                                                           ,'6-1-5-5CY','N'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-5%'
               )
       )   "Hx_심근경색_OPYN"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN||F.ACODE1,'9001A106YY','현재치료중'
                                                           ,'9001A106YN','과거치료'
                                                           ,'9001A106Y','치료받은적 없음'
                                                           ,'Y',''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '9001'
       ) "Hx_협심증/심근경색"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'7-1-1-1CY','현재치료중'
                                                 ,'7-1-1-2CY','과거치료'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-1%'
               )
       ) "PH_혈압"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A152Y','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               )
       ) "PH_혈압_구"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'7-1-2-1CY','현재치료중'
                                                 ,'7-1-2-2CY','과거치료'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-2%'
               )
       ) "PH_당뇨"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A153Y','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               )
       ) "PH_당뇨_구"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-3-1CY','현재치료중'
                                                ,'7-1-3-2CY','과거치료'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-3%'
               )
       ) "PH_고지혈증"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'7-1-4-1CY','현재치료중'
                                                 ,'7-1-4-2CY','과거치료'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-4%'
               )
       ) "PH_아스피린"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A150Y','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-4%'
               )
       ) "PH_아스피린_구"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-5-1CY','현재치료중'
                                                ,'7-1-5-2CY','과거치료'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-5%'
               )
       ) "PH_와파린"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-6-1CY','현재치료중'
                                                ,'7-1-6-2CY','과거치료'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-6%'
               )
       )  "PH_기타혈전방지제"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A304Y',F.ACODE3
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9002'
               OR
                F.QCODE1 LIKE '7-1-4%'
               )
       ) "PH_기타약제"
  FROM (
        SELECT A.PATNO, A.PATNAME, A.EXECDATE, A.ORDDATE
          FROM (
                -- 대상자 기본 테이블, DEV 서버임.
                SELECT A.*, B.ORDDATE, ROUND(MONTHS_BETWEEN(A.EXECDATE,B.ORDDATE)/12,1) GAP
                     , ABS(ROUND(MONTHS_BETWEEN(A.EXECDATE,B.ORDDATE)/12,1)) RANK -- 시행일자와 가장 가까운 차이 구하기
                     , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY ABS(ROUND(MONTHS_BETWEEN(A.EXECDATE,B.ORDDATE)/12,1)), B.ORDDATE /* 가장 가까운 기간이므로 GAP이 같다면 빠른 날짜가 먼저 와야 함*/) RN -- 순번 매기기
                  FROM JYWSYBPT@DL_SDEV9_S A, SMRSV00T B, SMPKGMST C
                 WHERE A.PATNO = B.PATNO
                   AND B.ORDDATE IS NOT NULL
                   AND B.CANCELTIME IS NULL
                   AND B.PKGCODE = C.PKGCODE
                   AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) A
         WHERE A.RN = '1'
       ) A
