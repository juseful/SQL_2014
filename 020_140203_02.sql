SELECT A.GRP, A.SUBGRP, A.PKGGUBUN, COUNT(A.PATNO) CNT, SUM(TRUNC(A.MIN,1)) T_TIME
  FROM (-- 상담
        SELECT A.GRP, A.SUBGRP
             , CASE WHEN A.FYN = 'F' THEN 'V.외국인'
                    WHEN A.PKGTYP LIKE '4%' THEN 'IV.숙박'
                    WHEN A.PKGTYP = '1P' THEN 'III.프리미엄'
                    WHEN A.MEDLOCATFG = 'C' THEN 'II.암병원'
                    ELSE 'I.별관'
               END PKGGUBUN
             , A.PATNO, A.RSVNOSM--, A.PKGCODE, A.PKGTYP
             , A.STARTTIME, A.ENDTIME, A.GAP, A.MEDLOCATFG
             , CASE WHEN SUBSTR(A.GAP,1,1) = '0' THEN (TO_NUMBER(SUBSTR(A.GAP,-15,2)))/A.TOPTCNT
                    ELSE (TO_NUMBER(SUBSTR(A.GAP,1,INSTR(A.GAP,':')-1)*60)+TO_NUMBER(SUBSTR(A.GAP,-15,2)))/A.TOPTCNT
                END MIN
          FROM (
                SELECT A.*
                     , SUBSTR(
                              TO_CHAR(
                                      TO_TIMESTAMP(A.ENDTIME,'YYYY-MM-DD HH24:MI:SS.FF5')
                                    - TO_TIMESTAMP(A.STARTTIME,'YYYY-MM-DD HH24:MI:SS.FF5')
                                     )
                             ,13
                             ) GAP
                  FROM (
                        SELECT A.GRP, A.SUBGRP, A.FYN, A.PATNO, A.RSVNOSM, B.PKGCODE, C.PKGTYP, A.TOPTCNT, A.MEDLOCATFG
                             , TO_CHAR(A.CONSDATE,'YYYY-MM-DD')||' '||A.STARTTIME||':'||'00' STARTTIME
                             , TO_CHAR(A.CONSDATE,'YYYY-MM-DD')||' '||A.ENDTIME||':'||'00' ENDTIME
                          FROM (
                                SELECT '1.상담' GRP--, DECODE(NVL(A.PARTYN,'N'),'Y','PY','PN') PARTYN
                                     --, DECODE(A.CONSROOMNO,'M21','DY','DN') DAYYN
                                     , DECODE(DECODE(NVL(A.PARTYN,'N'),'Y','PY','PN')||DECODE(A.CONSROOMNO,'M21','DY','DN')
                                             ,'PNDN','A.방문상담'
                                             ,'PNDY','C.당일판정'
                                             ,'B.부분상담'
                                             ) SUBGRP
                                     , DECODE(SUBSTR(B.RESNO2,1,1)
                                             ,'5','F'
                                             ,'6','F'
                                             ,'7','F'
                                             ,'8','F'
                                             ,'D'
                                             ) FYN
                                     , A.PATNO, A.RSVNOSM, A.MEDLOCATFG, MIN(A.RSLTCONSDATE) CONSDATE
                                     , SUBSTR(NVL(A.STARTTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.STARTTIME,'0000'),3) STARTTIME
                                     , SUBSTR(NVL(A.ENDTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.ENDTIME,'0000'),3) ENDTIME
                                     , ((-- 동반자수, 상담을 같이 하므로 1명이라도 있으면 본인도 포함해야 함. 그러므로 1을 더해줌
                                        SELECT COUNT(TORSVNOSM)
                                          FROM SMRSVTOT X
                                         WHERE A.RSVNOSM = X.RSVNOSM
                                       ) +1 ) TOPTCNT
                                  FROM SMRSLT0T A, APPATBAT B
                                 WHERE A.RSLTCONSDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.PATNO != ' '
                                   AND A.CONSROOMNO LIKE 'M%'
                                   AND A.CONSROOMNO NOT IN ('M22','M25','M26','M27','M28','M29')
                                   AND A.PATNO = B.PATNO
                                 GROUP BY A.PATNO, A.RSVNOSM, A.STARTTIME, A.ENDTIME, A.PARTYN, A.CONSROOMNO, B.RESNO2, A.MEDLOCATFG
                               ) A
                             , SMRSV00T B
                             , SMPKGMST C
                        WHERE A.RSVNOSM = B.RSVNOSM
                          AND B.PKGCODE = C.PKGCODE
                       ) A
               ) A
        UNION ALL
        -- 예진
        SELECT A.GRP, A.SUBGRP, '' PKGGUBUN, A.PATNO, A.RSVNOSM, A.PKGCODE, A.STARTTIME, A.ENDTIME, A.GAP
             , CASE WHEN SUBSTR(A.GAP,1,1) = '0' THEN TO_NUMBER(SUBSTR(A.GAP,-15,2))
                    ELSE TO_NUMBER(SUBSTR(A.GAP,1,INSTR(A.GAP,':')-1)*60)+TO_NUMBER(SUBSTR(A.GAP,-15,2)) END MIN
          FROM (
                SELECT A.*
                     , SUBSTR(
                              TO_CHAR(
                                      TO_TIMESTAMP(A.ENDTIME,'YYYY-MM-DD HH24:MI:SS')
                                    - TO_TIMESTAMP(A.STARTTIME,'YYYY-MM-DD HH24:MI:SS')
                                     )
                             ,13
                             ) GAP
                  FROM (
                        SELECT A.GRP
                             , CASE WHEN A.FYN = 'F' THEN 'B.예진-외국인'
                                    WHEN B.PKGCODE = 'FNA' THEN 'C.예진-FNA'
                                    ELSE 'A.예진-일반'
                               END SUBGRP
                             , A.PATNO, A.RSVNOSM, B.PKGCODE
                             , TO_CHAR(A.STARTTIME,'YYYY-MM-DD HH24:MI')||':00' STARTTIME
                             , TO_CHAR(A.ENDTIME,'YYYY-MM-DD HH24:MI')||':00' ENDTIME
                          FROM (
                                SELECT '2.예진' GRP, A.PATNO, A.RSVNOSM
                                     , DECODE(SUBSTR(B.RESNO2,1,1)
                                             ,'5','F'
                                             ,'6','F'
                                             ,'7','F'
                                             ,'8','F'
                                             ,'D'
                                             ) FYN
                                     , MIN(EXAMSTTIME) STARTTIME, MIN(EXAMENDTIME) ENDTIME
                                  FROM SMMEDSTT A, APPATBAT B
                                 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.EPTEXAMRMCODE IN ('AR03','CM16','CF11')
                                   AND A.RSVNOSM NOT IN (-- 시작, 종료시간이 없는 사람 제외!!
                                                        )
                                   AND A.EXAMEPTTYP NOT IN ('N','S')
                                   AND A.PATNO = B.PATNO
                                 GROUP BY A.PATNO, A.RSVNOSM, B.RESNO2
                               ) A
                             , SMRSV00T B
                         WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
        UNION ALL
        -- 특화상담
        SELECT  A.GRP, A.SUBGRP, '' PKGGUBUN, A.PATNO, A.RSVNOSM, A.PKGCODE, A.STARTTIME, A.ENDTIME, A.GAP
             , CASE WHEN SUBSTR(A.GAP,1,1) = '0' THEN TO_NUMBER(SUBSTR(A.GAP,-15,2))
                    ELSE TO_NUMBER(SUBSTR(A.GAP,1,INSTR(A.GAP,':')-1)*60)+TO_NUMBER(SUBSTR(A.GAP,-15,2)) END MIN
          FROM (
                SELECT A.*
                     , SUBSTR(
                              TO_CHAR(
                                      TO_TIMESTAMP(A.ENDTIME,'YYYY-MM-DD HH24:MI:SS.FF5')
                                    - TO_TIMESTAMP(A.STARTTIME,'YYYY-MM-DD HH24:MI:SS.FF5')
                                     )
                             ,13
                             ) GAP
                  FROM (
                        SELECT A.GRP, A.SUBGRP, A.PATNO, A.RSVNOSM, B.PKGCODE--, A.CONSDATE
                             , TO_CHAR(A.CONSDATE,'YYYY-MM-DD')||' '||A.STARTTIME||':'||'00' STARTTIME
                             , TO_CHAR(A.CONSDATE,'YYYY-MM-DD')||' '||A.ENDTIME||':'||'00' ENDTIME
                          FROM (
                                SELECT DECODE(A.CONSROOMNO,'T06','4.신경과','T36','4.신경과','T18','5.정신과','T19','5.정신과','3.특화') GRP
                                     , DECODE(A.CONSROOMNO,'T05','A.폐전문건진','T08','B.FUT','T06','B.뇌졸중상담','T36','A.치매상담','A.방문상담') SUBGRP
                                     , A.PATNO, A.RSVNOSM, MIN(A.RSLTCONSDATE) CONSDATE
                                     , SUBSTR(NVL(A.STARTTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.STARTTIME,'0000'),3) STARTTIME
                                     , SUBSTR(NVL(A.ENDTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.ENDTIME,'0000'),3) ENDTIME
                                  FROM SMRSLT0T A
                                 WHERE A.RSLTCONSDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.PATNO != ' '
                                   AND A.CONSROOMNO LIKE 'T%'
                                   AND A.CONSROOMNO IN (
                                                        'T05'-- 폐
                                                       ,'T08'-- FUT
                                                       )
                                 GROUP BY A.CONSROOMNO, A.PATNO, A.RSVNOSM, A.STARTTIME, A.ENDTIME, A.PARTYN
                               ) A
                             , SMRSV00T B
                        WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
       ) A
 GROUP BY A.GRP, A.SUBGRP, A.PKGGUBUN
 ORDER BY 1,2,3
