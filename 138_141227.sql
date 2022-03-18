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
, D.PATNAME
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
, D.FRNCODE
     , (
        SELECT X.CODENAME
          FROM CCCOMCDT X
         WHERE X.GRPCODE = 'AP015'
           AND NVL(D.FRNCODE,'000') = X.CODE
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
     , A.COMPOS
     , (
        SELECT X.USERID||'-'||X.USERNAME
          FROM CSUSERMT X
         WHERE A.CODY = X.USERID
       ) CODY
from
  smrsv00t a
, appatbat d
, smpkgmst e
where a.orddate between to_date('20140101','yyyymmdd') and to_date('20141130','yyyymmdd')
and  a.canceltime is null
and  a.patno = d.patno
and  a.pkgcode = e.pkgcode
AND E.PKGTYP != '7'
