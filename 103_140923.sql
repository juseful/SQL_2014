-- 2013년
select
  decode(a.contno ,'', '개인','단체') CUSTTYP
, (select c.custcode
  from  smcustct b
      , smcust0t c
   where  a.contno = b.contno
   and  b.custcode = c.custcode) custcode
, (select c.custnm
  from  smcustct b
      , smcust0t c
   where  a.contno = b.contno
   and  b.custcode = c.custcode) custnm
, a.orddate
, a.patno
, CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
       THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
  ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
, SUBSTR(D.PATNAME,1,4)||'*' PATNAME
, d.sex
, 나이계산펑션(a.patno, sysdate) age
, A.MEDLOCATFG
, SUBSTR(E.PKGTYP,1,1) PKGTYP
, a.pkgcode
 , (select count(*) from smrsv00t x
    where x.patno = a.patno
      and x.canceltime is null ) sm_cnt
 , (select sum(decode(x.pkgexamcode ,'CUSTDC',decode(x.rcptyp ,'5',0, x.creamt),x.creamt)) from smrcp00t x
     where x.rsvnosm =  a.rsvnosm
       ) sm_amt
, D.RESNO2
, CASE
      WHEN SUBSTR(A.ORDEPTHM,1,2) > '11' THEN 'PM'
      ELSE 'AM' END "TIME"
, B.FRNCODE
, B.CODENAME
, B.FRNREGYN
, B.FRNINPATH
from
  smrsv00t a
, appatbat d
, smpkgmst e
, (
        SELECT A.RSVNOSM, A.PATNO, A.PATNAME, A.ORDDATE, A.RESNO2, MAX(A.FRNCODE) FRNCODE, MAX(A.CODENAME) CODENAME
             , MAX(A.FRNREGYN) FRNREGYN, MAX(A.FRNINPATH) FRNINPATH
          FROM (
                -- 국적 정보가 있는 사람
                SELECT A.RSVNOSM, A.PATNO, B.PATNAME, A.ORDDATE, substr(B.RESNO2,1,1)||'******' resno2, B.FRNCODE, C.CODENAME
                     , E.FRNREGYN, F.CODENAME FRNINPATH
                  FROM SMRSV00T A, SMPKGMST D, APPATBAT B, CCCOMCDT C, APPATSBT E, CCCOMCDT F
                 WHERE A.ORDDATE BETWEEN to_date('20130101','yyyymmdd') and to_date('20131231','yyyymmdd')
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
                 WHERE A.ORDDATE BETWEEN to_date('20130101','yyyymmdd') and to_date('20131231','yyyymmdd')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = D.PKGCODE
                   AND SUBSTR(D.PKGTYP,1,1) != '7'
                   AND A.PATNO = B.PATNO
                   AND SUBSTR(B.RESNO2,1,1) IN ('5','6','7','8')
                   AND A.PKGCODE != 'THSL'
               ) A
         GROUP BY A.RSVNOSM, A.PATNO, A.PATNAME, A.ORDDATE, A.RESNO2
  ) B
where a.orddate between to_date('20130101','yyyymmdd') and to_date('20131231','yyyymmdd')
and  a.canceltime is null
and  a.patno = d.patno
and  a.pkgcode = e.pkgcode
AND E.PKGTYP != '7'
AND A.RSVNOSM = B.RSVNOSM(+)

