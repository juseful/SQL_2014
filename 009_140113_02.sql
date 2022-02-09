-- 대상자
SELECT A.*, B.RSVNOSM NXTNOSM
  FROM (
        SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, MIN(B.ORDDATE) NXTDATE
          FROM (-- 2012년 초진자 중 약복용자 제외
                SELECT *
                  FROM (-- 건진회차 정보
                        SELECT B.ORDDATE, B.PATNO, B.RSVNOSM, B.PKGCODE, C.PKGTYP
                             , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY B.ORDDATE) RN
                          FROM (-- 2012년 건진자
                                SELECT A.ORDDATE, A.PATNO, A.PKGCODE, B.PKGTYP
                                  FROM SMRSV00T A, SMPKGMST B
                                 WHERE A.ORDDATE BETWEEN TO_DATE('20120101','YYYYMMDD') AND TO_dATE('20121231','YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.PKGCODE = B.PKGCODE
                                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                               ) A
                             , SMRSV00T B
                             , SMPKGMST C
                         WHERE A.PATNO = B.PATNO
                           AND B.CANCELTIME IS NULL
                           AND B.ORDDATE IS NOT NULL
                           AND B.PKGCODE = C.PKGCODE
                           AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
                       ) A
                 WHERE A.RN = '1'
                   AND A.ORDDATE BETWEEN TO_DATE('20120101','YYYYMMDD') AND TO_dATE('20121231','YYYYMMDD')
                   AND NOT EXISTS (-- 약복용 대상자
                                   SELECT 'Y'
                                     FROM SMQUESAT X
                                    WHERE A.PATNO = X.PATNO
                                      AND A.ORDDATE = X.ORDDATE
                                      AND X.QCODE1 LIKE '7-1-%-1'
                                      AND (
                                           X.QCODE1||X.CHECKYN = '7-1-1-1Y' --혈압약 복용중
                                          OR
                                           X.QCODE1||X.CHECKYN = '7-1-2-1Y' --당뇨약 복용중
                                          OR
                                           X.QCODE1||X.CHECKYN = '7-1-3-1Y' --고지혈증약 복용중
                                          )
                                  )
               ) A
             , SMRSV00T B
             , SMPKGMST C
         WHERE A.PATNO = B.PATNO
           AND B.CANCELTIME IS NULL
           AND B.ORDDATE LIKE '2013%'
           AND B.PKGCODE = C.PKGCODE
           AND SUBSTR(C.PKGTYP,1,1) IN ('0','1','2','3','4')
         GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM
       ) A
     , SMRSV00T B
 WHERE A.PATNO = B.PATNO
   AND A.NXTDATE = B.ORDDATE

-- 검사결과
SELECT A.*
     , MAX(DECODE(B.QCODE1||B.CHECKYN,'2-0-1Y',B.QCODENM
                                     ,'2-0-2Y',B.QCODENM
                                     ,'2-0-3Y',B.QCODENM
                 ,''))                                   SMOKING
     , MAX(DECODE(B.QCODE1||B.CHECKYN,'5-0-1Y',B.QCODENM
                                     ,'5-0-2Y',B.QCODENM
                                     ,'5-0-3Y',B.QCODENM
                                     ,'5-0-4Y',B.QCODENM
                 ,''))                                   ACTIVITY
     , MAX(DECODE(C.EXAMCODE,'BL314201',C.RSLTNUM,'')) LDL_CHOL
     , MAX(DECODE(C.EXAMCODE,'BL3118',C.RSLTNUM,'')) FBS
     , MAX(DECODE(C.EXAMCODE,'BL3164',C.RSLTNUM,'')) HBA1C
  FROM JYDTPJST A
     , SMQUESAT@SMCS_SMCS_STDS B
     , STRESULT@SMCS_SMCS_STDS C
 WHERE A.ORDDATE BETWEEN TO_DATE('20120101','YYYYMMDD') AND TO_dATE('20120131','YYYYMMDD')
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND (B.QCODE1 LIKE '2-%'
       OR
        B.QCODE1 LIKE '5-%'
       )
   AND A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
   AND NVL(C.MODIFYYN,'N') != 'Y'
 GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM, A.NXTDATE, A.NXTNOSM;
