SELECT TO_CHAR(A.ORDDATE,'YYYY') "YEAR", A.AMTGRP, A.PKGTYP, A.CUSTTYP, A.FRGUBUN, COUNT(A.PATNO) CNT
  FROM (
        SELECT A.*
             , A.SM_OPAMT+A.SM_AMT SUMAMT
             , CASE
                    WHEN A.SM_OPAMT+A.sm_amt >= '10000000' THEN '1.1000만원 이상'
                    WHEN A.SM_OPAMT+A.sm_amt >= '5000000'  THEN '2.500만원 ~ 1000만원 미만'
                    WHEN A.SM_OPAMT+A.sm_amt >= '3000000'  THEN '3.300만원 ~ 500만원 미만'
                    WHEN A.SM_OPAMT+A.sm_amt >= '2000000'  THEN '4.200만원 ~ 300만원 미만'
                    WHEN A.SM_OPAMT+A.sm_amt >= '1000000'  THEN '5.100만원 ~ 200만원 미만'
                    WHEN A.SM_OPAMT+A.sm_amt >= '600000'   THEN '6.60만원 ~ 100만원 미만'
                    WHEN A.SM_OPAMT+A.sm_amt >= '400000'   THEN '7.40만원 ~ 60만원 미만'
               ELSE '8.40만원 미만' END AMTGRP
          FROM (
                SELECT A.*, NVL(A.SM_AMT_PAST,'0') SM_OPAMT
                  FROM (
                        select decode(a.contno ,'', '개인','단체') CUSTTYP
                             , a.orddate
                             , a.patno
                             , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
                                    THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                               ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
                             , D.PATNAME
                             , d.sex
                             , 나이계산펑션(a.patno, sysdate) age
                             , DECODE(SUBSTR(D.RESNO2,1,1),'1','내국인','2','내국인','3','내국인','4','내국인','외국인') FRGUBUN
                             , A.MEDLOCATFG
                             , a.pkgcodE
                             , DECODE(SUBSTR(E.PKGTYP,1,1),'3',E.PKGTYP,SUBSTR(E.PKGTYP,1,1)) PKGTYP
                             , ( /* 과거 숙박건진 비용 산정. 20100915까지는 외래 수납함. */
                                SELECT NVL(X.AMT,'0') AMT
                                  FROM (--숙박PKG 수익...20090130 수정..위치를 입원기준으로 변경
                                        SELECT X.MEDLOCATFG, X.PKGTYP, x.PATNO, X.RSVNOSM, SUM(INSPRICE) AMT
                                          FROM (
                                                SELECT --A.MEDLOCATFG,
                                                        B.PKGTYP, A.PATNO, A.ORDDATE, A.PKGCODE, C.ORDCODE, D.INSPRICE, D.FROMDATE, D.TODATE, E.MEDLOCATFG, A.RSVNOSM
                                                  FROM SMRSV00T A, SMPKGMST B, MMEXMORT C, AIPRICST D, APIPDLST E
                                                 WHERE A.ORDDATE BETWEEN to_date('20090101','yyyymmdd') and to_date('20100915','yyyymmdd')
                                                   AND A.CANCELTIME IS NULL
                                                   AND A.PKGCODE = B.PKGCODE
                                                   AND SUBSTR(B.PKGTYP,1,1) = '4'
                                                   AND A.PATNO = C.PATNO
                                                   AND C.ORDDATE = A.ORDDATE
                                                   AND SUBSTR(C.ORDCODE,1,2) = 'SM'
                                                   AND C.PATFG = 'I'
                                                   AND C.ORDCODE = D.SUGACODE
                                                   AND C.ORDDATE BETWEEN D.FROMDATE AND D.TODATE
                                                   AND A.PATNO = E.PATNO
                                                   AND A.ORDDATE BETWEEN TRUNC(E.ADMTIME) AND TRUNC(E.DSCHTIME)
                                                   AND E.MEDDEPT = 'SM'
                                               )X
                                         GROUP BY X.MEDLOCATFG, X.PKGTYP, x.patno, X.RSVNOSM
                                       ) X
                                 WHERE A.RSVNOSM = X.RSVNOSM
                               ) SM_AMT_PAST
                             ,  (select NVL(SUM(DECODE(X.PSNGRPTYP,'G',DECODE(X.RCPTYP,'0',X.CREAMT),X.CREAMT)),'0')
                                   from smrcp00t x
                                  where x.rsvnosm =  a.rsvnosm
                                    ) sm_amt
                             , D.RESNO2
                             , CASE
                                   WHEN SUBSTR(A.ORDEPTHM,1,2) > '11' THEN 'PM'
                                   ELSE 'AM' END "TIME"
                          from smrsv00t a
                             , appatbat d
                             , smpkgmst e
                        where a.orddate between to_date(&D1,'yyyymmdd') and to_date(&D2,'yyyymmdd')
                          and a.canceltime is null
                          and a.patno = d.patno
                          and a.pkgcode = e.pkgcode
                          AND SUBSTR(E.PKGTYP,1,1) NOT IN ('7','8')
                       ) A
               ) A
       ) A
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY'), A.AMTGRP, A.PKGTYP, A.CUSTTYP, A.FRGUBUN
