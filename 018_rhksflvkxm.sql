-- 최종!! 수납일자 기준이 모호한 관계로 아래와 같이 적용
-- 관리파트 협의 사항 적용
-- 서비스료 포함, 수가기준을 예약내역의 정보로 수정.
SELECT TO_CHAR(A.ORDDATE,'MM') "MONTHS"
     , DECODE(SUBSTR(A.PKGTYP,1,1),'1','4.정밀'
                                  ,'0','5.맞춤'
                                  ,'2','6.건강의학'
                                  ,'3','3.VIP+임원'
                                  ,'4',DECODE(A.PKGTYP,'4A','1.CEO','4B','2.숙박')
             ,'7.특화'
             ) PKGTYP
     , A.PKGCODE, A.PKGNM, A.ORDCODE, C.ORDNAME, A.ADDYN, COUNT(A.PATNO) CNT, SUM(NVL(A.EXAMAMT,'0')) AMT
  FROM (-- 개인별 검사 항목별 수가
        SELECT A.*, C.PKGTYP, C.PKGNM
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
          FROM (-- 1.PKG 기본검사 처방
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.SUGATYP
                     , A.PKGCODE, B.ORDCODE, '' ADDYN
                  FROM SMRSV00T A, MMEXMORT B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMD','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
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
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMD','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
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
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMD','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
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
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMD','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
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
                 WHERE A.ORDDATE BETWEEN TO_DATE('&FROMD','YYYYMMDD') AND TO_DATE('&TODT','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.RSVNOSM = B.RSVNOSM
                   AND B.EXAMTYP = '2'
                   AND B.CANCELTIME IS NULL
                   AND NVL(B.ORGEXAMCODE,'N') NOT LIKE 'SM08%' -- 향정약 원처방을 내시경 DC처방 이용한 CASE 제외
                   AND B.PKGEXAMCODE = C.PKGCODE
                   AND C.EXAMTYP = '4'
               ) A
             , SM0SUGAT B
             , SMPKGMST C
         WHERE A.PKGCODE = C.PKGCODE
           AND SUBSTR(C.PKGTYP,1,1) != '7'
           AND C.PKGCODE != 'THSL'
           AND A.ORDCODE = B.EXAMCODE(+)
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
     , MMORDRCT C
 WHERE A.ORDCODE = C.ORDCODE(+)
 GROUP BY TO_CHAR(A.ORDDATE,'MM'), A.PKGTYP, A.PKGCODE, A.PKGNM, A.ORDCODE, C.ORDNAME, A.ADDYN
 ORDER BY 1,2,3,5
