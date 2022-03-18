-- 외국인 인원 및 매출
-- 2014.11.01 쿼리 변경!!
SELECT A.ORDDATE, SUBSTR(A.PATNO,1,5)||'****' PATNO, A.PKGCODE, SUBSTR(C.PATNAME,1,4)||'***' PATNAME, C.RESNO2
     , C.FRNCODE
     , (
        SELECT X.CODENAME
          FROM CCCOMCDT X
         WHERE X.GRPCODE = 'AP015'
           AND NVL(C.FRNCODE,'000') = X.CODE
       ) NATION
     , (
        SELECT X.FRNREGYN
          FROM APPATSBT X
         WHERE A.PATNO = X.PATNO
       ) FRNREGYN
     , (
        SELECT Y.CODENAME
          FROM APPATSBT X, CCCOMCDT Y
         WHERE A.PATNO = X.PATNO
           AND Y.GRPCODE = 'AP124'
           AND X.FRNINPATH = Y.CODE
       ) FRNINPATH
     , (
        SELECT X.USERID||'-'||X.USERNAME
          FROM CSUSERMT X
         WHERE A.CODY = X.USERID
       ) CODY
     , (
        SELECT SUM(X.CREAMT)
          FROM SMRCP00T X
         WHERE A.RSVNOSM = X.RSVNOSM
           AND X.RCPTYP IN ('0','7','8')
       ) AMT
  FROM SMRSV00T A, SMPKGMST B, APPATBAT C
 WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD') AND TO_DATE('&D2','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND (
        SUBSTR(B.PKGTYP,1,1) != '7'
       AND
        B.PKGTYP != '5W'
       )
   AND A.PATNO = C.PATNO
   AND SUBSTR(C.RESNO2,1,1) IN ('5','6','7','8')