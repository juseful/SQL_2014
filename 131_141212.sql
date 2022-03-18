-- 재진
                                SELECT B.ORDDATE
                                     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
                                            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                                            ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                                        END PATNO2
                                     , A.PATNO, B.RSVNOSM
                                     , 성별찾기펑션(A.PATNO) SEX
                                     , (
                                        SELECT TRUNC(MONTHS_BETWEEN(B.ORDDATE,C.BIRTHDAY)/12)
                                          FROM APPATBAT C
                                         WHERE A.PATNO = C.PATNO
                                       ) AGE
                                     , B.PKGCODE
                                     , DECODE(B.CONTNO,'','개인','단체') CONTGRP
                                     , (
                                        SELECT DECODE(SUBSTR(C.RESNO2,1,1),'5','F','6','F','7','F','8','F','D')
                                          FROM APPATBAT C
                                         WHERE A.PATNO = C.PATNO
                                       ) NATIONGRP
                                     , (
                                        SELECT SUM(X.CREAMT)
                                          FROM SMRCP00T X
                                         WHERE B.RSVNOSM = X.RSVNOSM
                                           AND X.RCPTYP IN ('0','7','8')
                                       ) AMT
                                  FROM
                                       (
                                        SELECT DISTINCT A.PATNO
                                          FROM SMRSV00T A, SMPKGMST B
                                         WHERE A.ORDDATE BETWEEN TO_DATE(TO_CHAR(TO_DATE(&D1,'YYYYMMDD'),'YYYY')-1||'0101','YYYYMMDD') AND TO_DATE(TO_CHAR(TO_DATE(&D2,'YYYYMMDD'),'YYYY')-1||'1231','YYYYMMDD')
                                                                 --TO_dATE('20131101','YYYYMMDD') AND TO_DATE('20131130','YYYYMMDD')
                                           AND A.CANCELTIME IS NULL
                                           AND A.PKGCODE = B.PKGCODE
                                           AND B.PKGTYP = '0'
                                       ) A
                                     , SMRSV00T B
                                     , SMPKGMST C
                                 WHERE A.PATNO = B.PATNO
                                   AND B.CANCELTIME IS NULL
                                   AND B.ORDDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                                   AND B.PKGCODE = C.PKGCODE
                                   AND C.PKGTYP = '0'

-- 전체인원
                                SELECT A.ORDDATE
                                     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
                                            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                                            ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                                        END PATNO2
                                     , A.PATNO, A.RSVNOSM
                                     , 성별찾기펑션(A.PATNO) SEX
                                     , (
                                        SELECT TRUNC(MONTHS_BETWEEN(A.ORDDATE,C.BIRTHDAY)/12)
                                          FROM APPATBAT C
                                         WHERE A.PATNO = C.PATNO
                                       ) AGE
                                     , A.PKGCODE
                                     , DECODE(A.CONTNO,'','개인','단체') CONTGRP
                                     , (
                                        SELECT DECODE(SUBSTR(C.RESNO2,1,1),'5','F','6','F','7','F','8','F','D')
                                          FROM APPATBAT C
                                         WHERE A.PATNO = C.PATNO
                                       ) NATIONGRP
                                     , (
                                        SELECT SUM(X.CREAMT)
                                          FROM SMRCP00T X
                                         WHERE A.RSVNOSM = X.RSVNOSM
                                           AND X.RCPTYP IN ('0','7','8')
                                       ) AMT
                                  FROM
                                       (
                                        SELECT A.*
                                          FROM SMRSV00T A, SMPKGMST B
                                         WHERE A.ORDDATE BETWEEN TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')
                                           AND A.CANCELTIME IS NULL
                                           AND A.PKGCODE = B.PKGCODE
                                           AND B.PKGTYP = '0'
                                       ) A
