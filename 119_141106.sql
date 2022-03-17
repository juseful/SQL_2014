SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTHS"
     , DECODE(A.PKGCODE,'SBM' ,'2.그룹임원'
                       ,'SCEM','2.그룹임원'
                       ,'SPM' ,'2.그룹임원'
                       ,'SBME','2.그룹임원'
                       ,'SPME','2.그룹임원'
                       ,'SBF' ,'2.그룹임원'
                       ,'SCEF','2.그룹임원'
                       ,'SPF' ,'2.그룹임원'
                       ,'SBFE','2.그룹임원'
                       ,'SPFE','2.그룹임원'
             ,'1.일반정규') GRPGUBUN
     , COUNT(A.PATNO) CNT
  FROM SMRSV00T A
 WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20141031','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE A.PATNO = X.PATNO
                  AND A.ORDDATE = X.ORDDATE
                  AND X.ORDCODE LIKE 'NX%'
                  AND X.PATFG = 'G'
                  AND X.PROCSTAT > 'C'
              )
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')
     , DECODE(A.PKGCODE,'SBM' ,'2.그룹임원'
                       ,'SCEM','2.그룹임원'
                       ,'SPM' ,'2.그룹임원'
                       ,'SBME','2.그룹임원'
                       ,'SPME','2.그룹임원'
                       ,'SBF' ,'2.그룹임원'
                       ,'SCEF','2.그룹임원'
                       ,'SPF' ,'2.그룹임원'
                       ,'SBFE','2.그룹임원'
                       ,'SPFE','2.그룹임원'
             ,'1.일반정규')
 ORDER BY 2,1;
