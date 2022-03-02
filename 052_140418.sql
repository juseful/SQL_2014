SELECT A.CONSDATE, A.PATNO2, A.AGE, A.MEDLOCATFG, A.CONSROOMNO, A.CODENAME ROOMNM, A.CONSDR
     , CASE WHEN SUBSTR(A.GAP,1,1) = '0' THEN TRUNC((TO_NUMBER(SUBSTR(A.GAP,-15,2)))/A.TOPTCNT)
            ELSE TRUNC((TO_NUMBER(SUBSTR(A.GAP,1,INSTR(A.GAP,':')-1)*60)+TO_NUMBER(SUBSTR(A.GAP,-15,2)))/A.TOPTCNT)
        END GAP
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
                SELECT --A.*
                       MIN(A.RSLTCONSDATE) CONSDATE, A.PATNO, TRUNC(MONTHS_BETWEEN(A.RSLTCONSDATE,C.BIRTHDAY)/12) AGE
                     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
                            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
                       END PATNO2
                     , A.MEDLOCATFG, A.CONSROOMNO, B.CODENAME
                     , TO_CHAR(A.RSLTCONSDATE,'YYYY-MM-DD')||' '||SUBSTR(NVL(A.STARTTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.STARTTIME,'0000'),3)||':'||'00' STARTTIME
                     , TO_CHAR(A.RSLTCONSDATE,'YYYY-MM-DD')||' '||SUBSTR(NVL(A.ENDTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.ENDTIME,'0000'),3)||':'||'00' ENDTIME
                     , A.CONSDRID||'-'||D.USERNAME CONSDR
                     , ((-- 동반자수, 상담을 같이 하므로 1명이라도 있으면 본인도 포함해야 함. 그러므로 1을 더해줌
                         SELECT COUNT(TORSVNOSM)
                           FROM SMRSVTOT X
                          WHERE A.RSVNOSM = X.RSVNOSM
                         ) +1 ) TOPTCNT
                  FROM SMRSLT0T A, CCCOMCDT B, APPATBAT C, CSUSERMT D
                 WHERE A.RSLTCONSDATE BETWEEN TO_DATE('20130901','YYYYMMDD') AND TO_dATE('20131130','YYYYMMDD')
                   AND A.CONSROOMNO LIKE 'M%'
                   AND A.PATNO != ' '
                   AND B.GRPCODE = 'SMM28'
                   AND A.CONSROOMNO = B.CODE
                   AND B.OPTION6 = '1'
                   AND B.CODE NOT IN ('M21','M22','M24','M34')
                   AND A.PATNO = C.PATNO
                   AND A.CONSDRID = D.USERID
                 GROUP BY A.PATNO, TRUNC(MONTHS_BETWEEN(A.RSLTCONSDATE,C.BIRTHDAY)/12), A.RSVNOSM, A.MEDLOCATFG, A.CONSROOMNO, B.CODENAME
                     , TO_CHAR(A.RSLTCONSDATE,'YYYY-MM-DD')||' '||SUBSTR(NVL(A.STARTTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.STARTTIME,'0000'),3)||':'||'00'
                     , TO_CHAR(A.RSLTCONSDATE,'YYYY-MM-DD')||' '||SUBSTR(NVL(A.ENDTIME,'0000'),1,2)||':'||SUBSTR(NVL(A.ENDTIME,'0000'),3)||':'||'00'
                     , A.CONSDRID||'-'||D.USERNAME
               ) A
       ) A
