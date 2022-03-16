-- 소화기 전문건진 인원
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", 성별찾기펑션(A.PATNO) SEX, COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_dATE('20130101','YYYYMMDD') AND TO_DATE('20140731','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP = '5G'
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), 성별찾기펑션(A.PATNO)

-- 맞춤건진 인원
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", 성별찾기펑션(A.PATNO) SEX, COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_dATE('20130101','YYYYMMDD') AND TO_DATE('20140731','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP = '0'
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), 성별찾기펑션(A.PATNO)

-- 지방간소견
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", 성별찾기펑션(A.PATNO) SEX, COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_dATE('20130101','YYYYMMDD') AND TO_DATE('20140731','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP = '0'
   AND EXISTS (
               SELECT 'Y'
                 FROM SMRSLTCT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.EXAMCODE IN ('RS1010','RS1031')
                  AND X.RSLTCODE IN ('0002','0003','0007','0008','0054','0056','0057','0058')
              )
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), 성별찾기펑션(A.PATNO)

-- 고가건진 인원
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS", 성별찾기펑션(A.PATNO) SEX, COUNT(A.PATNO) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_dATE('20130101','YYYYMMDD') AND TO_DATE('20140731','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP IN ('1P','3A','3B','3C','4A','4B')
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), 성별찾기펑션(A.PATNO)

-- B형 간염 보균자
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS"
     , A.SEX
     , COUNT(A.PATNO) CNT
  FROM (
SELECT A.*
  FROM (
SELECT A.PATNO, A.ORDDATE, A.SEX
     , MAX(DECODE(C.EXAMCODE,'BL5111',C.RSLTNUM,'')) "HBsAg"
     , MAX(DECODE(C.EXAMCODE,'BL3115',C.RSLTNUM,'')) "AST_NUM"
     , MAX(DECODE(C.EXAMCODE,'BL3116',C.RSLTNUM,'')) "ALT_NUM"
  FROM (
        SELECT A.PATNO, A.ORDDATE, 성별찾기펑션(A.PATNO) SEX
          FROM SMRSV00T A, SMPKGMST B
         WHERE A.ORDDATE BETWEEN TO_dATE('20130101','YYYYMMDD') AND TO_DATE('20140731','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND B.PKGTYP = '0'
       ) A
     , STRESULT C
 WHERE A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
   AND NVL(C.MODIFYYN,'N') != 'Y'
   AND EXISTS (-- 건진처방 결과만 가져오기
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE C.PATNO = X.PATNO
                  AND C.ORDDATE = X.ORDDATE
                  AND C.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.PATNO, A.ORDDATE, A.SEX
       ) A
 WHERE A."HBsAg" like 'P%'
   AND TO_NUMBER(A.AST_NUM) < 40
   AND TO_NUMBER(A.ALT_NUM) < 40
       ) A
 GROUP BY  TO_CHAR(A.ORDDATE,'YYYY-MM'), A.SEX