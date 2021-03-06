-- 기발송자
SELECT *
  FROM SMQWEBMT
 WHERE SENDTIME BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20140228','YYYYMMDD')
   AND OPENTIME IS NULL
   AND REJTTIME IS NULL
   AND ORDEPTDATE > TRUNC(SYSDATE)
 ORDER BY SENDTIME, PATNO

-- 미발송자
SELECT *
  FROM SMRSV00T B, SMQWEBMT A
 WHERE B.ORDEPTDATE BETWEEN TO_DATE('20140331','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
   AND B.CANCELTIME IS NULL
   AND B.RSVNOSM = A.RSVNOSM
   AND A.REJTTIME IS NULL
   AND A.SENDTIME IS NULL
-- ORDER BY SENDTIME, PATNO
