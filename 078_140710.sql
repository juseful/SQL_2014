-- 국적미등록자 조회
SELECT A.*, B.ZIPADDR, B.ADDRESS, B.ZIPADDR2, B.ADDRESS2, C.RMK, C.DELSNDNO
    ,  (
        SELECT MAX(X.CMT)
          FROM SMPTIFDT X
         WHERE A.PATNO = X.PATNO
           AND X.CMTCODE = 'WA0108'
         GROUP BY X.PATNO
       ) CMT
  FROM (
-- 2013.01.29 기준변경. 주민번호 뒷자리만 기준으로 삼음!!
-- 외국인 인원 및 매출
SELECT A.ORDDATE, A.PATNO, substr(A.PATNAME,1,4)||'**' patname, A.RESNO2, A.FRNCODE, A.CODENAME, A.FRNREGYN, A.FRNINPATH, SUM(B.CREAMT)/1000 AMT
  FROM (
        SELECT A.RSVNOSM, A.PATNO, A.PATNAME, A.ORDDATE, A.RESNO2, MAX(A.FRNCODE) FRNCODE, MAX(A.CODENAME) CODENAME
             , MAX(A.FRNREGYN) FRNREGYN, MAX(A.FRNINPATH) FRNINPATH
          FROM (
                -- 국적 정보가 있는 사람
                SELECT A.RSVNOSM, A.PATNO, B.PATNAME, A.ORDDATE, substr(B.RESNO2,1,1)||'******' resno2, B.FRNCODE, C.CODENAME
                     , E.FRNREGYN, F.CODENAME FRNINPATH
                  FROM SMRSV00T A, SMPKGMST D, APPATBAT B, CCCOMCDT C, APPATSBT E, CCCOMCDT F
                 WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD') AND TO_DATE('&D2','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = D.PKGCODE
                   AND SUBSTR(D.PKGTYP,1,1) != '7'
                   AND A.PATNO = B.PATNO
                   AND SUBSTR(B.RESNO2,1,1) IN ('5','6','7','8')
                   AND C.GRPCODE = 'AP015'
                   AND NVL(B.FRNCODE,'000') = C.CODE
                   AND A.PKGCODE != 'THSL'
                   AND A.PATNO = E.PATNO
                   AND F.GRPCODE = 'AP124'
                   AND E.FRNINPATH = F.CODE
                UNION
                -- 국적 정보가 없는 사람
                SELECT A.RSVNOSM, A.PATNO, B.PATNAME, A.ORDDATE, substr(B.RESNO2,1,1)||'******' resno2, '', '', '', ''
                  FROM SMRSV00T A, SMPKGMST D, APPATBAT B
                 WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD') AND TO_DATE('&D2','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = D.PKGCODE
                   AND SUBSTR(D.PKGTYP,1,1) != '7'
                   AND A.PATNO = B.PATNO
                   AND SUBSTR(B.RESNO2,1,1) IN ('5','6','7','8')
                   AND A.PKGCODE != 'THSL'
               ) A
         GROUP BY A.RSVNOSM, A.PATNO, A.PATNAME, A.ORDDATE, A.RESNO2
       ) A
     , SMRCP00T B
 WHERE A.RSVNOSM = B.RSVNOSM(+)
   AND NVL(B.RCPTYP,'0') IN ('0','7','8')
 GROUP BY A.ORDDATE, A.PATNO, A.PATNAME, A.RESNO2, A.FRNCODE, A.CODENAME, A.FRNREGYN, A.FRNINPATH
       ) A
     , APPATBAT B
     , SMRSV00T C
 WHERE A.FRNCODE IS NULL
   AND A.PATNO = B.PATNO
   AND A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
