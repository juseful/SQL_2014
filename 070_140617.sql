SELECT
       CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , (
        SELECT Z.CODENAME
          FROM SMRSV00T X, SMPKGMST Y, CCCOMCDT Z
         WHERE A.PATNO = X.PATNO
           AND A.FSO = X.ORDDATE
           AND X.PKGCODE = Y.PKGCODE
           AND Z.GRPCODE = 'SMM02'
           AND Y.PKGTYP = Z.CODE
       ) "2009"
     , (
        SELECT Z.CODENAME
          FROM SMRSV00T X, SMPKGMST Y, CCCOMCDT Z
         WHERE A.PATNO = X.PATNO
           AND A.SO = X.ORDDATE
           AND X.PKGCODE = Y.PKGCODE
           AND Z.GRPCODE = 'SMM02'
           AND Y.PKGTYP = Z.CODE
       ) "2010"
     , (
        SELECT Z.CODENAME
          FROM SMRSV00T X, SMPKGMST Y, CCCOMCDT Z
         WHERE A.PATNO = X.PATNO
           AND A.TIO = X.ORDDATE
           AND X.PKGCODE = Y.PKGCODE
           AND Z.GRPCODE = 'SMM02'
           AND Y.PKGTYP = Z.CODE
       ) "2011"
     , (
        SELECT Z.CODENAME
          FROM SMRSV00T X, SMPKGMST Y, CCCOMCDT Z
         WHERE A.PATNO = X.PATNO
           AND A.FO = X.ORDDATE
           AND X.PKGCODE = Y.PKGCODE
           AND Z.GRPCODE = 'SMM02'
           AND Y.PKGTYP = Z.CODE
       ) "2012"
     , (
        SELECT Z.CODENAME
          FROM SMRSV00T X, SMPKGMST Y, CCCOMCDT Z
         WHERE A.PATNO = X.PATNO
           AND A.FIO = X.ORDDATE
           AND X.PKGCODE = Y.PKGCODE
           AND Z.GRPCODE = 'SMM02'
           AND Y.PKGTYP = Z.CODE
       ) "2013"
  FROM (
        SELECT A.PATNO, A.ORDDATE FSO
             , (
                SELECT MAX(ORDDATE)
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND X.ORDDATE BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20101231','YYYYMMDD')
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) SO
             , (
                SELECT MAX(ORDDATE)
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND X.ORDDATE BETWEEN TO_DATE('20110101','YYYYMMDD') AND TO_DATE('20111231','YYYYMMDD')
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) TIO
             , (
                SELECT MAX(ORDDATE)
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND X.ORDDATE BETWEEN TO_DATE('20120101','YYYYMMDD') AND TO_DATE('20121231','YYYYMMDD')
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) FO
             , (
                SELECT MAX(ORDDATE)
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND X.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) FIO
          FROM (
                SELECT A.PATNO, MAX(A.ORDDATE) ORDDATE
                  FROM SMRSV00T A, SMPKGMST B
                 WHERE
        --               A.PATNO = ''
        --           AND
                       A.ORDDATE BETWEEN TO_DATE('20090101','YYYYMMDD') AND TO_DATE('20091231','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = B.PKGCODE
                   AND B.PKGTYP IN ('4A','4B','1P')
                 GROUP BY A.PATNO
               ) A
       ) A
