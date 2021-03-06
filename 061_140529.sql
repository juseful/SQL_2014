SELECT A.MST, A.PATNO, A.ORDDATE
     , MAX(DECODE(B.EXAMCODE,'BL3119',B.RSLTNUM,'')) BUN
     , MAX(DECODE(B.EXAMCODE,'BL3120',B.RSLTNUM,'')) CR
  FROM (
-- 1차
SELECT A.MST, A.PATNO, A.ORDDATE
  FROM (
        -- 1차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
        UNION ALL
        -- 2차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
        UNION ALL
        -- 3차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
       ) A
 WHERE A.MST IN (
-- 1차
                )
UNION ALL
-- 2차
SELECT A.MST, A.PATNO, A.ORDDATE
  FROM (
        -- 1차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
        UNION ALL
        -- 2차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
        UNION ALL
        -- 3차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
       ) A
 WHERE A.MST IN (
-- 2차
                )
UNION ALL
-- 3차
SELECT A.MST, A.PATNO, A.ORDDATE
  FROM (
        -- 1차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
        UNION ALL
        -- 2차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
        UNION ALL
        -- 3차
        SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
          FROM SMRSV00T A
         WHERE A.ORDDATE BETWEEN TO_DATE('19970101','YYYYMMDD') AND TO_DATE('19971231','YYYYMMDD')
           AND A.PATNO IN (
                        )
       ) A
 WHERE A.MST IN (
-- 3차
                )
       ) A
     , STRESULT B
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
 GROUP BY A.MST, A.PATNO, A.ORDDATE
