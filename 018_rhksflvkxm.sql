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
        SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP, A.PKGCODE, A.ORDCODE, C.PATFG, C.APPATFG, C.ORDSEQNO, A.ADDYN
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
             , NVL(A.SUGATYP,'1') RECDTYP -- 건진수가타입
             , C.ABCACTDT
             , NVL(C.ABCMEDDP,DECODE(C.MEDLOCATFG,'M','SM','CSM')) ABCMEDDP
             , NVL(C.ABCACTDP,DECODE(C.MEDLOCATFG,'M','SM','CSM')) ABCACTDP
             , C.ABCORDDR
             , C.ABCACTDR
          FROM (-- 1.PKG 기본검사 처방
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP
                     , A.PKGCODE, B.ORDCODE, '' ADDYN
                  FROM SMRSV00T A, MMEXMORT B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PATNO = B.PATNO
                   AND A.ORDDATE = B.ORDDATE
                   AND B.PATFG = 'G'
--                   AND B.EXECTIME IS NOT NULL   /* 실시여부를 떠나 처방을 D/C 하지 않은 것은 PKG 수가에 이미 포함된 것이므로 조건 삭제.*/
                   AND NOT EXISTS (-- 추가,선택 검사중 일반 처방 제외
                                   SELECT 'Y'
                                     FROM SMADD00T X
                                    WHERE A.RSVNOSM = X.RSVNOSM
                                      AND X.EXAMTYP IN ('1','2')
                                      AND X.CANCELTIME IS NULL
                                      AND X.PKGEXAMCODE = B.ORDCODE
                                  )
                   AND NOT EXISTS (-- 추가,선택 검사중 USERSET 처방 제외
                                   SELECT 'Y'
                                     FROM SMADD00T X
                                    WHERE A.RSVNOSM = X.RSVNOSM
                                      AND X.EXAMTYP IN ('1','2')
                                      AND X.CANCELTIME IS NULL
                                      AND B.ORDCODE IN (
                                                        SELECT Y.ORDCODE
                                                          FROM SMPKGMDT Y
                                                         WHERE X.PKGEXAMCODE = Y.PKGCODE
                                                       )
                                  )
                UNION ALL
                -- PKG 2.추가검사 처방
                -- 추가검사 처방 중 USERSET 제외
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP
                     , A.PKGCODE, B.PKGEXAMCODE ORDCODE, 'Y' ADDYN
                  FROM SMRSV00T A, SMADD00T B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.RSVNOSM = B.RSVNOSM
                   AND B.EXAMTYP = '1'
                   AND B.CANCELTIME IS NULL
                   AND NOT EXISTS (
                                   SELECT 'Y'
                                     FROM SMPKGMDT Y
                                    WHERE B.PKGEXAMCODE = Y.PKGCODE
                                      AND B.PKGEXAMCODE NOT LIKE 'SM0002S%'-- 처방 미발생하고 수납받기 위한 USERSET
                                      AND Y.EXAMTYP = '4'
                                  )
                UNION ALL
                -- 추가검사 처방 중 USERSET 세부항목
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP
                     , A.PKGCODE, C.ORDCODE ORDCODE, 'Y' ADDYN
                  FROM SMRSV00T A, SMADD00T B, SMPKGMDT C
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.RSVNOSM = B.RSVNOSM
                   AND B.EXAMTYP = '1'
                   AND B.CANCELTIME IS NULL
                   AND B.PKGEXAMCODE = C.PKGCODE
                   AND C.EXAMTYP = '4'
                UNION ALL
                -- PKG 3.선택검사 처방
                -- 선택검사 처방 중 USERSET 제외
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP
                     , A.PKGCODE, B.PKGEXAMCODE ORDCODE, '' ADDYN
                  FROM SMRSV00T A, SMADD00T B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.RSVNOSM = B.RSVNOSM
                   AND B.EXAMTYP = '2'
                   AND B.CANCELTIME IS NULL
                   AND NVL(B.ORGEXAMCODE,'N') NOT LIKE 'SM08%' -- 향정약 원처방을 내시경 DC처방 이용한 CASE 제외
                   AND NOT EXISTS (
                                   SELECT 'Y'
                                     FROM SMPKGMDT Y
                                    WHERE B.PKGEXAMCODE = Y.PKGCODE
                                      AND Y.EXAMTYP = '4'
                                  )
                UNION ALL
                -- 선택검사 처방 중 USERSET 세부항목
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP
                     , A.PKGCODE, C.ORDCODE ORDCODE, '' ADDYN
                  FROM SMRSV00T A, SMADD00T B, SMPKGMDT C
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMDT','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.RSVNOSM = B.RSVNOSM
                   AND B.EXAMTYP = '2'
                   AND B.CANCELTIME IS NULL
                   AND NVL(B.ORGEXAMCODE,'N') NOT LIKE 'SM08%' -- 향정약 원처방을 내시경 DC처방 이용한 CASE 제외
                   AND B.PKGEXAMCODE = C.PKGCODE
                   AND C.EXAMTYP = '4'
               ) A
             , SM0SUGAT B
             , MMEXMORT C
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
           AND A.PATNO = C.PATNO(+) -- 향정약은 처방테이블에서 정보관리 안 하므로 필요.
           AND A.ORDDATE = C.ORDDATE(+)
           AND A.ORDCODE = C.ORDCODE(+)
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
     , A.ORDDATE ABCACTDT
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
     , A.ORDDATE ABCACTDT
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
   AND NVL(DCRATE,'0') != '0' -- 단체 부담금도 RCPTYP = '5'이므로 구분 필요!!
 GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM,A.MEDLOCATFG
 ORDER BY 1,3,2,5;
