-- 최종
SELECT A.*
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , (SELECT X.SEX FROM APPATBAT X WHERE A.PATNO = X.PATNO)  SEX
     , (SELECT TRUNC(MONTHS_BETWEEN(A.ORDDATE,X.BIRTHDAY)/12) FROM APPATBAT X WHERE A.PATNO = X.PATNO) AGE
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A102Y','Y'
                                                ,'6-1-1-1CY','Y'
                                                ,'6-1-1-2CY','Y'
                                                ,'6-1-1-3CY','Y'
                                                ,'6-1-1-4CY','Y'
                                                ,'6-1-1-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-1%'
               )
       )  "Hx_고혈압"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A105Y','Y'
                                                ,'6-1-2-1CY','Y'
                                                ,'6-1-2-2CY','Y'
                                                ,'6-1-2-3CY','Y'
                                                ,'6-1-2-4CY','Y'
                                                ,'6-1-2-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-2%'
               )
       )   "Hx_당뇨병"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A118Y','Y',''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '9001'
       )   "Hx_갑상선질환"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-18-1CY','Y'
                                                ,'6-1-18-2CY','Y'
                                                ,'6-1-18-3CY','Y'
                                                ,'6-1-18-4CY','Y'
                                                ,'6-1-18-5CY','Y'
                                                                 ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-18%'
               )
       )   "Hx_갑상선기능저하증및항진증"
     , (
        SELECT /* INDEX(X SMQUESAT_PK)*/
        MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-19-1CY','Y'
                                                ,'6-1-19-2CY','Y'
                                                ,'6-1-19-3CY','Y'
                                                ,'6-1-19-4CY','Y'
                                                ,'6-1-19-5CY','Y'
                                                                ,''))
          FROM SMQUESAT f
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND (F.QCODE1 LIKE '9001'
               OR
                F.QCODE1 LIKE '6-1-19%'
               )
       )   "Hx_갑상선결절및낭종"
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) DBP
     , MAX(DECODE(B.EXAMCODE,'NR4103',B.RSLTNUM,''))     "TSH"
     , MAX(DECODE(B.EXAMCODE,'NR4101',B.RSLTNUM,''))     "T3"
     , MAX(DECODE(B.EXAMCODE,'NR4303',B.RSLTNUM,''))     "Free T4"
     , MAX(DECODE(B.EXAMCODE,'NR4201',B.RSLTNUM,''))     "THYROGLOBULIN Ab"
     , MAX(DECODE(B.EXAMCODE,'NR4202',B.RSLTNUM,''))     "Microsomal Ab"
  FROM (
                SELECT A.PATNO, MIN(A.ORDDATE) ORDDATE
                  FROM SMRSV00T A, SMPKGMST B
                 WHERE
--                       A.PATNO = ''
--                   AND
                       A.ORDDATE BETWEEN TO_DATE('20090101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = B.PKGCODE
                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4103' --TSH
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4303' --FREE T4
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'NR4101' --T3
                              )
                   AND EXISTS (
                               SELECT /* INDEX (X MMEXMORT_PK)*/ 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE in ('NR4201' --THYROGLOBULIN Ab
                                                   ,'NR4202' --Microsomal Ab
                                                   )
                              )
                 GROUP BY A.PATNO
       ) A
     , STRESULT B
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND EXISTS (-- 건진처방 결과만 가져오기
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE B.PATNO = X.PATNO
                  AND B.ORDDATE = X.ORDDATE
                  AND B.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.PATNO, A.ORDDATE
