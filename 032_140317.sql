SELECT DISTINCT A.*, B.ORDYN
     , (
        SELECT DISTINCT X.EXAMTYP
          FROM SMPKGMDT X
         WHERE A.ORDCODE = X.PKGCODE
       ) EXAMTYP
  FROM (-- 건강평가보고서 수치 항목
        SELECT A.ORDCODE, A.ORDNAME, B.HLTHSUGA
          FROM MMORDRCT A, SM0SUGAT B, CCCOMCDT C
         WHERE A.ORDCODE = B.EXAMCODE
           AND B.TODT IS NULL
           AND C.GRPCODE = 'SM703'
           AND A.ORDCODE = C.OPTION2(+)
        UNION ALL
        -- 건강평가보고서 텍스트 항목
        SELECT A.ORDCODE, A.ORDNAME, B.HLTHSUGA
          FROM MMORDRCT A, SM0SUGAT B, CCCOMCDT C
         WHERE A.ORDCODE = B.EXAMCODE
           AND B.TODT IS NULL
           AND C.GRPCODE = 'SM702'
           AND A.ORDCODE = C.OPTION3(+)
        UNION ALL
        -- 판정화면 분류
        SELECT A.ORDCODE, A.ORDNAME, B.HLTHSUGA
          FROM MMORDRCT A, SM0SUGAT B, CCCOMCDT C
         WHERE A.ORDCODE = B.EXAMCODE
           AND B.TODT IS NULL
           AND C.GRPCODE = 'SM890'
           AND A.ORDCODE = C.OPTION2(+)
        UNION ALL
        -- PKG 처방항목
        SELECT DISTINCT A.ORDCODE, B.ORDNAME, C.HLTHSUGA
          FROM SMPKGMDT A, MMORDRCT B, SM0SUGAT C
         WHERE A.ORDCODE = B.ORDCODE
           AND A.ORDCODE = C.EXAMCODE(+)
           AND C.TODT IS NULL
       ) A
     , MMORDRCT B
 WHERE NOT EXISTS (
                   SELECT 'Y'
                     FROM SMPKGMDT X
                    WHERE A.ORDCODE = X.ORDCODE
                      AND X.EXAMTYP = '3'
                  )
   AND A.ORDCODE = B.ORDCODE
