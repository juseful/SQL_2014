-- 최종
SELECT TO_CHAR(A.ORDEPTDATE,'YYYY-MM-DD')||'('||TO_CHAR(A.ORDEPTDATE,'DY')||')' ORDEPTDATE
     , A.PATNO
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       END PATNO2
     , A.EXAM
  FROM (/* 영상검사 */
        SELECT A.ORDEPTDATE, A.PATNO
             , CASE WHEN A.ORDCODE = 'RC1241' THEN 'LDCT'
                    WHEN A.ORDCODE = 'RC3120' THEN 'APCT'
                    WHEN A.ORDCODE LIKE 'RG010P' THEN 'CHEST_PA'
                    WHEN A.ORDCODE LIKE 'RG923C' THEN 'MAMMO'
                    WHEN A.ORDCODE LIKE 'RS2010' THEN 'US_CAROTID'
                    WHEN A.ORDCODE LIKE 'BS2231' THEN 'ECHO'
                    WHEN A.ORDCODE LIKE 'RS1172' THEN 'US_THYROID'
                    WHEN A.ORDCODE LIKE 'SM1805' THEN 'US_PELVIC'
                    WHEN A.ORDCODE LIKE 'RS1190' THEN 'US_BREAST'
                    WHEN A.ORDCODE LIKE 'RC1184' THEN 'CACT'
                    WHEN A.ORDCODE LIKE 'RM1013N' THEN 'MRA'
                    ELSE ''
               END EXAM
          FROM (-- PKG 내 USERSET 제외항목
                SELECT *
                  FROM (
                        SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                          FROM SMRSV00T A, SMPKGMDT B
                         WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO LIKE '&CUSTCODE%'
                           AND A.PKGCODE = B.PKGCODE
                           AND B.EXAMTYP = '0'
                           AND NOT EXISTS (-- PKG내 취소항목 제외
                                           SELECT 'Y'
                                             FROM SMADD00T X
                                            WHERE A.RSVNOSM = X.RSVNOSM
                                              AND X.EXAMTYP = '3'
                                              AND X.CANCELTIME IS NULL
                                          )
                       ) A
                 WHERE NOT EXISTS (-- PKG내 USERSET 제외
                                   SELECT 'Y'
                                     FROM SMPKGMDT Y
                                    WHERE A.ORDCODE = Y.PKGCODE
                                      AND Y.EXAMTYP = '4'
                                  )
                UNION ALL
                -- PKG 내 USERSET 세부항목
                SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                  FROM (
                        SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                          FROM SMRSV00T A, SMPKGMDT B
                         WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO LIKE '&CUSTCODE%'
                           AND A.PKGCODE = B.PKGCODE
                           AND B.EXAMTYP = '0'
                           AND NOT EXISTS (-- PKG내 취소항목 제외
                                           SELECT 'Y'
                                             FROM SMADD00T X
                                            WHERE A.RSVNOSM = X.RSVNOSM
                                              AND X.EXAMTYP = '3'
                                              AND X.CANCELTIME IS NULL
                                          )
                       ) A
                     , SMPKGMDT B
                 WHERE A.ORDCODE = B.PKGCODE
                   AND B.EXAMTYP = '4'
                UNION ALL
                -- 추가,선택항목 중 USERSET 제외항목
                SELECT A.*
                  FROM (
                        SELECT A.ORDEPTDATE, A.PATNO, B.PKGEXAMCODE
                          FROM SMRSV00T A, SMADD00T B
                         WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO LIKE '&CUSTCODE%'
                           AND A.RSVNOSM = B.RSVNOSM
                           AND B.EXAMTYP IN ('1','2')
                           AND B.CANCELTIME IS NULL
                       ) A
                 WHERE NOT EXISTS (-- PKG내 USERSET 제외
                                   SELECT 'Y'
                                     FROM SMPKGMDT Y
                                    WHERE A.PKGEXAMCODE = Y.PKGCODE
                                      AND Y.EXAMTYP = '4'
                                  )
                UNION ALL
                -- 추가,선택항목 중 USERSET 세부항목
                SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                  FROM (
                        SELECT A.ORDEPTDATE, A.PATNO, B.PKGEXAMCODE
                          FROM SMRSV00T A, SMADD00T B
                         WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO LIKE '&CUSTCODE%'
                           AND A.RSVNOSM = B.RSVNOSM
                           AND B.EXAMTYP IN ('1','2')
                           AND B.CANCELTIME IS NULL
                       ) A
                     , SMPKGMDT B
                 WHERE A.PKGEXAMCODE = B.PKGCODE
                   AND B.EXAMTYP = '4'
               ) A
        UNION ALL
        SELECT /* 내시경검사 */
               A.ORDEPTDATE, A.PATNO
             , CASE
                    WHEN A.EGD||A.COL||A.XMIDA5 = '123' THEN '위+대+수면'
                    WHEN A.EGD||A.COL||A.XMIDA5 = '12' THEN '위+대'
                    WHEN A.EGD||A.COL||A.XMIDA5 = '13' THEN '위+수면'
                    WHEN A.EGD||A.COL||A.XMIDA5 = '23' THEN '대+수면'
                    WHEN A.EGD||A.COL||A.XMIDA5 = '1' THEN '위'
                    WHEN A.EGD||A.COL||A.XMIDA5 = '2' THEN '대'
                    ELSE ''
               END EXAM
          FROM (-- 건진 예정자 전체 검사 예정
                SELECT -- A.*, B.ORDNAME
                       A.ORDEPTDATE, A.PATNO
                     , MAX(DECODE(A.ORDCODE,'BS4100','1')) EGD
                     , MAX(DECODE(A.ORDCODE,'BS4141','2')) COL
                     , MAX(DECODE(A.ORDCODE,'XMIDA5','3')) XMIDA5
                  FROM (-- PKG 내 USERSET 제외항목
                        SELECT *
                          FROM (
                                SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                                  FROM SMRSV00T A, SMPKGMDT B
                                 WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.CONTNO LIKE '&CUSTCODE%'
                                   AND A.PKGCODE = B.PKGCODE
                                   AND B.EXAMTYP = '0'
                                   AND NOT EXISTS (-- PKG내 취소항목 제외
                                                   SELECT 'Y'
                                                     FROM SMADD00T X
                                                    WHERE A.RSVNOSM = X.RSVNOSM
                                                      AND X.EXAMTYP = '3'
                                                      AND X.CANCELTIME IS NULL
                                                  )
                               ) A
                         WHERE NOT EXISTS (-- PKG내 USERSET 제외
                                           SELECT 'Y'
                                             FROM SMPKGMDT Y
                                            WHERE A.ORDCODE = Y.PKGCODE
                                              AND Y.EXAMTYP = '4'
                                          )
                        UNION ALL
                        -- PKG 내 USERSET 세부항목
                        SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                          FROM (
                                SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                                  FROM SMRSV00T A, SMPKGMDT B
                                 WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.CONTNO LIKE '&CUSTCODE%'
                                   AND A.PKGCODE = B.PKGCODE
                                   AND B.EXAMTYP = '0'
                                   AND NOT EXISTS (-- PKG내 취소항목 제외
                                                   SELECT 'Y'
                                                     FROM SMADD00T X
                                                    WHERE A.RSVNOSM = X.RSVNOSM
                                                      AND X.EXAMTYP = '3'
                                                      AND X.CANCELTIME IS NULL
                                                  )
                               ) A
                             , SMPKGMDT B
                         WHERE A.ORDCODE = B.PKGCODE
                           AND B.EXAMTYP = '4'
                        UNION ALL
                        -- 추가,선택항목 중 USERSET 제외항목
                        SELECT A.*
                          FROM (
                                SELECT A.ORDEPTDATE, A.PATNO, B.PKGEXAMCODE
                                  FROM SMRSV00T A, SMADD00T B
                                 WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.CONTNO LIKE '&CUSTCODE%'
                                   AND A.RSVNOSM = B.RSVNOSM
                                   AND B.EXAMTYP IN ('1','2')
                                   AND B.CANCELTIME IS NULL
                               ) A
                         WHERE NOT EXISTS (-- PKG내 USERSET 제외
                                           SELECT 'Y'
                                             FROM SMPKGMDT Y
                                            WHERE A.PKGEXAMCODE = Y.PKGCODE
                                              AND Y.EXAMTYP = '4'
                                          )
                        UNION ALL
                        -- 추가,선택항목 중 USERSET 세부항목
                        SELECT A.ORDEPTDATE, A.PATNO, B.ORDCODE
                          FROM (
                                SELECT A.ORDEPTDATE, A.PATNO, B.PKGEXAMCODE
                                  FROM SMRSV00T A, SMADD00T B
                                 WHERE A.ORDEPTDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.CONTNO LIKE '&CUSTCODE%'
                                   AND A.RSVNOSM = B.RSVNOSM
                                   AND B.EXAMTYP IN ('1','2')
                                   AND B.CANCELTIME IS NULL
                               ) A
                             , SMPKGMDT B
                         WHERE A.PKGEXAMCODE = B.PKGCODE
                           AND B.EXAMTYP = '4'
                       ) A
                     , MMORDRCT B
                 WHERE (
                        A.ORDCODE LIKE 'BS4%'
                       OR
                        A.ORDCODE LIKE 'XMI%'
                       )
                   AND A.ORDCODE = B.ORDCODE
                 GROUP BY A.ORDEPTDATE, A.PATNO
               ) A
       ) A
 WHERE A.EXAM IS NOT NULL
