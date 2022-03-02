-- 응급실 진료이력
SELECT A.PATNO
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       END PATNO2
     , DECODE(SUBSTR(B.PKGTYP,1,1),'4','숙박','프리미엄') PKGTYP
     , (
        SELECT COUNT(X.ADMTIME)
          FROM APIPDLST X
         WHERE A.PATNO = X.PATNO
           AND X.PATFG = 'E' -- 응급실 구분
           AND X.RCPYN = 'Y' -- 실제 응급실 진료를 본 사람만 체크
           and X.ADMTIME BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')+0.99999
       ) CNT
  FROM SMRSV00T A, SMPKGMST B
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.PKGCODE = B.PKGCODE
   AND B.PKGTYP IN ('4A','4B','1P');

-- 외래 진료이력
SELECT B.*
     , (
        SELECT D.DIAGCODE||'-'||D.DIAGNAME
          FROM MMPDIAGT D
         WHERE B.PATNO = D.PATNO
           AND B.MEDDATE = D.MEDDATE
           AND B.MEDDEPT = D.MEDDEPT
           AND B.MEDDR = D.CHADR
           AND D.MAINYN = 'Y'
       ) DIAGINFO
  FROM (
        SELECT A.PATNO
             , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
                    THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
               ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
               END PATNO2
             , B.MEDDATE, B.MEDDEPT, B.MEDDR||'-'||C.USERNAME MEDDRINFO, B.MEDDR
          FROM (
                SELECT A.PATNO
                  FROM SMRSV00T A, SMPKGMST B
                 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = B.PKGCODE
                   AND B.PKGTYP IN ('4A','4B','1P')
               ) A
             , APOPDLST B
             , CSUSERMT C
         WHERE A.PATNO = B.PATNO
           AND B.MEDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
           and (-- 부도 내역 제외 조건
                 (-- 선택 조건1
--                  B.MEDDATE <  trunc(sysdate)
--                  and
                    B.MEDYN = 'Y'
                 )
--                 or
--                 (-- 선택 조건2
--                  a.MEDDATE >= trunc(sysdate)
--                 )
                 and B.REJTTIME is null -- 필수조건
               )
           AND B.RSVTYP != '8'
           AND B.MEDDR = C.USERID
       ) B
 ORDER BY 2,3
