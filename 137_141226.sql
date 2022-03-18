-- 시작시간기준
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH"
     , A.MEDLOCATFG
     , A.STTIMEGRP
--     , A.ENDTIMEGRP
     , COUNT(A.PATNO) CNT
  FROM (
        SELECT A.*
             , CASE
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '07:00' THEN '01.7시 이전'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '08:00' THEN '02.7~8시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '09:00' THEN '03.8~9시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '10:00' THEN '04.9~10시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '11:00' THEN '05.10~11시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '12:00' THEN '06.11~12시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '13:00' THEN '07.12~13시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '14:00' THEN '08.13~14시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '15:00' THEN '09.14~15시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '16:00' THEN '10.15~16시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '17:00' THEN '11.16~17시'
                    ELSE '12.17시 이후'
                END STTIMEGRP
             , CASE
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '07:00' THEN '01.7시 이전'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '08:00' THEN '02.7~8시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '09:00' THEN '03.8~9시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '10:00' THEN '04.9~10시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '11:00' THEN '05.10~11시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '12:00' THEN '06.11~12시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '13:00' THEN '07.12~13시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '14:00' THEN '08.13~14시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '15:00' THEN '09.14~15시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '16:00' THEN '10.15~16시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '17:00' THEN '11.16~17시'
                    ELSE '12.17시 이후'
                END ENDTIMEGRP
          FROM (
                -- 최종시작, 종료시간
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.PKGCODE
                     , DECODE(DECODE(C.PKGTYP,'1C',C.PKGTYP,DECODE(SUBSTR(C.pkgtyp,1,1),'3',C.PKGTYP,SUBSTR(C.pkgtyp,1,1)))
                                      ,'0','맞춤'
                                      ,'1','정밀'
                                      ,'1C','위너스'
                                      ,'2','건강의학'
                                      ,'3A','임원'
                                      ,'3B','임원부인'
                                      ,'3C','단체임원'
                                      ,'4','숙박/CEO'
                                      ,'5','특화'
                                      ,'6','생습'
                                      ,'8','IHS'
                                      ,'재검'
                             ) TYPG
                     , B.MEDLOCATFG
                     , B.PKGCODE ORGPKG
                     , DECODE(DECODE(D.PKGTYP,'1C',D.PKGTYP,DECODE(SUBSTR(D.pkgtyp,1,1),'3',D.PKGTYP,SUBSTR(D.pkgtyp,1,1)))
                                      ,'0','맞춤'
                                      ,'1','정밀'
                                      ,'1C','위너스'
                                      ,'2','건강의학'
                                      ,'3A','임원'
                                      ,'3B','임원부인'
                                      ,'3C','단체임원'
                                      ,'4','숙박/CEO'
                                      ,'5','특화'
                                      ,'6','생습'
                                      ,'8','IHS'
                                      ,'재검'
                             ) ORGPKGTYP
                     , CASE
                            WHEN (TO_CHAR(B.ARRIVETIME,'YYYY-MM-DD') = TO_CHAR(A.STTIME,'YYYY-MM-DD')) AND (TO_CHAR(B.ARRIVETIME,'HH24:MI') < TO_CHAR(A.STTIME,'HH24:MI')) THEN B.ARRIVETIME
                            ELSE A.STTIME
                       END STTIME
                     , A.ENDTIME
                  FROM (
                        SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.PKGCODE, MIN(A.EXAMSTTIME) STTIME, MAX(EXAMENDTIME) ENDTIME
                          FROM SMMEDSTT A
                         WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
                         GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM, A.PKGCODE
                       ) A
                     , SMRSV00T B
                     , SMPKGMST C
                     , SMPKGMST D
                 WHERE (-- THS, 스포츠 외래 검사는 제외함.
                        A.STTIME IS NOT NULL
                       OR
                        A.ENDTIME IS NOT NULL
                       )
                   AND A.RSVNOSM = B.RSVNOSM
                   AND A.PKGCODE = C.PKGCODE(+)
                   AND B.PKGCODE = D.PKGCODE(+)
               ) A
       ) A
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')
     , A.MEDLOCATFG
     , A.STTIMEGRP
--     , A.ENDTIMEGRP
 ORDER BY 1,2,3

-- 종료시간기준
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH"
     , A.MEDLOCATFG
--     , A.STTIMEGRP
     , A.ENDTIMEGRP
     , COUNT(A.PATNO) CNT
  FROM (
        SELECT A.*
             , CASE
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '07:00' THEN '01.7시 이전'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '08:00' THEN '02.7~8시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '09:00' THEN '03.8~9시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '10:00' THEN '04.9~10시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '11:00' THEN '05.10~11시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '12:00' THEN '06.11~12시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '13:00' THEN '07.12~13시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '14:00' THEN '08.13~14시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '15:00' THEN '09.14~15시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '16:00' THEN '10.15~16시'
                    WHEN TO_CHAR(A.STTIME,'HH24:MI') < '17:00' THEN '11.16~17시'
                    ELSE '12.17시 이후'
                END STTIMEGRP
             , CASE
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '07:00' THEN '01.7시 이전'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '08:00' THEN '02.7~8시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '09:00' THEN '03.8~9시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '10:00' THEN '04.9~10시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '11:00' THEN '05.10~11시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '12:00' THEN '06.11~12시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '13:00' THEN '07.12~13시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '14:00' THEN '08.13~14시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '15:00' THEN '09.14~15시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '16:00' THEN '10.15~16시'
                    WHEN TO_CHAR(A.ENDTIME,'HH24:MI') < '17:00' THEN '11.16~17시'
                    ELSE '12.17시 이후'
                END ENDTIMEGRP
          FROM (
                -- 최종시작, 종료시간
                SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.PKGCODE
                     , DECODE(DECODE(C.PKGTYP,'1C',C.PKGTYP,DECODE(SUBSTR(C.pkgtyp,1,1),'3',C.PKGTYP,SUBSTR(C.pkgtyp,1,1)))
                                      ,'0','맞춤'
                                      ,'1','정밀'
                                      ,'1C','위너스'
                                      ,'2','건강의학'
                                      ,'3A','임원'
                                      ,'3B','임원부인'
                                      ,'3C','단체임원'
                                      ,'4','숙박/CEO'
                                      ,'5','특화'
                                      ,'6','생습'
                                      ,'8','IHS'
                                      ,'재검'
                             ) TYPG
                     , B.MEDLOCATFG
                     , B.PKGCODE ORGPKG
                     , DECODE(DECODE(D.PKGTYP,'1C',D.PKGTYP,DECODE(SUBSTR(D.pkgtyp,1,1),'3',D.PKGTYP,SUBSTR(D.pkgtyp,1,1)))
                                      ,'0','맞춤'
                                      ,'1','정밀'
                                      ,'1C','위너스'
                                      ,'2','건강의학'
                                      ,'3A','임원'
                                      ,'3B','임원부인'
                                      ,'3C','단체임원'
                                      ,'4','숙박/CEO'
                                      ,'5','특화'
                                      ,'6','생습'
                                      ,'8','IHS'
                                      ,'재검'
                             ) ORGPKGTYP
                     , CASE
                            WHEN (TO_CHAR(B.ARRIVETIME,'YYYY-MM-DD') = TO_CHAR(A.STTIME,'YYYY-MM-DD')) AND (TO_CHAR(B.ARRIVETIME,'HH24:MI') < TO_CHAR(A.STTIME,'HH24:MI')) THEN B.ARRIVETIME
                            ELSE A.STTIME
                       END STTIME
                     , A.ENDTIME
                  FROM (
                        SELECT A.ORDDATE, A.PATNO, A.RSVNOSM, A.PKGCODE, MIN(A.EXAMSTTIME) STTIME, MAX(EXAMENDTIME) ENDTIME
                          FROM SMMEDSTT A
                         WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
                         GROUP BY A.ORDDATE, A.PATNO, A.RSVNOSM, A.PKGCODE
                       ) A
                     , SMRSV00T B
                     , SMPKGMST C
                     , SMPKGMST D
                 WHERE (-- THS, 스포츠 외래 검사는 제외함.
                        A.STTIME IS NOT NULL
                       OR
                        A.ENDTIME IS NOT NULL
                       )
                   AND A.RSVNOSM = B.RSVNOSM
                   AND A.PKGCODE = C.PKGCODE(+)
                   AND B.PKGCODE = D.PKGCODE(+)
               ) A
       ) A
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM')
     , A.MEDLOCATFG
--     , A.STTIMEGRP
     , A.ENDTIMEGRP
 ORDER BY 1,2,3
