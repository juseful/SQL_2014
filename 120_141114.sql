SELECT A.*
     , SUBSTR(A.PKGTYP,1,1) PKGGRP
     , (
        SELECT SUM(CREAMT)
          FROM SMRCP00T B
         WHERE A.RSVNOSM = B.RSVNOSM
           AND B.RCPTYP IN ('0','7','8')
       ) RCPAMT
  FROM (-- 실제 건진 예약 및 실시
        SELECT A.REQTIME
             , A.REQID
             , (
                SELECT X.USERNAME
                  FROM CSUSERMT X
                 WHERE A.REQID = X.USERID
               ) REQDRNM
             , (
                SELECT X.DEPTCODE
                  FROM CSUSERMT X
                 WHERE A.REQID = X.USERID
               ) DEPTCODE
             , A.PATNO
             , (
                SELECT X.RSVNOSM
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND A.ORDEPTDATE = X.ORDEPTDATE
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) RSVNOSM
             , A.ORDEPTDATE
             , A.ORDDATE
             , (
                SELECT X.PKGCODE
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND A.ORDEPTDATE = X.ORDEPTDATE
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) PKGCODE
             , (
                SELECT Y.PKGTYP
                  FROM SMRSV00T X, SMPKGMST Y
                 WHERE A.PATNO = X.PATNO
                   AND A.ORDEPTDATE = X.ORDEPTDATE
                   AND X.CANCELTIME IS NULL
                   AND X.PKGCODE = Y.PKGCODE
                   AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
               ) PKGTYP
          FROM (-- 건진의뢰 대상자
                SELECT A.*
                     , (
                        SELECT X.REQID
                          FROM SMREQUMT X
                         WHERE A.REQTIME = X.REQTIME
                           AND A.PATNO = X.PATNO
                       ) REQID
                     , (
                        SELECT MIN(ORDEPTDATE)
                          FROM SMRSV00T X, SMPKGMST Y
                         WHERE A.PATNO = X.PATNO
                           AND X.ORDEPTDATE > TO_CHAR(A.REQTIME,'YYYY-MM-DD')
                           AND X.CANCELTIME IS NULL
                           AND X.PKGCODE = Y.PKGCODE
                           AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
                       ) ORDEPTDATE
                     , (
                        SELECT MIN(ORDDATE)
                          FROM SMRSV00T X, SMPKGMST Y
                         WHERE A.PATNO = X.PATNO
                           AND X.ORDDATE > TO_CHAR(A.REQTIME,'YYYY-MM-DD')
                           AND X.CANCELTIME IS NULL
                           AND X.PKGCODE = Y.PKGCODE
                           AND SUBSTR(Y.PKGTYP,1,1) IN ('0','1','2','3','4')
                       ) ORDDATE
                  FROM (
                        SELECT MIN(A.REQTIME) REQTIME, A.PATNO
                          FROM SMREQUMT A, CSUSERMT D
                         WHERE A.REQTIME BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20141031','YYYYMMDD')
                           AND A.REQID = D.USERID
                         GROUP BY A.PATNO
                       ) A
               ) A
       ) A
