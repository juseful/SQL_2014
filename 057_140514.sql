-- 대상자 기본
SELECT COUNT(A.RSVNOSM)
  FROM SMRSV00T A, APPATBAT B, MMEXMORT C
 WHERE A.ORDDATE BETWEEN TO_DAte('20040101','YYYYMMDD') AND TO_DATE('20040110','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PATNO = B.PATNO
   AND B.SEX = 'M'
   AND TRUNC(MONTHS_BETWEEN(A.ORDDATE,B.BIRTHDAY)/12) > '39'
   AND A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
   AND C.ORDCODE IN ('NR1107','BL3713')
   AND C.PROCSTAT = 'G';

-- 매년 PSA 검사를 받은 수진자 수
SELECT COUNT(A.PATNO) CNT
  FROM (
        SELECT A.*
             , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY A.ORDYEAR) RN
          FROM (
                SELECT DISTINCT A.PATNO, TO_CHAR(C.ORDDATE,'YYYY') ORDYEAR
                  FROM (-- 대상자 기본
                        SELECT A.PATNO, MIN(C.ORDDATE) ORDDATE
                          FROM SMRSV00T A, APPATBAT B, MMEXMORT C
                         WHERE A.ORDDATE BETWEEN TO_DAte('20040101','YYYYMMDD') AND TO_DATE('20041231','YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.PATNO = B.PATNO
                           AND B.SEX = 'M'
                           AND TRUNC(MONTHS_BETWEEN(A.ORDDATE,B.BIRTHDAY)/12) > '39'
                           AND A.PATNO = C.PATNO
                           AND A.ORDDATE = C.ORDDATE
                           AND C.ORDCODE IN ('NR1107','BL3713')
                           AND C.PROCSTAT = 'G'
                         GROUP BY A.PATNO
                       ) A
                     , SMRSV00T C
                     , SMPKGMST D
                     , MMEXMORT B
                 WHERE A.PATNO = C.PATNO
                   AND C.CANCELTIME IS NULL
                   AND A.ORDDATE < C.ORDDATE
                   AND C.ORDDATE < TO_DATE('20140101','YYYYMMDD')
                   AND C.PKGCODE = D.PKGCODE
                   AND SUBSTR(D.PKGTYP,1,1) IN ('0','1','2','3','4')
                   AND C.PATNO = B.PATNO
                   AND C.ORDDATE = B.ORDDATE
                   AND B.PATFG = 'G'
                   AND B.ORDCODE IN ('NR1107','BL3713')
               ) A
       ) A
 WHERE A.ORDYEAR = '2013'
   AND A.RN = '9';
