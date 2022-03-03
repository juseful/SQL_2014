-- 기본대상자
INSERT INTO JY0531HT@DL_SDEV9_S A
SELECT B.ORDDATE, B.PATNO
  FROM (-- 기본 대상자
        SELECT A.PATNO, COUNT(A.ORDDATE) CNT
          FROM (
                SELECT /*+ INDEX(A MMEXMORT_IDX10) INDEX(A MMEXMORT_IDX12) */
                       A.PATNO, A.ORDDATE
                     ,(
                        MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-4Y','1','0'))
                      ) TOTAL
                  FROM SMRSV00T A, MMEXMORT B, SMQUESAT F
                 WHERE
--                       A.PATNO IN ()
--                   AND
                       A.ORDDATE BETWEEN TO_DATE('20090101','YYYYMMDD') AND TO_dATE('20140531','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PATNO = B.PATNO
                   AND A.ORDDATE = B.ORDDATE
                   AND B.PATFG = 'G'
                   AND B.ORDCODE IN ('BL3104','BL3113','BL3141','BL3142','BL314201')
                   AND A.PATNO = F.PATNO
                   AND A.ORDDATE = F.ORDDATE
                 HAVING
                      (
                        MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-4Y','1','0'))
                      + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-4Y','1','0'))
                      ) > 0
                 GROUP BY A.PATNO, A.ORDDATE
               ) A
         HAVING COUNT(A.ORDDATE) > '1'
         GROUP BY A.PATNO
       ) A
     , SMRSV00T B
     , MMEXMORT C
     , SMQUESAT F
 WHERE A.PATNO = B.PATNO
   AND B.ORDDATE BETWEEN  TO_DATE('20090101','YYYYMMDD') AND TO_dATE('20140531','YYYYMMDD')
   AND B.CANCELTIME IS NULL
   AND B.PATNO = C.PATNO
   AND B.ORDDATE = C.ORDDATE
   AND C.PATFG = 'G'
   AND C.ORDCODE IN ('BL3104','BL3113','BL3141','BL3142','BL314201')
   AND B.PATNO = F.PATNO
   AND B.ORDDATE = F.ORDDATE
 HAVING
        (
          MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-1-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-2-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-3-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-4-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-5-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-6-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-7-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-8-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-1Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-2Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-3Y','1','0'))  + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-9-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-10-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-11-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-12-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-13-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-14-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-15-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-16-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-17-4Y','1','0'))
        + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-1Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-2Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-3Y','1','0')) + MAX(DECODE(F.QCODE1||F.CHECKYN,'24-18-4Y','1','0'))
        ) > 0
 GROUP BY B.PATNO, B.ORDDATE

-- 검사결과
SELECT A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , C.SEX
     , TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12) AGE
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,'')) WT
     , MAX(DECODE(B.EXAMCODE,'SM0101',B.RSLTNUM,'')) HT
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,'')) BMI
     , MAX(DECODE(B.EXAMCODE,'SM010502',B.RSLTNUM,'')) AB_GIRTH
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) DBP
     , MAX(DECODE(B.EXAMCODE,'BL2011',B.RSLTNUM,'')) WBC
     , MAX(DECODE(B.EXAMCODE,'BL2012',B.RSLTNUM,'')) RBC
     , MAX(DECODE(B.EXAMCODE,'BL2013',B.RSLTNUM,'')) HB
     , MAX(DECODE(B.EXAMCODE,'BL2014',B.RSLTNUM,'')) HCT
     , MAX(DECODE(B.EXAMCODE,'BL2016',B.RSLTNUM,'')) PLT
     , MAX(DECODE(B.EXAMCODE,'BL201401',B.RSLTNUM,'')) MCV
     , MAX(DECODE(B.EXAMCODE,'BL201402',B.RSLTNUM,'')) MCH
     , MAX(DECODE(B.EXAMCODE,'BL201403',B.RSLTNUM,'')) MCHC
     , MAX(DECODE(B.EXAMCODE,'BL211101',B.RSLTNUM,'')) "PT(sec)"
     , MAX(DECODE(B.EXAMCODE,'BL211102',B.RSLTNUM,'')) "PT(%)"
     , MAX(DECODE(B.EXAMCODE,'BL211103',B.RSLTNUM,'')) "PT(INR)"
     , MAX(DECODE(B.EXAMCODE,'BL2112',B.RSLTNUM,'')) APTT
     , MAX(DECODE(B.EXAMCODE,'BL2113',B.RSLTNUM,'')) FIBRINOGEN
     , MAX(DECODE(B.EXAMCODE,'BL2117',B.RSLTNUM,'')) D_DIMER
     , MAX(DECODE(B.EXAMCODE,'BL2136',B.RSLTNUM,'')) PAI_1
     , MAX(DECODE(B.EXAMCODE,'BL2141',B.RSLTNUM,'')) TPA
     , MAX(DECODE(B.EXAMCODE,'BL3111',B.RSLTNUM,'')) T_PROTEIN
     , MAX(DECODE(B.EXAMCODE,'BL3112',B.RSLTNUM,'')) ALBUMIN
     , MAX(DECODE(B.EXAMCODE,'BL311201',B.RSLTNUM,'')) GLOBULIN
     , MAX(DECODE(B.EXAMCODE,'BL311202',B.RSLTNUM,'')) "A/G RATIO"
     , MAX(DECODE(B.EXAMCODE,'BL3114',B.RSLTNUM,'')) T_BILIRUBIN
     , MAX(DECODE(B.EXAMCODE,'BL3115',B.RSLTNUM,'')) AST
     , MAX(DECODE(B.EXAMCODE,'BL3116',B.RSLTNUM,'')) ALT
     , MAX(DECODE(B.EXAMCODE,'BL3117',B.RSLTNUM,'')) ALP
     , MAX(DECODE(B.EXAMCODE,'BL3118',B.RSLTNUM,'')) FBS
     , MAX(DECODE(B.EXAMCODE,'BL3119',B.RSLTNUM,'')) BUN
     , MAX(DECODE(B.EXAMCODE,'BL3120',B.RSLTNUM,'')) CR
     , MAX(DECODE(B.EXAMCODE,'BL312001',B.RSLTNUM,'')) "BUN/CR RATIO"
     , MAX(DECODE(B.EXAMCODE,'BL312002',B.RSLTNUM,'')) ESTIMATED_GFR
     , MAX(DECODE(B.EXAMCODE,'BL3121',B.RSLTNUM,'')) URIC_ACID
     , MAX(DECODE(B.EXAMCODE,'BL3122',B.RSLTNUM,'')) CA
     , MAX(DECODE(B.EXAMCODE,'BL3123',B.RSLTNUM,'')) P
     , MAX(DECODE(B.EXAMCODE,'BL3125',B.RSLTNUM,'')) GGT
     , MAX(DECODE(B.EXAMCODE,'BL3162',B.RSLTNUM,'')) GLUCOSE_PP2
     , MAX(DECODE(B.EXAMCODE,'BL3164',B.RSLTNUM,'')) HBA1C
     , MAX(DECODE(B.EXAMCODE,'NR4101',B.RSLTNUM,'')) T3
     , MAX(DECODE(B.EXAMCODE,'NR4102',B.RSLTNUM,'')) T4
     , MAX(DECODE(B.EXAMCODE,'NR4103',B.RSLTNUM,'')) TSH
     , MAX(DECODE(B.EXAMCODE,'NR4302',B.RSLTNUM,'')) THYROGLOBULIN
     , MAX(DECODE(B.EXAMCODE,'NR4303',B.RSLTNUM,'')) FREE_T4
     , MAX(DECODE(B.EXAMCODE,'NR4307',B.RSLTNUM,'')) FREE_T3
     , MAX(DECODE(B.EXAMCODE,'NR5101',B.RSLTNUM,'')) E2
     , MAX(DECODE(B.EXAMCODE,'NR5103',B.RSLTNUM,'')) PROGESTERONE
     , MAX(DECODE(B.EXAMCODE,'NR5106',B.RSLTNUM,'')) TESTOSTERONE
     , MAX(DECODE(B.EXAMCODE,'NR5107',B.RSLTNUM,'')) ALDOSTERONE
     , MAX(DECODE(B.EXAMCODE,'NR5108',B.RSLTNUM,'')) CORTISOL
     , MAX(DECODE(B.EXAMCODE,'NR5109',B.RSLTNUM,'')) DHEA_S
     , MAX(DECODE(B.EXAMCODE,'NR5110',B.RSLTNUM,'')) SHBG
     , MAX(DECODE(B.EXAMCODE,'NR5112',B.RSLTNUM,'')) ADH
     , MAX(DECODE(B.EXAMCODE,'NR5113',B.RSLTNUM,'')) FREE_TESTOSTERONE
     , MAX(DECODE(B.EXAMCODE,'NR6101',B.RSLTNUM,'')) ACTH
     , MAX(DECODE(B.EXAMCODE,'NR6102',B.RSLTNUM,'')) HGH
     , MAX(DECODE(B.EXAMCODE,'NR6103',B.RSLTNUM,'')) PROLACTIN
     , MAX(DECODE(B.EXAMCODE,'NR6104',B.RSLTNUM,'')) LH
     , MAX(DECODE(B.EXAMCODE,'NR6105',B.RSLTNUM,'')) FSH
     , MAX(DECODE(B.EXAMCODE,'NR6106',B.RSLTNUM,'')) IGF1
     , MAX(DECODE(B.EXAMCODE,'NR7104',B.RSLTNUM,'')) INSULIN
     , MAX(DECODE(B.EXAMCODE,'NR7105',B.RSLTNUM,'')) C_PEPTIDE
     , MAX(DECODE(B.EXAMCODE,'BL3181',B.RSLTNUM,'')) FREE_FATTY_ACID
     , MAX(DECODE(B.EXAMCODE,'BL3304',B.RSLTNUM,'')) APOA1
     , MAX(DECODE(B.EXAMCODE,'BL3305',B.RSLTNUM,'')) APOB
     , MAX(DECODE(B.EXAMCODE,'BL3307',B.RSLTNUM,'')) "LP(A)"
     , MAX(DECODE(B.EXAMCODE,'BL2021',B.RSLTNUM,'')) ESR
     , MAX(DECODE(B.EXAMCODE,'BL3140',B.RSLTNUM,'')) CRP
     , MAX(DECODE(B.EXAMCODE,'BL3A2502',B.RSLTNUM,'')) HOMOCYSTEINE
     , MAX(DECODE(B.EXAMCODE,'BL3113',B.RSLTNUM,'')) T_CHOLESTEROL
     , MAX(DECODE(B.EXAMCODE,'BL314201',B.RSLTNUM,'')) LDL_C
     , MAX(DECODE(B.EXAMCODE,'BL3142',B.RSLTNUM,'')) HDL_C
     , MAX(DECODE(B.EXAMCODE,'BL3141',B.RSLTNUM,'')) TG
     , MAX(DECODE(B.EXAMCODE,'BL3364',B.RSLTNUM,'')) LDL_SUBFRACTION
     , MAX(DECODE(B.EXAMCODE,'RM1010',TO_CHAR(B.RSLTTEXT),'')) B_MRI
     , MAX(DECODE(B.EXAMCODE,'RM1010HC',TO_CHAR(B.RSLTTEXT),'')) B_MRI_DEMENTIA
     , MAX(DECODE(B.EXAMCODE,'RM3170N',TO_CHAR(B.RSLTTEXT),'')) B_MRI_MRA
     , MAX(DECODE(B.EXAMCODE,'BM3170HC',TO_CHAR(B.RSLTTEXT),'')) B_MRI_MRA_DEMENTIA
     , MAX(DECODE(B.EXAMCODE,'BS2111',TO_CHAR(B.RSLTTEXT),'')) EKG
     , MAX(DECODE(B.EXAMCODE,'BS2231',TO_CHAR(B.RSLTTEXT),'')) ECHO
     , MAX(DECODE(B.EXAMCODE,'SM3750',TO_CHAR(B.RSLTTEXT),'')) GXT
     , MAX(DECODE(B.EXAMCODE,'BS2401',TO_CHAR(B.RSLTTEXT),'')) TREADMILL
     , MAX(DECODE(B.EXAMCODE,'RC32542',TO_CHAR(B.RSLTTEXT),'')) CORONARY_CT_ANGIO
  FROM JY06092T@DL_SDEV9_S A
     , STRESULT B
     , APPATBAT C
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND A.PATNO = C.PATNO
 GROUP BY A.ORDDATE, A.PATNO
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END
     , C.SEX
     , TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12);

-- 문진결과
SELECT /* INDEX(F SMQUESAT_PK) */
       A.ORDDATE||A.PATNO MST, A.ORDDATE, A.PATNO
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T006',F.ACODE1
                                                                      ,'3-1T',F.ACODE1
                                                                      ,''))                                             DRINK_YEAR     -- 음주기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C029Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C030Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C031Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C032Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211022C033Y',SUBSTR(F.QCODENM,3)--F.QCODENM -- 정밀
                                                                      ,'10361022C028Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C029Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C030Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C031Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C032Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361022C033Y',SUBSTR(F.QCODENM,3)--F.QCODENM -- 재진
                                                                      ,'3-2-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-6CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             DRINK_NUM      -- 음주횟수
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211023C034Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211023C035Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211023C036Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10211023C037Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C034Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C035Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C036Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'10361023C037Y',SUBSTR(F.QCODENM,3)--F.QCODENM
                                                                      ,'3-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             DRINK_AMT      -- 음주량
      , DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019C008Y','Y','0'))||  -- 과거
               MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10191020C008Y','Y'
                                                                            ,'1035C008Y','Y'
                                                                            ,'2-0-3CY','Y'
                                                                            ,'10191020A005Y','S'
                                                                            ,'1035C236Y','S'
                                                                            ,'2-0-2CY','S'
                                                                            ,'1019C026Y','N'
                                                                            ,'1035C026Y','N'
                                                                            ,'2-0-1CY','N'
                                                                            ,'0')) -- 현재
                                                                            ,'0S','PAST'
                                                                            ,'0N','NONE'
                                                                            ,'YN','오류'
                                                                            ,'0Y','CURRENT'
                                                                            ,'YY','CURRENT'
                                                                            ,'Y0','PAST'
                                                                            ,'YS','PAST'
                                                                            ,'')                                        SMOKEYN        -- 흡연여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T003',F.ACODE1
                                                                      ,'2-2T',F.ACODE1
                                                                      ,''))                                             SMOKE_YEAR     -- 흡연기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T004',F.ACODE1||'개비'
                                                                      ,'1035T004',F.ACODE1||'개비'
                                                                      ,'1035T004Y',F.ACODE1||'개비'
                                                                      ,'2-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             SMOKE_AMT      -- 흡연량
              , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5-0-1CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-0-2CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-0-3CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-0-4CY'   ,SUBSTR(F.QCODENM,3)
                                                        ,''))                               EXERCISES --운동여부
              , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5-1-1CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-1-2CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-1-3CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-1-4CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,''))                               EXEC_NUM --운동횟수
              , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5-2-1CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-2-2CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-2-3CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-2-4CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,'5-2-5CY'   ,SUBSTR(F.QCODENM,3)
                                                         ,''))                               EXEC_AMT --운동시간(양)
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'9001A105Y',F.CHECKYN
                                                                      ,'6-1-2-1CY',F.CHECKYN
                                                                      ,'6-1-2-2CY',F.CHECKYN
                                                                      ,'6-1-2-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_DM         -- 당뇨
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-2-4T',F.ACODE1,''))                         HIS_DM_AGE         -- 당뇨
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'9001A102Y',F.CHECKYN
                                                                      ,'6-1-1-1CY',F.CHECKYN
                                                                      ,'6-1-1-2CY',F.CHECKYN
                                                                      ,'6-1-1-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_BP         -- 고혈압
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-1-4T',F.ACODE1,''))                         HIS_BP_AGE         -- 고혈압
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-5-1CY',F.CHECKYN
                                                                      ,'6-1-5-2CY',F.CHECKYN
                                                                      ,'6-1-5-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_MI         -- 심근경색
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-5-6T',F.ACODE1,''))                         HIS_MI_AGE         -- 심근경색
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-4-1CY',F.CHECKYN
                                                                      ,'6-1-4-2CY',F.CHECKYN
                                                                      ,'6-1-4-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_ANGINA     -- 협심증
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-4-6T',F.ACODE1,''))                         HIS_ANGINA_AGE         -- 협심증
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-7-1CY',F.CHECKYN
                                                                      ,'6-1-7-2CY',F.CHECKYN
                                                                      ,'6-1-7-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_HEPATITIS_B-- B형 간염
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-7-4T',F.ACODE1,''))                         HIS_HEPATITIS_B_AGE         -- 협심증
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-8-1CY',F.CHECKYN
                                                                      ,'6-1-8-2CY',F.CHECKYN
                                                                      ,'6-1-8-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_HEPATITIS_C-- C형 간염
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'6-1-8-4T',F.ACODE1,''))                         HIS_HEPATITIS_C_AGE         -- 협심증
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'9001A104Y',F.CHECKYN
                                                                      ,'6-1-6-1CY',F.CHECKYN
                                                                      ,'6-1-6-2CY',F.CHECKYN
                                                                      ,'6-1-6-3CY',F.CHECKYN
                                                                      ,''))                                             HIS_STROKE         -- 당뇨
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'7-1-3-1CY',F.CHECKYN
                                                                      ,'7-1-3-2CY',F.CHECKYN
                                                                      ,''))                                             PH_HYPERLIPID         -- 고지혈증약
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5007Y002',F.ACODE1
                                                                      ,'21-1T',F.ACODE1
                                                                      ,''))                                             MENOPAUSE_AGE    -- 폐경나이
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'50075008C038',SUBSTR(F.QCODENM,3)
                                                                      ,'50075008C203',SUBSTR(F.QCODENM,3)
                                                                      ,'50075008C204',SUBSTR(F.QCODENM,3)
                                                                      ,'50075008C205',SUBSTR(F.QCODENM,3)
                                                                      ,'50075008C206',SUBSTR(F.QCODENM,3)
                                                                      ,'21-2-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'21-2-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'21-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'21-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'21-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             MENOPAUSE_CAUSE    -- 폐경나이
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-1-1CY',G.FOODBASEQTY
                                                  ,'24-1-2CY',G.FOODBASEQTY
                                                  ,'24-1-3CY',G.FOODBASEQTY
                                                  ,'24-1-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_01
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-2-1CY',G.FOODBASEQTY
                                                  ,'24-2-2CY',G.FOODBASEQTY
                                                  ,'24-2-3CY',G.FOODBASEQTY
                                                  ,'24-2-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_02
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-3-1CY',G.FOODBASEQTY
                                                  ,'24-3-2CY',G.FOODBASEQTY
                                                  ,'24-3-3CY',G.FOODBASEQTY
                                                  ,'24-3-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_03
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-4-1CY',G.FOODBASEQTY
                                                  ,'24-4-2CY',G.FOODBASEQTY
                                                  ,'24-4-3CY',G.FOODBASEQTY
                                                  ,'24-4-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_04
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-5-1CY',G.FOODBASEQTY
                                                  ,'24-5-2CY',G.FOODBASEQTY
                                                  ,'24-5-3CY',G.FOODBASEQTY
                                                  ,'24-5-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_05
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-6-1CY',G.FOODBASEQTY
                                                  ,'24-6-2CY',G.FOODBASEQTY
                                                  ,'24-6-3CY',G.FOODBASEQTY
                                                  ,'24-6-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_06
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-7-1CY',G.FOODBASEQTY
                                                  ,'24-7-2CY',G.FOODBASEQTY
                                                  ,'24-7-3CY',G.FOODBASEQTY
                                                  ,'24-7-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_07
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-8-1CY',G.FOODBASEQTY
                                                  ,'24-8-2CY',G.FOODBASEQTY
                                                  ,'24-8-3CY',G.FOODBASEQTY
                                                  ,'24-8-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_08
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-9-1CY',G.FOODBASEQTY
                                                  ,'24-9-2CY',G.FOODBASEQTY
                                                  ,'24-9-3CY',G.FOODBASEQTY
                                                  ,'24-9-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_09
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-10-1CY',G.FOODBASEQTY
                                                  ,'24-10-2CY',G.FOODBASEQTY
                                                  ,'24-10-3CY',G.FOODBASEQTY
                                                  ,'24-10-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_10
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-11-1CY',G.FOODBASEQTY
                                                  ,'24-11-2CY',G.FOODBASEQTY
                                                  ,'24-11-3CY',G.FOODBASEQTY
                                                  ,'24-11-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_11
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-12-1CY',G.FOODBASEQTY
                                                  ,'24-12-2CY',G.FOODBASEQTY
                                                  ,'24-12-3CY',G.FOODBASEQTY
                                                  ,'24-12-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_12
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-13-1CY',G.FOODBASEQTY
                                                  ,'24-13-2CY',G.FOODBASEQTY
                                                  ,'24-13-3CY',G.FOODBASEQTY
                                                  ,'24-13-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_13
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-14-1CY',G.FOODBASEQTY
                                                  ,'24-14-2CY',G.FOODBASEQTY
                                                  ,'24-14-3CY',G.FOODBASEQTY
                                                  ,'24-14-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_14
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-15-1CY',G.FOODBASEQTY
                                                  ,'24-15-2CY',G.FOODBASEQTY
                                                  ,'24-15-3CY',G.FOODBASEQTY
                                                  ,'24-15-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_15
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-16-1CY',G.FOODBASEQTY
                                                  ,'24-16-2CY',G.FOODBASEQTY
                                                  ,'24-16-3CY',G.FOODBASEQTY
                                                  ,'24-16-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_16
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-17-1CY',G.FOODBASEQTY
                                                  ,'24-17-2CY',G.FOODBASEQTY
                                                  ,'24-17-3CY',G.FOODBASEQTY
                                                  ,'24-17-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_17
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-18-1CY',G.FOODBASEQTY
                                                  ,'24-18-2CY',G.FOODBASEQTY
                                                  ,'24-18-3CY',G.FOODBASEQTY
                                                  ,'24-18-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 PWI_SF_18
  FROM JY06092T@DL_SDEV9_S A
     , SMQUESAT F
     , SMQUESMT G
 WHERE A.PATNO = F.PATNO
   AND A.ORDDATE = F.ORDDATE
   AND SUBSTR(F.QCODE1,1,4) IN (
                                '9001'  -- 질병력,과거
                               ,'6-1-'  -- 질병력,현재
                               ,'1019'  -- 초진흡연
                               ,'1035'  -- 재진흡연
                               ,'2-0-'  -- 흡연여부
                               ,'2-2'   -- 흡연기간
                               ,'2-3-'  -- 흡연량
                               ,'1021'  -- 초진음주
                               ,'1036'  -- 재진음주
                               ,'3-0-'  -- 음주여부
                               ,'3-1'   -- 음주기간
                               ,'3-2-'  -- 음주횟수
                               ,'3-3-'  -- 음주량
                               ,'5-0-'  -- 운동여부
                               ,'5-1-'  -- 운동횟수
                               ,'5-2-'  -- 운동시간(양)
                               ,'7-1-'  -- 약복용력
                               ,'5007'  -- 폐경질문
                               ,'21-1'  -- 폐경나이
                               ,'21-2'  -- 폐경원인
                               ,'24-1'  -- 스트레스01
                               ,'24-2'  -- 스트레스
                               ,'24-3'  -- 스트레스
                               ,'24-4'  -- 스트레스
                               ,'24-5'  -- 스트레스
                               ,'24-6'  -- 스트레스
                               ,'24-7'  -- 스트레스
                               ,'24-8'  -- 스트레스
                               ,'24-9'  -- 스트레스
                               )
   AND F.QCODE1 = G.QCODE
 GROUP BY A.ORDDATE, A.PATNO
