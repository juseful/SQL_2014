-- 최종!!
SELECT A.GRP, A.SUBGRP, A.PKGCODE, B.PKGNM, B.PKGTYP, C.CODENAME, COUNT(A.PATNO) CNT, SUM(TRUNC(A.MIN,1)) T_TIME
  FROM (-- TOTAL
        -- 상담
        SELECT A.GRP, A.SUBGRP, A.PATNO, A.RSVNOSM, A.PKGCODE, A.STARTTIME, A.ENDTIME, A.GAP
             , CASE WHEN SUBSTR(A.GAP,1,1) = '0' THEN (TO_NUMBER(SUBSTR(A.GAP,-15,2)))/A.TOPTCNT
                    ELSE (TO_NUMBER(SUBSTR(A.GAP,1,INSTR(A.GAP,':')-1)*60)+TO_NUMBER(SUBSTR(A.GAP,-15,2)))/A.TOPTCNT END MIN
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
                        SELECT A.GRP, A.SUBGRP, A.PATNO, A.RSVNOSM, B.PKGCODE, A.TOPTCNT--, A.CONSDATE
                             , TO_CHAR(A.CONSDATE,'YYYY-MM-DD')||' '||A.STARTTIME||':'||'00' STARTTIME
                             , TO_CHAR(A.CONSDATE,'YYYY-MM-DD')||' '||A.ENDTIME||':'||'00' ENDTIME
                          FROM (
                                SELECT '1.상담' GRP, DECODE(NVL(A.PARTYN,'N'),'Y','B.부분상담','A.방문상담') SUBGRP
                                     , A.PATNO, A.RSVNOSM, MIN(A.RSLTCONSDATE) CONSDATE
                                     , SUBSTR(NVL(A.STARTTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.STARTTIME,'0000'),3) STARTTIME
                                     , SUBSTR(NVL(A.ENDTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.ENDTIME,'0000'),3) ENDTIME
                                     , ((-- 동반자수, 상담을 같이 하므로 1명이라도 있으면 본인도 포함해야 함. 그러므로 1을 더해줌
                                        SELECT COUNT(TORSVNOSM)
                                          FROM SMRSVTOT X
                                         WHERE A.RSVNOSM = X.RSVNOSM
                                       ) +1 ) TOPTCNT
                                  FROM SMRSLT0T A
                                 WHERE A.RSLTCONSDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.PATNO != ' '
                                   AND A.CONSROOMNO LIKE 'M%'
                                   AND A.CONSROOMNO NOT IN ('M22','M25','M26','M27','M28','M29')
                                 GROUP BY A.PATNO, A.RSVNOSM, A.STARTTIME, A.ENDTIME, A.PARTYN
                               ) A
                             , SMRSV00T B
                        WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
        UNION ALL
        -- 예진
        SELECT A.*
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
                        SELECT A.GRP, DECODE(B.PKGCODE,'FNA','B.예진-FNA','A.예진-일반') SUBGRP, A.PATNO, A.RSVNOSM, B.PKGCODE
                             , TO_CHAR(A.STARTTIME,'YYYY-MM-DD HH24:MI')||':00' STARTTIME
                             , TO_CHAR(A.ENDTIME,'YYYY-MM-DD HH24:MI')||':00' ENDTIME
                          FROM (
                                SELECT '2.예진' GRP, A.PATNO, A.RSVNOSM, MIN(EXAMSTTIME) STARTTIME, MIN(EXAMENDTIME) ENDTIME
                                  FROM SMMEDSTT A
                                 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.EPTEXAMRMCODE IN ('AR03','CM16','CF11')
                                   AND A.RSVNOSM NOT IN (-- 시작, 종료시간이 없는 사람 제외!!
                                                         '05906870018'
                                                        ,'05906889020'
                                                        ,'12321510019'
                                                        ,'27460235002'
                                                        ,'29988117006'
                                                        ,'30023706001'
                                                        )
                                   AND A.EXAMEPTTYP NOT IN ('N','S')
                                 GROUP BY A.PATNO, A.RSVNOSM
                               ) A
                             , SMRSV00T B
                         WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
        UNION ALL
        -- 특화상담
        SELECT A.*
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
                                SELECT DECODE(A.CONSROOMNO,'T06','4.신경과','T36','4.신경과','T18','5.정신과','T19','5.정신과','3..특화') GRP
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
                                                       ,'T06'-- 뇌졸중
                                                       ,'T36'-- 치매
                                                       ,'T18','T19'-- 정신과
                                                       )
                                 GROUP BY A.CONSROOMNO, A.PATNO, A.RSVNOSM, A.STARTTIME, A.ENDTIME, A.PARTYN
                               ) A
                             , SMRSV00T B
                        WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
        UNION ALL
        -- 순환기검사
        SELECT A.*
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
                        SELECT A.GRP, 'A.심장초음파검사' SUBGRP, A.PATNO, A.RSVNOSM, B.PKGCODE
                             , TO_CHAR(A.STARTTIME,'YYYY-MM-DD HH24:MI')||':00' STARTTIME
                             , TO_CHAR(A.ENDTIME,'YYYY-MM-DD HH24:MI')||':00' ENDTIME
                          FROM (
                                SELECT '6.순환기검사' GRP, A.PATNO, A.RSVNOSM, MIN(EXAMSTTIME) STARTTIME, MIN(EXAMENDTIME) ENDTIME
                                  FROM SMMEDSTT A
                                 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.EPTEXAMRMCODE IN ('AR05','CM14','CM141')
                                   AND A.EXAMEPTTYP NOT IN ('N','S')
                                 GROUP BY A.PATNO, A.RSVNOSM
                               ) A
                             , SMRSV00T B
                         WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
        UNION ALL
        -- 비뇨기검사
        SELECT A.*
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
                        SELECT A.GRP, 'A.전립선초음파검사' SUBGRP, A.PATNO, A.RSVNOSM, B.PKGCODE
                             , TO_CHAR(A.STARTTIME,'YYYY-MM-DD HH24:MI')||':00' STARTTIME
                             , TO_CHAR(A.ENDTIME,'YYYY-MM-DD HH24:MI')||':00' ENDTIME
                          FROM (
                                SELECT '7.비뇨기검사' GRP, A.PATNO, A.RSVNOSM, MIN(EXAMSTTIME) STARTTIME, MIN(EXAMENDTIME) ENDTIME
                                  FROM SMMEDSTT A
                                 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
                                   AND A.EPTEXAMRMCODE IN ('AR22','AR221','CM04','CM041')
                                   AND A.EXAMEPTTYP NOT IN ('N','S')
                                 GROUP BY A.PATNO, A.RSVNOSM
                               ) A
                             , SMRSV00T B
                         WHERE A.RSVNOSM = B.RSVNOSM
                       ) A
               ) A
       ) A
     , SMPKGMST B
     , CCCOMCDT C
 WHERE A.PKGCODE = B.PKGCODE
   AND C.GRPCODE = 'SMM02'
   AND B.PKGTYP = C.CODE
 GROUP BY A.GRP, A.SUBGRP, A.PKGCODE, B.PKGNM, B.PKGTYP, C.CODENAME
 ORDER BY 1,2,5,3;
