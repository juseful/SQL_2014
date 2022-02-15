-- 대상자
SELECT A.PATNO, A.ORDDATE, A.COMPOS
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('19950101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP = '3A'
   AND B.PKGCODE NOT LIKE 'S%1' -- 거래선 VIP 제외
   AND A.COMPOS NOT LIKE '%거래선%' -- 거래선 VIP 제외
 ORDER BY 1,2

SELECT *
  FROM JYTEMPTT;

INSERT INTO JYTEMPTT
-- 대상자
SELECT A.PATNO, A.ORDDATE, A.COMPOS
  FROM SMRSV00T@SMCS_SMCS_STDS A, SMPKGMST@SMCS_SMCS_STDS B
 WHERE A.ORDDATE BETWEEN TO_DATE('19950101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP = '3A'
   AND B.PKGCODE NOT LIKE 'S%1' -- 거래선 VIP 제외
   AND A.COMPOS NOT LIKE '%거래선%' -- 거래선 VIP 제외
 ORDER BY 1,2

-- 기본정보, 검사결과
SELECT CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       END PATNO2
     , A.PATNO, C.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12) AGE, A.ORDDATE, A.COMPOS
     , MAX(DECODE(B.EXAMCODE,'BL3140',B.RSLTNUM,'')) CRP
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,'')) WEIGHT
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,'')) BMI
     , MAX(DECODE(B.EXAMCODE,'SM0112',B.RSLTNUM,'')) "AB_FAT%"
     , MAX(DECODE(B.EXAMCODE,'BL2011',B.RSLTNUM,'')) WBC
     , MAX(DECODE(B.EXAMCODE,'BL2021',B.RSLTNUM,'')) ESR
     , MAX(DECODE(B.EXAMCODE,'BL3125',B.RSLTNUM,'')) GGT
  FROM JYTEMPTT@DL_SDEV9_S A, STRESULT B, APPATBAT C
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND A.PATNO = C.PATNO
 GROUP BY A.PATNO, C.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12), A.ORDDATE, A.COMPOS

-- 문진결과
SELECT A.PATNO, A.ORDDATE, A.COMPOS
      , DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019C008Y','Y','0'))||  -- 과거
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
                                                                            ,'0S','PAST'
                                                                            ,'0N','NONE'
                                                                            ,'YN','오류'
                                                                            ,'0Y','CURRENT'
                                                                            ,'YY','CURRENT'
                                                                            ,'Y0','PAST'
                                                                            ,'YS','PAST'
                                                                            ,'')                                        SMOKEYN        -- 흡연여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T003',F.ACODE1
                                                                      ,'2-2T',F.ACODE1
                                                                      ,''))                                             SMOKE_YEAR     -- 흡연기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T004',F.ACODE1||'개비'
                                                                      ,'1035T004',F.ACODE1||'개비'
                                                                      ,'1035T004Y',F.ACODE1||'개비'
                                                                      ,'2-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             SMOKE_AMT      -- 흡연량
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'3-0-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-0-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             DRINKYN    -- 신문진_음주여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T006',F.ACODE1
                                                                      ,'3-1T',F.ACODE1
                                                                      ,''))                                             DRINK_YEAR     -- 음주기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C029Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C030Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C031Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C032Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C033Y',SUBSTR(F.QCODENM,3)--F.QCODENM -- 정밀
                                                                      ,'10361022C028Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C029Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C030Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C031Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C032Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C033Y',SUBSTR(F.QCODENM,3)--F.QCODENM -- 재진
                                                                      ,'3-2-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-6CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             DRINK_NUM      -- 음주횟수
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211023C034Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211023C035Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211023C036Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211023C037Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C034Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C035Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C036Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C037Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'3-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             DRINK_AMT      -- 음주량
       , MAX(DECODE(F.QCODE1,'24-1-1',F.CHECKYN,''))  "24-1-1"
       , MAX(DECODE(F.QCODE1,'24-1-2',F.CHECKYN,''))  "24-1-2"
       , MAX(DECODE(F.QCODE1,'24-1-3',F.CHECKYN,''))  "24-1-3"
       , MAX(DECODE(F.QCODE1,'24-1-4',F.CHECKYN,''))  "24-1-4"
       , MAX(DECODE(F.QCODE1,'24-2-1',F.CHECKYN,''))  "24-2-1"
       , MAX(DECODE(F.QCODE1,'24-2-2',F.CHECKYN,''))  "24-2-2"
       , MAX(DECODE(F.QCODE1,'24-2-3',F.CHECKYN,''))  "24-2-3"
       , MAX(DECODE(F.QCODE1,'24-2-4',F.CHECKYN,''))  "24-2-4"
       , MAX(DECODE(F.QCODE1,'24-3-1',F.CHECKYN,''))  "24-3-1"
       , MAX(DECODE(F.QCODE1,'24-3-2',F.CHECKYN,''))  "24-3-2"
       , MAX(DECODE(F.QCODE1,'24-3-3',F.CHECKYN,''))  "24-3-3"
       , MAX(DECODE(F.QCODE1,'24-3-4',F.CHECKYN,''))  "24-3-4"
       , MAX(DECODE(F.QCODE1,'24-4-1',F.CHECKYN,''))  "24-4-1"
       , MAX(DECODE(F.QCODE1,'24-4-2',F.CHECKYN,''))  "24-4-2"
       , MAX(DECODE(F.QCODE1,'24-4-3',F.CHECKYN,''))  "24-4-3"
       , MAX(DECODE(F.QCODE1,'24-4-4',F.CHECKYN,''))  "24-4-4"
       , MAX(DECODE(F.QCODE1,'24-5-1',F.CHECKYN,''))  "24-5-1"
       , MAX(DECODE(F.QCODE1,'24-5-2',F.CHECKYN,''))  "24-5-2"
       , MAX(DECODE(F.QCODE1,'24-5-3',F.CHECKYN,''))  "24-5-3"
       , MAX(DECODE(F.QCODE1,'24-5-4',F.CHECKYN,''))  "24-5-4"
       , MAX(DECODE(F.QCODE1,'24-6-1',F.CHECKYN,''))  "24-6-1"
       , MAX(DECODE(F.QCODE1,'24-6-2',F.CHECKYN,''))  "24-6-2"
       , MAX(DECODE(F.QCODE1,'24-6-3',F.CHECKYN,''))  "24-6-3"
       , MAX(DECODE(F.QCODE1,'24-6-4',F.CHECKYN,''))  "24-6-4"
       , MAX(DECODE(F.QCODE1,'24-7-1',F.CHECKYN,''))  "24-7-1"
       , MAX(DECODE(F.QCODE1,'24-7-2',F.CHECKYN,''))  "24-7-2"
       , MAX(DECODE(F.QCODE1,'24-7-3',F.CHECKYN,''))  "24-7-3"
       , MAX(DECODE(F.QCODE1,'24-7-4',F.CHECKYN,''))  "24-7-4"
       , MAX(DECODE(F.QCODE1,'24-8-1',F.CHECKYN,''))  "24-8-1"
       , MAX(DECODE(F.QCODE1,'24-8-2',F.CHECKYN,''))  "24-8-2"
       , MAX(DECODE(F.QCODE1,'24-8-3',F.CHECKYN,''))  "24-8-3"
       , MAX(DECODE(F.QCODE1,'24-8-4',F.CHECKYN,''))  "24-8-4"
       , MAX(DECODE(F.QCODE1,'24-9-1',F.CHECKYN,''))  "24-9-1"
       , MAX(DECODE(F.QCODE1,'24-9-2',F.CHECKYN,''))  "24-9-2"
       , MAX(DECODE(F.QCODE1,'24-9-3',F.CHECKYN,''))  "24-9-3"
       , MAX(DECODE(F.QCODE1,'24-9-4',F.CHECKYN,''))  "24-9-4"
       , MAX(DECODE(F.QCODE1,'24-10-1',F.CHECKYN,'')) "24-10-1"
       , MAX(DECODE(F.QCODE1,'24-10-2',F.CHECKYN,'')) "24-10-2"
       , MAX(DECODE(F.QCODE1,'24-10-3',F.CHECKYN,'')) "24-10-3"
       , MAX(DECODE(F.QCODE1,'24-10-4',F.CHECKYN,'')) "24-10-4"
       , MAX(DECODE(F.QCODE1,'24-11-1',F.CHECKYN,'')) "24-11-1"
       , MAX(DECODE(F.QCODE1,'24-11-2',F.CHECKYN,'')) "24-11-2"
       , MAX(DECODE(F.QCODE1,'24-11-3',F.CHECKYN,'')) "24-11-3"
       , MAX(DECODE(F.QCODE1,'24-11-4',F.CHECKYN,'')) "24-11-4"
       , MAX(DECODE(F.QCODE1,'24-12-1',F.CHECKYN,'')) "24-12-1"
       , MAX(DECODE(F.QCODE1,'24-12-2',F.CHECKYN,'')) "24-12-2"
       , MAX(DECODE(F.QCODE1,'24-12-3',F.CHECKYN,'')) "24-12-3"
       , MAX(DECODE(F.QCODE1,'24-12-4',F.CHECKYN,'')) "24-12-4"
       , MAX(DECODE(F.QCODE1,'24-13-1',F.CHECKYN,'')) "24-13-1"
       , MAX(DECODE(F.QCODE1,'24-13-2',F.CHECKYN,'')) "24-13-2"
       , MAX(DECODE(F.QCODE1,'24-13-3',F.CHECKYN,'')) "24-13-3"
       , MAX(DECODE(F.QCODE1,'24-13-4',F.CHECKYN,'')) "24-13-4"
       , MAX(DECODE(F.QCODE1,'24-14-1',F.CHECKYN,'')) "24-14-1"
       , MAX(DECODE(F.QCODE1,'24-14-2',F.CHECKYN,'')) "24-14-2"
       , MAX(DECODE(F.QCODE1,'24-14-3',F.CHECKYN,'')) "24-14-3"
       , MAX(DECODE(F.QCODE1,'24-14-4',F.CHECKYN,'')) "24-14-4"
       , MAX(DECODE(F.QCODE1,'24-15-1',F.CHECKYN,'')) "24-15-1"
       , MAX(DECODE(F.QCODE1,'24-15-2',F.CHECKYN,'')) "24-15-2"
       , MAX(DECODE(F.QCODE1,'24-15-3',F.CHECKYN,'')) "24-15-3"
       , MAX(DECODE(F.QCODE1,'24-15-4',F.CHECKYN,'')) "24-15-4"
       , MAX(DECODE(F.QCODE1,'24-16-1',F.CHECKYN,'')) "24-16-1"
       , MAX(DECODE(F.QCODE1,'24-16-2',F.CHECKYN,'')) "24-16-2"
       , MAX(DECODE(F.QCODE1,'24-16-3',F.CHECKYN,'')) "24-16-3"
       , MAX(DECODE(F.QCODE1,'24-16-4',F.CHECKYN,'')) "24-16-4"
       , MAX(DECODE(F.QCODE1,'24-17-1',F.CHECKYN,'')) "24-17-1"
       , MAX(DECODE(F.QCODE1,'24-17-2',F.CHECKYN,'')) "24-17-2"
       , MAX(DECODE(F.QCODE1,'24-17-3',F.CHECKYN,'')) "24-17-3"
       , MAX(DECODE(F.QCODE1,'24-17-4',F.CHECKYN,'')) "24-17-4"
       , MAX(DECODE(F.QCODE1,'24-18-1',F.CHECKYN,'')) "24-18-1"
       , MAX(DECODE(F.QCODE1,'24-18-2',F.CHECKYN,'')) "24-18-2"
       , MAX(DECODE(F.QCODE1,'24-18-3',F.CHECKYN,'')) "24-18-3"
       , MAX(DECODE(F.QCODE1,'24-18-4',F.CHECKYN,'')) "24-18-4"
       , MAX(DECODE(F.QCODE1,'24-19-1',F.CHECKYN,'')) "24-19-1"
       , MAX(DECODE(F.QCODE1,'24-19-2',F.CHECKYN,'')) "24-19-2"
       , MAX(DECODE(F.QCODE1,'24-19-3',F.CHECKYN,'')) "24-19-3"
       , MAX(DECODE(F.QCODE1,'24-19-4',F.CHECKYN,'')) "24-19-4"
       , MAX(DECODE(F.QCODE1,'24-19-5',F.CHECKYN,'')) "24-19-5"
       , MAX(DECODE(F.QCODE1,'24-20-1',F.CHECKYN,'')) "24-20-1"
       , MAX(DECODE(F.QCODE1,'24-20-2',F.CHECKYN,'')) "24-20-2"
       , MAX(DECODE(F.QCODE1,'24-20-3',F.CHECKYN,'')) "24-20-3"
       , MAX(DECODE(F.QCODE1,'24-20-4',F.CHECKYN,'')) "24-20-4"
       , MAX(DECODE(F.QCODE1,'24-20-5',F.CHECKYN,'')) "24-20-5"
       , MAX(DECODE(F.QCODE1,'24-21-1',F.CHECKYN,'')) "24-21-1"
       , MAX(DECODE(F.QCODE1,'24-21-2',F.CHECKYN,'')) "24-21-2"
  FROM JYTEMPTT@DL_SDEV9_S A, SMQUESAT F
 WHERE A.PATNO = F.PATNO
   AND A.ORDDATE = F.ORDDATE
   AND SUBSTR(F.QCODE1,1,4) IN (
                               '1019'  -- 초진흡연
                               ,'1035'  -- 재진흡연
                               ,'2-0-'  -- 흡연여부
                               ,'2-2'   -- 흡연기간
                               ,'2-3-'  -- 흡연량
                               ,'1021'  -- 초진음주
                               ,'1036'  -- 재진음주
                               ,'3-0-'  -- 음주여부
                               ,'3-1'   -- 음주기간
                               ,'3-2-'  -- 음주횟수
                               ,'3-3-'  -- 음주량
                               ,'24-1'
                               ,'24-2'
                               ,'24-3'
                               ,'24-4'
                               ,'24-5'
                               ,'24-6'
                               ,'24-7'
                               ,'24-8'
                               ,'24-9'
                               )
 GROUP BY A.PATNO, A.ORDDATE, A.COMPOS
