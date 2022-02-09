-- 재검
SELECT  A.ORDDATE
      , a.PATNO
      , A.PATNAME, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.COMPOS
      , MAX(DECODE(A.RN,'1',A.RETYP,''))       RETYP01
      , MAX(DECODE(A.RN,'1',A.REXAMCODE,''))   REXAMCODE01
      , MAX(DECODE(A.RN,'1',A.ORDNAME,''))     ORDNAME01
      , MAX(DECODE(A.RN,'1',A.EPTDATE,''))     EPTDATE01
      , MAX(DECODE(A.RN,'1',A.EXAMEXETIME,'')) EXAMEXETIME01
      , MAX(DECODE(A.RN,'2',A.RETYP,''))       RETYP02
      , MAX(DECODE(A.RN,'2',A.REXAMCODE,''))   REXAMCODE02
      , MAX(DECODE(A.RN,'2',A.ORDNAME,''))     ORDNAME02
      , MAX(DECODE(A.RN,'2',A.EPTDATE,''))     EPTDATE02
      , MAX(DECODE(A.RN,'2',A.EXAMEXETIME,'')) EXAMEXETIME02
      , MAX(DECODE(A.RN,'3',A.RETYP,''))       RETYP03
      , MAX(DECODE(A.RN,'3',A.REXAMCODE,''))   REXAMCODE03
      , MAX(DECODE(A.RN,'3',A.ORDNAME,''))     ORDNAME03
      , MAX(DECODE(A.RN,'3',A.EPTDATE,''))     EPTDATE03
      , MAX(DECODE(A.RN,'3',A.EXAMEXETIME,'')) EXAMEXETIME03
      , MAX(DECODE(A.RN,'4',A.RETYP,''))       RETYP04
      , MAX(DECODE(A.RN,'4',A.REXAMCODE,''))   REXAMCODE04
      , MAX(DECODE(A.RN,'4',A.ORDNAME,''))     ORDNAME04
      , MAX(DECODE(A.RN,'4',A.EPTDATE,''))     EPTDATE04
      , MAX(DECODE(A.RN,'4',A.EXAMEXETIME,'')) EXAMEXETIME04
      , MAX(DECODE(A.RN,'5',A.RETYP,''))       RETYP05
      , MAX(DECODE(A.RN,'5',A.REXAMCODE,''))   REXAMCODE05
      , MAX(DECODE(A.RN,'5',A.ORDNAME,''))     ORDNAME05
      , MAX(DECODE(A.RN,'5',A.EPTDATE,''))     EPTDATE05
      , MAX(DECODE(A.RN,'5',A.EXAMEXETIME,'')) EXAMEXETIME05
      , MAX(DECODE(A.RN,'6',A.RETYP,''))       RETYP06
      , MAX(DECODE(A.RN,'6',A.REXAMCODE,''))   REXAMCODE06
      , MAX(DECODE(A.RN,'6',A.ORDNAME,''))     ORDNAME06
      , MAX(DECODE(A.RN,'6',A.EPTDATE,''))     EPTDATE06
      , MAX(DECODE(A.RN,'6',A.EXAMEXETIME,'')) EXAMEXETIME06
      , MAX(DECODE(A.RN,'7',A.RETYP,''))       RETYP07
      , MAX(DECODE(A.RN,'7',A.REXAMCODE,''))   REXAMCODE07
      , MAX(DECODE(A.RN,'7',A.ORDNAME,''))     ORDNAME07
      , MAX(DECODE(A.RN,'7',A.EPTDATE,''))     EPTDATE07
      , MAX(DECODE(A.RN,'7',A.EXAMEXETIME,'')) EXAMEXETIME07
      , MAX(DECODE(A.RN,'8',A.RETYP,''))       RETYP08
      , MAX(DECODE(A.RN,'8',A.REXAMCODE,''))   REXAMCODE08
      , MAX(DECODE(A.RN,'8',A.ORDNAME,''))     ORDNAME08
      , MAX(DECODE(A.RN,'8',A.EPTDATE,''))     EPTDATE08
      , MAX(DECODE(A.RN,'8',A.EXAMEXETIME,'')) EXAMEXETIME08
      , MAX(DECODE(A.RN,'9',A.RETYP,''))       RETYP09
      , MAX(DECODE(A.RN,'9',A.REXAMCODE,''))   REXAMCODE09
      , MAX(DECODE(A.RN,'9',A.ORDNAME,''))     ORDNAME09
      , MAX(DECODE(A.RN,'9',A.EPTDATE,''))     EPTDATE09
      , MAX(DECODE(A.RN,'9',A.EXAMEXETIME,'')) EXAMEXETIME09
      , MAX(DECODE(A.RN,'10',A.RETYP,''))       RETYP10
      , MAX(DECODE(A.RN,'10',A.REXAMCODE,''))   REXAMCODE10
      , MAX(DECODE(A.RN,'10',A.ORDNAME,''))     ORDNAME10
      , MAX(DECODE(A.RN,'10',A.EPTDATE,''))     EPTDATE10
      , MAX(DECODE(A.RN,'10',A.EXAMEXETIME,'')) EXAMEXETIME10
      , MAX(DECODE(A.RN,'11',A.RETYP,''))       RETYP11
      , MAX(DECODE(A.RN,'11',A.REXAMCODE,''))   REXAMCODE11
      , MAX(DECODE(A.RN,'11',A.ORDNAME,''))     ORDNAME11
      , MAX(DECODE(A.RN,'11',A.EPTDATE,''))     EPTDATE11
      , MAX(DECODE(A.RN,'11',A.EXAMEXETIME,'')) EXAMEXETIME11
      , MAX(DECODE(A.RN,'12',A.RETYP,''))       RETYP12
      , MAX(DECODE(A.RN,'12',A.REXAMCODE,''))   REXAMCODE12
      , MAX(DECODE(A.RN,'12',A.ORDNAME,''))     ORDNAME12
      , MAX(DECODE(A.RN,'12',A.EPTDATE,''))     EPTDATE12
      , MAX(DECODE(A.RN,'12',A.EXAMEXETIME,'')) EXAMEXETIME12
      , MAX(DECODE(A.RN,'13',A.RETYP,''))       RETYP13
      , MAX(DECODE(A.RN,'13',A.REXAMCODE,''))   REXAMCODE13
      , MAX(DECODE(A.RN,'13',A.ORDNAME,''))     ORDNAME13
      , MAX(DECODE(A.RN,'13',A.EPTDATE,''))     EPTDATE13
      , MAX(DECODE(A.RN,'13',A.EXAMEXETIME,'')) EXAMEXETIME13
      , MAX(DECODE(A.RN,'14',A.RETYP,''))       RETYP14
      , MAX(DECODE(A.RN,'14',A.REXAMCODE,''))   REXAMCODE14
      , MAX(DECODE(A.RN,'14',A.ORDNAME,''))     ORDNAME14
      , MAX(DECODE(A.RN,'14',A.EPTDATE,''))     EPTDATE14
      , MAX(DECODE(A.RN,'14',A.EXAMEXETIME,'')) EXAMEXETIME14
      , MAX(DECODE(A.RN,'15',A.RETYP,''))       RETYP15
      , MAX(DECODE(A.RN,'15',A.REXAMCODE,''))   REXAMCODE15
      , MAX(DECODE(A.RN,'15',A.ORDNAME,''))     ORDNAME15
      , MAX(DECODE(A.RN,'15',A.EPTDATE,''))     EPTDATE15
      , MAX(DECODE(A.RN,'15',A.EXAMEXETIME,'')) EXAMEXETIME15
      , MAX(DECODE(A.RN,'16',A.RETYP,''))       RETYP16
      , MAX(DECODE(A.RN,'16',A.REXAMCODE,''))   REXAMCODE16
      , MAX(DECODE(A.RN,'16',A.ORDNAME,''))     ORDNAME16
      , MAX(DECODE(A.RN,'16',A.EPTDATE,''))     EPTDATE16
      , MAX(DECODE(A.RN,'16',A.EXAMEXETIME,'')) EXAMEXETIME16
      , MAX(DECODE(A.RN,'17',A.RETYP,''))       RETYP17
      , MAX(DECODE(A.RN,'17',A.REXAMCODE,''))   REXAMCODE17
      , MAX(DECODE(A.RN,'17',A.ORDNAME,''))     ORDNAME17
      , MAX(DECODE(A.RN,'17',A.EPTDATE,''))     EPTDATE17
      , MAX(DECODE(A.RN,'17',A.EXAMEXETIME,'')) EXAMEXETIME17
      , MAX(DECODE(A.RN,'18',A.RETYP,''))       RETYP18
      , MAX(DECODE(A.RN,'18',A.REXAMCODE,''))   REXAMCODE18
      , MAX(DECODE(A.RN,'18',A.ORDNAME,''))     ORDNAME18
      , MAX(DECODE(A.RN,'18',A.EPTDATE,''))     EPTDATE18
      , MAX(DECODE(A.RN,'18',A.EXAMEXETIME,'')) EXAMEXETIME18
      , MAX(DECODE(A.RN,'19',A.RETYP,''))       RETYP19
      , MAX(DECODE(A.RN,'19',A.REXAMCODE,''))   REXAMCODE19
      , MAX(DECODE(A.RN,'19',A.ORDNAME,''))     ORDNAME19
      , MAX(DECODE(A.RN,'19',A.EPTDATE,''))     EPTDATE19
      , MAX(DECODE(A.RN,'19',A.EXAMEXETIME,'')) EXAMEXETIME19
      , MAX(DECODE(A.RN,'20',A.RETYP,''))       RETYP20
      , MAX(DECODE(A.RN,'20',A.REXAMCODE,''))   REXAMCODE20
      , MAX(DECODE(A.RN,'20',A.ORDNAME,''))     ORDNAME20
      , MAX(DECODE(A.RN,'20',A.EPTDATE,''))     EPTDATE20
      , MAX(DECODE(A.RN,'20',A.EXAMEXETIME,'')) EXAMEXETIME20
      , MAX(DECODE(A.RN,'21',A.RETYP,''))       RETYP
      , MAX(DECODE(A.RN,'21',A.REXAMCODE,''))   REXAMCODE21
      , MAX(DECODE(A.RN,'21',A.ORDNAME,''))     ORDNAME21
      , MAX(DECODE(A.RN,'21',A.EPTDATE,''))     EPTDATE21
      , MAX(DECODE(A.RN,'21',A.EXAMEXETIME,'')) EXAMEXETIME21
      , MAX(DECODE(A.RN,'22',A.RETYP,''))       RETYP22
      , MAX(DECODE(A.RN,'22',A.REXAMCODE,''))   REXAMCODE22
      , MAX(DECODE(A.RN,'22',A.ORDNAME,''))     ORDNAME22
      , MAX(DECODE(A.RN,'22',A.EPTDATE,''))     EPTDATE22
      , MAX(DECODE(A.RN,'22',A.EXAMEXETIME,'')) EXAMEXETIME22
      , MAX(DECODE(A.RN,'23',A.RETYP,''))       RETYP23
      , MAX(DECODE(A.RN,'23',A.REXAMCODE,''))   REXAMCODE23
      , MAX(DECODE(A.RN,'23',A.ORDNAME,''))     ORDNAME23
      , MAX(DECODE(A.RN,'23',A.EPTDATE,''))     EPTDATE23
      , MAX(DECODE(A.RN,'23',A.EXAMEXETIME,'')) EXAMEXETIME23
      , MAX(DECODE(A.RN,'24',A.RETYP,''))       RETYP24
      , MAX(DECODE(A.RN,'24',A.REXAMCODE,''))   REXAMCODE24
      , MAX(DECODE(A.RN,'24',A.ORDNAME,''))     ORDNAME24
      , MAX(DECODE(A.RN,'24',A.EPTDATE,''))     EPTDATE24
      , MAX(DECODE(A.RN,'24',A.EXAMEXETIME,'')) EXAMEXETIME24
      , MAX(DECODE(A.RN,'25',A.RETYP,''))       RETYP25
      , MAX(DECODE(A.RN,'25',A.REXAMCODE,''))   REXAMCODE25
      , MAX(DECODE(A.RN,'25',A.ORDNAME,''))     ORDNAME25
      , MAX(DECODE(A.RN,'25',A.EPTDATE,''))     EPTDATE25
      , MAX(DECODE(A.RN,'25',A.EXAMEXETIME,'')) EXAMEXETIME25
      , MAX(DECODE(A.RN,'26',A.RETYP,''))       RETYP26
      , MAX(DECODE(A.RN,'26',A.REXAMCODE,''))   REXAMCODE26
      , MAX(DECODE(A.RN,'26',A.ORDNAME,''))     ORDNAME26
      , MAX(DECODE(A.RN,'26',A.EPTDATE,''))     EPTDATE26
      , MAX(DECODE(A.RN,'26',A.EXAMEXETIME,'')) EXAMEXETIME26
      , MAX(DECODE(A.RN,'27',A.RETYP,''))       RETYP27
      , MAX(DECODE(A.RN,'27',A.REXAMCODE,''))   REXAMCODE27
      , MAX(DECODE(A.RN,'27',A.ORDNAME,''))     ORDNAME27
      , MAX(DECODE(A.RN,'27',A.EPTDATE,''))     EPTDATE27
      , MAX(DECODE(A.RN,'27',A.EXAMEXETIME,'')) EXAMEXETIME27
      , MAX(DECODE(A.RN,'28',A.RETYP,''))       RETYP28
      , MAX(DECODE(A.RN,'28',A.REXAMCODE,''))   REXAMCODE28
      , MAX(DECODE(A.RN,'28',A.ORDNAME,''))     ORDNAME28
      , MAX(DECODE(A.RN,'28',A.EPTDATE,''))     EPTDATE28
      , MAX(DECODE(A.RN,'28',A.EXAMEXETIME,'')) EXAMEXETIME28
      , MAX(DECODE(A.RN,'29',A.RETYP,''))       RETYP29
      , MAX(DECODE(A.RN,'29',A.REXAMCODE,''))   REXAMCODE29
      , MAX(DECODE(A.RN,'29',A.ORDNAME,''))     ORDNAME29
      , MAX(DECODE(A.RN,'29',A.EPTDATE,''))     EPTDATE29
      , MAX(DECODE(A.RN,'29',A.EXAMEXETIME,'')) EXAMEXETIME29
      , MAX(DECODE(A.RN,'30',A.RETYP,''))       RETYP30
      , MAX(DECODE(A.RN,'30',A.REXAMCODE,''))   REXAMCODE30
      , MAX(DECODE(A.RN,'30',A.ORDNAME,''))     ORDNAME30
      , MAX(DECODE(A.RN,'30',A.EPTDATE,''))     EPTDATE30
      , MAX(DECODE(A.RN,'30',A.EXAMEXETIME,'')) EXAMEXETIME30
  FROM (-- 재검 대상자 최종...
        SELECT A.*
             , ROW_NUMBER () OVER (PARTITION BY A.PATNO||A.ORDDATE ORDER BY A.RETYP, A.REXAMCODE, A.EPTDATE, A.EXAMEXETIME) RN
          FROM (-- 재검 대상자 최종...
                SELECT DISTINCT A.ORDDATE, A.PATNO, A.PATNAME, A.CUSTCODE, A.CUSTNM, A.RESNO, A.COMPOS, A.RSVNOSM, a.pkgcode
                     , DECODE(B.REEXAMTYP,'1','추구','2','즉시재검','') RETYP, B.REXAMCODE, C.ORDNAME, B.EPTDATE, B.EXAMEXETIME
                  FROM (-- 김미주 간호사 대상자
                        SELECT A.*, C.CUSTCODE, C.CUSTNM, D.PATNAME, D.RESNO1||'-'||D.RESNO2 RESNO
                          FROM SMRSV00T A, SMPKGMST B, SMCUST0T C, APPATBAT D
                         WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD')  AND TO_DATE('20131231','YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO IS NOT NULL
                           AND A.PKGCODE = B.PKGCODE
                           AND B.PKGTYP = '3A'
                           AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                           AND A.PATNO = D.PATNO
                       ) A
                      , SMREXAMT B
                      , SMRSLTDT D
                      , MMORDRCT C
                 WHERE A.RSVNOSM = B.RSVNOSM
                   AND B.REEXAMTYP IN ('1','2')
                   AND B.RSVNOSM = D.RSVNOSM
                   AND B.EXAMCODE = D.EXAMCODE
                   AND B.DECIDR = D.DECIDR
                   AND D.DECIYN||D.DECIEND = 'YY'
                   AND B.REXAMCODE = C.ORDCODE
               ) A
       ) A
 GROUP BY A.ORDDATE, A.PATNO, A.PATNAME, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.COMPOS
 ORDER BY 1,2;

-- 특화
-- 최종
SELECT  A.ORDDATE
      , a.patno
      , A.PATNAME, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.COMPOS
      , MAX(DECODE(A.RN,'1',A.NXTPKG,''))            NXTPKG01
      , MAX(DECODE(A.RN,'1',A.NXTPKGCODE,''))       NXTPKGCODE01
      , MAX(DECODE(A.RN,'1',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE01
      , MAX(DECODE(A.RN,'1',A.NXTPKGORDDATE,''))    NXTPKGORDDATE01
      , MAX(DECODE(A.RN,'2',A.NXTPKG,''))            NXTPKG02
      , MAX(DECODE(A.RN,'2',A.NXTPKGCODE,''))       NXTPKGCODE02
      , MAX(DECODE(A.RN,'2',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE02
      , MAX(DECODE(A.RN,'2',A.NXTPKGORDDATE,''))    NXTPKGORDDATE02
      , MAX(DECODE(A.RN,'3',A.NXTPKG,''))            NXTPKG03
      , MAX(DECODE(A.RN,'3',A.NXTPKGCODE,''))       NXTPKGCODE03
      , MAX(DECODE(A.RN,'3',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE03
      , MAX(DECODE(A.RN,'3',A.NXTPKGORDDATE,''))    NXTPKGORDDATE03
      , MAX(DECODE(A.RN,'4',A.NXTPKG,''))            NXTPKG04
      , MAX(DECODE(A.RN,'4',A.NXTPKGCODE,''))       NXTPKGCODE04
      , MAX(DECODE(A.RN,'4',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE04
      , MAX(DECODE(A.RN,'4',A.NXTPKGORDDATE,''))    NXTPKGORDDATE04
      , MAX(DECODE(A.RN,'5',A.NXTPKG,''))            NXTPKG05
      , MAX(DECODE(A.RN,'5',A.NXTPKGCODE,''))       NXTPKGCODE05
      , MAX(DECODE(A.RN,'5',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE05
      , MAX(DECODE(A.RN,'5',A.NXTPKGORDDATE,''))    NXTPKGORDDATE05
      , MAX(DECODE(A.RN,'6',A.NXTPKG,''))            NXTPKG06
      , MAX(DECODE(A.RN,'6',A.NXTPKGCODE,''))       NXTPKGCODE06
      , MAX(DECODE(A.RN,'6',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE06
      , MAX(DECODE(A.RN,'6',A.NXTPKGORDDATE,''))    NXTPKGORDDATE06
      , MAX(DECODE(A.RN,'7',A.NXTPKG,''))            NXTPKG07
      , MAX(DECODE(A.RN,'7',A.NXTPKGCODE,''))       NXTPKGCODE07
      , MAX(DECODE(A.RN,'7',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE07
      , MAX(DECODE(A.RN,'7',A.NXTPKGORDDATE,''))    NXTPKGORDDATE07
      , MAX(DECODE(A.RN,'8',A.NXTPKG,''))            NXTPKG08
      , MAX(DECODE(A.RN,'8',A.NXTPKGCODE,''))       NXTPKGCODE08
      , MAX(DECODE(A.RN,'8',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE08
      , MAX(DECODE(A.RN,'8',A.NXTPKGORDDATE,''))    NXTPKGORDDATE08
      , MAX(DECODE(A.RN,'9',A.NXTPKG,''))            NXTPKG09
      , MAX(DECODE(A.RN,'9',A.NXTPKGCODE,''))       NXTPKGCODE09
      , MAX(DECODE(A.RN,'9',A.NXTPKGORDEPTDATE,'')) NXTPKGORDEPTDATE09
      , MAX(DECODE(A.RN,'9',A.NXTPKGORDDATE,''))    NXTPKGORDDATE09
  FROM (-- 예약 한 사람과 안 한사람 합치기....
        SELECT  A.ORDDATE, A.PATNO, A.CUSTCODE, A.CUSTNM, A.PATNAME, A.PKGCODE, A.RESNO, A.COMPOS, A.NXTPKG, A.NXTPKGCODE, A.NXTPKGORDEPTDATE, A.NXTPKGORDDATE
              , ROW_NUMBER () OVER (PARTITION BY A.ORDDATE||A.PATNO ORDER BY A.NXTPKG, A.NXTPKGORDEPTDATE) RN
          FROM (-- 특화 판정을 권유 받은 후 특화 예약을 한 사람들....
                SELECT DISTINCT A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.OPTION1 NXTPKG, C.PKGCODE NXTPKGCODE
                     , TO_CHAR(C.ORDEPTDATE,'YYYY-MM-DD HH24:MI:SS') NXTPKGORDEPTDATE, TO_CHAR(C.ORDDATE,'YYYY-MM-DD HH24:MI:SS') NXTPKGORDDATE
                     , A.PATNAME, A.RESNO, A.COMPOS
                  FROM (-- 특화 판정자
                        SELECT A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, B.NXTPKG, C.OPTION1 , C.OPTION3 NXTPKGTYP, A.PATNAME, A.RESNO, A.COMPOS
                          FROM (-- 김미주 간호사 대상자
                                SELECT A.*, C.CUSTCODE, C.CUSTNM, D.PATNAME, D.RESNO1||'-'||D.RESNO2 RESNO
                                  FROM SMRSV00T A, SMPKGMST B, SMCUST0T C, APPATBAT D
                                 WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD')  AND TO_DATE('&D2','YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.CONTNO IS NOT NULL
                                   AND A.PKGCODE = B.PKGCODE
                                   AND B.PKGTYP = '3A'
                                   AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                                   AND A.PATNO = D.PATNO
                               ) A
                              , SMRSLTDT B
                              , CCCOMCDT C
                         WHERE A.RSVNOSM = B.RSVNOSM
                           AND B.DECIYN||B.DECIEND = 'YY'
                           AND B.NXTPKG IS NOT NULL
                           AND C.GRPCODE = 'SM403'
                           AND B.NXTPKG = C.CODE
                       ) A
                      , SMPKGMST B
                      , SMRSV00T C
                 WHERE A.NXTPKGTYP = B.PKGTYP
                   AND B.PKGCODE = C.PKGCODE
                   AND A.PATNO = C.PATNO(+)
                   AND A.ORDDATE < C.ORDEPTDATE(+)
                   AND C.CANCELTIME IS NULL
                UNION
                -- 특화 판정 후 특화 예약을 안 한 사람들....
                SELECT A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, C.OPTION1 NXTPKG, '', '' , '', A.PATNAME, A.RESNO, A.COMPOS
                  FROM (-- 김미주 간호사 대상자
                        SELECT A.*, C.CUSTCODE, C.CUSTNM, D.RESNO1||'-'||D.RESNO2 RESNO, D.PATNAME
                          FROM SMRSV00T A, SMPKGMST B, SMCUST0T C, APPATBAT D
                         WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD')  AND TO_DATE('&D2','YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO IS NOT NULL
                           AND A.PKGCODE = B.PKGCODE
                           AND B.PKGTYP = '3A'
                           AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                           AND A.PATNO = D.PATNO
                       ) A
                      , SMRSLTDT B
                      , CCCOMCDT C
                 WHERE A.RSVNOSM = B.RSVNOSM
                   AND B.DECIYN||B.DECIEND = 'YY'
                   AND B.NXTPKG IS NOT NULL
                   AND C.GRPCODE = 'SM403'
                   AND B.NXTPKG = C.CODE
                   AND A.PATNO||A.ORDDATE||B.NXTPKG NOT IN (-- 특화 판정을 권유 받은 후 특화 예약을 한 사람들....
                                                            SELECT DISTINCT X.PATNO||X.ORDDATE||X.NXTPKG
                                                              FROM (-- 특화 판정자
                                                                    SELECT A.ORDDATE, A.PATNO, A.CUSTCODE, A.CUSTNM, B.NXTPKG, C.OPTION1 , C.OPTION3 NXTPKGTYP
                                                                      FROM (-- 김미주 간호사 대상자
                                                                            SELECT A.*, C.CUSTCODE, C.CUSTNM
                                                                              FROM SMRSV00T A, SMPKGMST B, SMCUST0T C
                                                                             WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD')  AND TO_DATE('&D2','YYYYMMDD')
                                                                               AND A.CANCELTIME IS NULL
                                                                               AND A.CONTNO IS NOT NULL
                                                                               AND A.PKGCODE = B.PKGCODE
                                                                               AND B.PKGTYP = '3A'
                                                                               AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                                                                           ) A
                                                                          , SMRSLTDT B
                                                                          , CCCOMCDT C
                                                                     WHERE A.RSVNOSM = B.RSVNOSM
                                                                       AND B.DECIYN||B.DECIEND = 'YY'
                                                                       AND B.NXTPKG IS NOT NULL
                                                                       AND C.GRPCODE = 'SM403'
                                                                       AND B.NXTPKG = C.CODE
                                                                   ) X
                                                                  , SMPKGMST Y
                                                                  , SMRSV00T Z
                                                             WHERE X.NXTPKGTYP = Y.PKGTYP
                                                               AND Y.PKGCODE = Z.PKGCODE
                                                               AND X.PATNO = Z.PATNO(+)
                                                               AND X.ORDDATE < Z.ORDEPTDATE(+)
                                                               AND Z.CANCELTIME IS NULL
                                                           )
                 ORDER BY 1,2
               ) A
       ) A
 GROUP BY A.ORDDATE, A.PATNO, A.PATNAME, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.COMPOS;

-- 외래최종!!!
-- 지역 병원 진료는 제외....
SELECT  A.ORDDATE
      , a.patno
      , A.PATNAME, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.COMPOS
      , MAX(DECODE(A.RN,'1',A.MEDDEPT,'')) MEDDEPT01
      , MAX(DECODE(A.RN,'1',A.MEDDATE,'')) MEDDATE01
      , MAX(DECODE(A.RN,'2',A.MEDDEPT,'')) MEDDEPT02
      , MAX(DECODE(A.RN,'2',A.MEDDATE,'')) MEDDATE02
      , MAX(DECODE(A.RN,'3',A.MEDDEPT,'')) MEDDEPT03
      , MAX(DECODE(A.RN,'3',A.MEDDATE,'')) MEDDATE03
      , MAX(DECODE(A.RN,'4',A.MEDDEPT,'')) MEDDEPT04
      , MAX(DECODE(A.RN,'4',A.MEDDATE,'')) MEDDATE04
      , MAX(DECODE(A.RN,'5',A.MEDDEPT,'')) MEDDEPT05
      , MAX(DECODE(A.RN,'5',A.MEDDATE,'')) MEDDATE05
      , MAX(DECODE(A.RN,'6',A.MEDDEPT,'')) MEDDEPT06
      , MAX(DECODE(A.RN,'6',A.MEDDATE,'')) MEDDATE06
  FROM (-- 환자이름가지고 오기....
        SELECT A.*, ROW_NUMBER () OVER (PARTITION BY A.PATNO||A.ORDDATE ORDER BY A.MEDDATE) RN
          FROM (-- 외래 진료 일정 합치기
                -- 외래 판정 받고 진료를 본사람...
                SELECT DISTINCT A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.MEDDEPT, MIN(TO_CHAR(B.MEDDATE,'YYYY-MM-DD HH24:MI:SS')) MEDDATE
                      , A.PATNAME, A.RESNO, A.COMPOS
                  FROM (-- 외래 판정자
                        SELECT DISTINCT A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, B.MEDDEPT, B.DECIDATE, A.PATNAME, A.RESNO, A.COMPOS
                          FROM (-- 김미주 간호사 대상자
                                SELECT A.*, C.CUSTCODE, C.CUSTNM, D.PATNAME, D.RESNO1||D.RESNO2 RESNO
                                  FROM SMRSV00T A, SMPKGMST B, SMCUST0T C, APPATBAT D
                                 WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD')  AND TO_DATE('&D2','YYYYMMDD')
                                   AND A.CANCELTIME IS NULL
                                   AND A.CONTNO IS NOT NULL
                                   AND A.PKGCODE = B.PKGCODE
                                   AND B.PKGTYP = '3A'
                                   AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                                   AND A.PATNO = D.PATNO
                               ) A
                              , SMRSLTDT B
                         WHERE A.RSVNOSM = B.RSVNOSM
                           AND B.DECIYN||B.DECIEND = 'YY'
                           AND B.MEDDEPT IS NOT NULL
                           AND NVL(B.AREAHOPYN,'N') != 'Y'
                         ORDER BY 1, 2
                       ) A
                      , APOPDLST B
                 WHERE A.PATNO = B.PATNO
                   AND A.DECIDATE < B.MEDDATE
                   AND A.MEDDEPT = B.MEDDEPT
                   AND B.MEDYN = 'Y'
                   AND B.REJTTIME IS NULL
                 GROUP BY A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.MEDDEPT, A.DECIDATE, A.PATNAME, A.RESNO, A.COMPOS
                UNION ALL
                -- 외래 판정 받고 진료 안 본 사람...
                SELECT DISTINCT A.ORDDATE, A.PATNO, A.PKGCODE, A.CUSTCODE, A.CUSTNM, B.MEDDEPT, '' MEDDATE, A.PATNAME, A.RESNO, A.COMPOS
                  FROM (-- 김미주 간호사 대상자
                        SELECT A.*, C.CUSTCODE, C.CUSTNM, D.PATNAME, D.RESNO1||D.RESNO2 RESNO
                          FROM SMRSV00T A, SMPKGMST B, SMCUST0T C, APPATBAT D
                         WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD')  AND TO_DATE('&D2','YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.CONTNO IS NOT NULL
                           AND A.PKGCODE = B.PKGCODE
                           AND B.PKGTYP = '3A'
                           AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                           AND A.PATNO = D.PATNO
                       ) A
                      , SMRSLTDT B
                 WHERE A.RSVNOSM = B.RSVNOSM
                   AND B.DECIYN||B.DECIEND = 'YY'
                   AND B.MEDDEPT IS NOT NULL
                   AND NVL(B.AREAHOPYN,'N') != 'Y'
                   AND A.ORDDATE||A.PATNO||B.MEDDEPT||B.DECIDATE NOT IN (-- 외래 판정 받고 진료를 본사람...
                                                                         SELECT DISTINCT X.ORDDATE||X.PATNO||X.MEDDEPT||X.DECIDATE
                                                                           FROM (-- 외래 판정자
                                                                                 SELECT DISTINCT A.ORDDATE, A.PATNO, A.CUSTCODE, A.CUSTNM, B.MEDDEPT, B.DECIDATE
                                                                                   FROM (-- 김미주 간호사 대상자
                                                                                         SELECT A.*, C.CUSTCODE, C.CUSTNM
                                                                                           FROM SMRSV00T A, SMPKGMST B, SMCUST0T C
                                                                                          WHERE A.ORDDATE BETWEEN TO_DATE('&D1','YYYYMMDD')  AND TO_DATE('&D2','YYYYMMDD')
                                                                                            AND A.CANCELTIME IS NULL
                                                                                            AND A.CONTNO IS NOT NULL
                                                                                            AND A.PKGCODE = B.PKGCODE
                                                                                            AND B.PKGTYP = '3A'
                                                                                            AND SUBSTR(A.CONTNO,1,6) = C.CUSTCODE
                                                                                        ) A
                                                                                       , SMRSLTDT B
                                                                                  WHERE A.RSVNOSM = B.RSVNOSM
                                                                                    AND B.DECIYN||B.DECIEND = 'YY'
                                                                                    AND B.MEDDEPT IS NOT NULL
                                                                                    AND NVL(B.AREAHOPYN,'N') != 'Y'
                                                                                  ORDER BY 1, 2
                                                                                ) X
                                                                               , APOPDLST Y
                                                                          WHERE X.PATNO = Y.PATNO
                                                                            AND X.DECIDATE < Y.MEDDATE
                                                                            AND X.MEDDEPT = Y.MEDDEPT
                                                                            AND Y.MEDYN = 'Y'
                                                                            AND Y.REJTTIME IS NULL
                                                                        )
                 ORDER BY 1, 2
               ) A
       ) A
 GROUP BY A.ORDDATE, A.PATNO, A.PATNAME, A.PKGCODE, A.CUSTCODE, A.CUSTNM, A.COMPOS
