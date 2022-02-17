/* 1.처방항목별 검사금액 */
SELECT TO_CHAR(A.ORDDATE,'YYYYMM') YYMM
     , A.PATNO
     , A.ORDDATE
     , NVL(A.ORDSEQNO,'9997') ORDSEQNO
     , A.ORDCODE
     , 0 RCPAMT
     , 0 DCAMT
     , A.EXAMAMT INSPRICE
     , A.RECDTYP
     , A.ABCACTDT
     , A.ABCMEDDP
     , A.ABCACTDP
     , A.ABCORDDR
     , A.ABCACTDR
     , A.RSVNOSM
  FROM (-- 개인별 검사 항목별 수가
        SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP, A.PKGCODE, A.ORDCODE, A.PATFG, A.APPATFG, A.ORDSEQNO
             , CASE
                    WHEN A.ORDCODE LIKE 'SMX%' THEN (-- 건진서비스관련 수납 비용
                                                     SELECT SUM(X.CREAMT) SERVICEAMT /* 수납에 (-) 발생하는 경우도 있으므로 SUM으로 계산 */
                                                       FROM SMRCP00T X
                                                      WHERE A.RSVNOSM = X.RSVNOSM
                                                        AND A.ORDCODE = X.PKGEXAMCODE
                                                    )
                    ELSE DECODE(-- 수가타입에 따른 건진별 수가
                                NVL(A.SUGATYP,'1'),'1',B.HLTHSUGA -- 1은 건진
                                                  ,'2',B.INSPRICE -- 2는 건진보험
                                                  ,'3',B.NORMSUGA -- 3은 건진일반
                                                  ,'4',B.INTLSUGA -- 4는 건진국제
                               ,B.GRPSUGA                         -- 나머지는 건진우대
                               )
               END EXAMAMT
             , NVL(A.SUGATYP,'1') RECDTYP -- 건진수가타입(0-PKG총 수익액, 1-건진, 2-건진보험, 3-건진일반, 4-건진국제, 5-건진우대, 6-감면금액)
             , A.ABCACTDT
             , A.ABCMEDDP
             , A.ABCACTDP
             , A.ABCORDDR
             , A.ABCACTDR
          FROM (
                -- 1. 검사처방
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP, A.PKGCODE, B.ORDCODE, B.ORDSEQNO, B.PATFG, B.APPATFG
                     , TO_CHAR(B.ABCACTDT) ABCACTDT
                     , NVL(B.ABCMEDDP,DECODE(B.MEDLOCATFG,'M','SM','CSM')) ABCMEDDP
                     , NVL(B.ABCACTDP,DECODE(B.MEDLOCATFG,'M','SM','CSM')) ABCACTDP
                     , B.ABCORDDR
                     , B.ABCACTDR
                  FROM SMRSV00T A, MMEXMORT B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PATNO = B.PATNO
                   AND A.ORDDATE = B.ORDDATE
                   AND B.PATFG = 'G'
                UNION ALL
                -- 2. 향정약처방
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP, A.PKGCODE, B.MATCODE, B.ORDSEQNO+6000 ORDSEQNO, B.PATFG, B.APPATFG
                     , TO_CHAR(B.ABCACTDT) ABCACTDT
                     , NVL(B.ABCMEDDP,DECODE(B.MEDLOCATFG,'M','SM','CSM')) ABCMEDDP
                     , NVL(B.ABCACTDP,DECODE(B.MEDLOCATFG,'M','SM','CSM')) ABCACTDP
                     , B.ABCORDDR
                     , B.ABCACTDR
                  FROM SMRSV00T A, SWSNDMAT B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PATNO = B.PATNO
                   AND A.ORDDATE = B.ORDDATE
                   AND B.PATFG = 'G'
                UNION ALL
                -- 3. 처방 외 수납발생용 코드
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP, A.PKGCODE, B.PKGEXAMCODE ORDCODE, B.SEQNO+7000 ORDSEQNO, '' PATFG, '' APPATFG
                     , '' ABCACTDT
                     , DECODE(A.MEDLOCATFG,'M','SM','CSM') ABCMEDDP
                     , DECODE(A.MEDLOCATFG,'M','SM','CSM') ABCACTDP
                     , '' ABCORDDR
                     , '' ABCACTDR
                  FROM SMRSV00T A, SMADD00T B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.RSVNOSM = B.RSVNOSM
                   AND (
                        EXISTS (/* 강제 수납 발생코드 */
                                SELECT 'Y'
                                  FROM CCCOMCDT X
                                 WHERE X.GRPCODE = 'SMM071'
                                   AND B.PKGEXAMCODE = X.CODE
                               )
                       OR
                        EXISTS (/* MMEXMORT에 처방 발생되지 않는 USERSET */
                                SELECT 'Y'
                                  FROM SMPKGMDT X
                                 WHERE B.PKGEXAMCODE = X.PKGCODE
                                   AND X.ORDCODE = 'T'
                               )
                       )
                   AND B.CANCELTIME IS NULL
               ) A
             , SM0SUGAT B
         WHERE A.ORDCODE = B.EXAMCODE(+)
           AND (-- 건진일자 기준 수가 적용, 단, 건진 수가가 2013년에서야 체계적으로 관리 됨.
                /* 만약 그 이전 결과를 작업하는 경우는 보험수가 기준으로 적용이 필요.*/
                nvl(B.FROMDT,'1900-01-01') < A.ORDDATE
                AND
                A.ORDDATE < NVL(B.TODT,'2999-12-31')
               )
           AND (-- 중복항목 및 무관항목 제외
                A.ORDCODE NOT IN ('SM0001','SM0520','T')
                AND
                A.ORDCODE NOT LIKE 'SM08%'-- 내시경 DC처방
               )
       ) A
     , SMPKGMST B
 WHERE NVL(A.PATFG,'G') = 'G' -- 처방일자의 건진처방만 고려
   AND A.PKGCODE = B.PKGCODE
   AND SUBSTR(B.PKGTYP,1,1) NOT IN ('7','8')    -- 스포츠외래, 국제진료소 제외
UNION ALL
/* 2.PKGAMT */
SELECT TO_CHAR(A.ORDDATE,'YYYYMM') YYMM
     , A.PATNO
     , A.ORDDATE
     , 9998 ORDSEQNO
     , 'Z_PKGAMT' ORDCODE
     , SUM(B.CREAMT) RCPAMT
     , 0 DCAMT
     , 0 INSPRICE
     , '0' RECDTYP
     , '' ABCACTDT
     , DECODE(A.MEDLOCATFG,'M','SM','CSM') ABCMEDDP
     , DECODE(A.MEDLOCATFG,'M','SM','CSM') ABCACTDP
     , '' ABCORDDR
     , '' ABCACTDR
     , A.RSVNOSM
  FROM SMRSV00T A
     , SMRCP00T B
     , SMPKGMST C
 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = C.PKGCODE
   AND SUBSTR(C.PKGTYP,1,1) NOT IN ('7','8')    -- 스포츠외래, 국제진료소 제외
   AND A.RSVNOSM = B.RSVNOSM
   AND B.RCPTYP IN ('0','7','8')
 GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM,A.MEDLOCATFG
UNION ALL
/* 3.DCAMT */
SELECT TO_CHAR(A.ORDDATE,'YYYYMM') YYMM
     , A.PATNO
     , A.ORDDATE
     , 9999 ORDSEQNO
     , 'Z_DCAMT' ORDCODE
     , 0 RCPAMT
     , SUM(B.CREAMT) DCAMT
     , 0 INSPRICE
     , '6' RECDTYP
     , '' ABCACTDT
     , DECODE(A.MEDLOCATFG,'M','SM','CSM') ABCMEDDP
     , DECODE(A.MEDLOCATFG,'M','SM','CSM') ABCACTDP
     , '' ABCORDDR
     , '' ABCACTDR
     , A.RSVNOSM
  FROM SMRSV00T A
     , SMRCP00T B
     , SMPKGMST C
 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = C.PKGCODE
   AND SUBSTR(C.PKGTYP,1,1) NOT IN ('7','8')    -- 스포츠외래, 국제진료소 제외
   AND A.RSVNOSM = B.RSVNOSM
   AND B.RCPTYP = '5'
   AND B.CONTNO IS NULL            -- 단체 부담금도 RCPTYP = '5'이므로 구분 필요!!
--   AND B.PKGEXAMCODE != 'CUSTDC' -- 단체 부담금도 RCPTYP = '5'이므로 구분 필요!!
 GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM,A.MEDLOCATFG
 ORDER BY 3,2,5;