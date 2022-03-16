-- 클리닉문구확인
SELECT DISTINCT A.*
  FROM SMRSLTMT A
 WHERE
      (
       NVL(NXTPKG,'0') IN ('5E3' -- 갑상선 클리닉
                          ,'5T'  -- 갑상선 초음파
                          )
      )
      OR
      (
       DEDISADD LIKE '%갑상선%클리닉%'
      )
      OR
      (
       DEDISTXT LIKE '%갑상선%클리닉%'
       AND NVL(NXTPKG,'0') NOT IN ('5E3','5T')
       AND MEDDEPT IS NULL
      )
 ORDER BY 1,2,3,4,5,6;

-- 값 UPDATE
UPDATE SMRSLTMT
   SET EXAMCODE = 'X'||SUBSTR(EXAMCODE,2)
     , DEDISTXT = EXAMCODE||'_THYUNUSE_'||DEDISTXT
 WHERE
      (
       NVL(NXTPKG,'0') IN ('5E3' -- 갑상선 클리닉
                          ,'5T'  -- 갑상선 초음파
                          )
      )
      OR
      (
       DEDISADD LIKE '%갑상선%클리닉%'
      )
      OR
      (
       DEDISTXT LIKE '%갑상선%클리닉%'
       AND NVL(NXTPKG,'0') NOT IN ('5E3','5T')
       AND MEDDEPT IS NULL
      );
