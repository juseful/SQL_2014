-- 개인별 시간범위 정보
SELECT A.*
     , B.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,B.BIRTHDAY)/12) AGE
     , DECODE(SUBSTR(B.RESNO2,1,1),'5','외국인','6','외국인','7','외국인','8','외국인','내국인') FGUBUN
     , DECODE(A.TYPG||A.ORGPKGTYP,'재검숙박/CEO',A.ORGPKGTYP,A.TYPG) PKGTYP
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '0601' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '0700' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '0601' AND '0700' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '0601' AND '0700' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "6~7"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '0701' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '0800' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '0701' AND '0800' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '0701' AND '0800' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "7~8"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '0801' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '0900' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '0801' AND '0900' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '0801' AND '0900' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "8~9"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '0901' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1000' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '0901' AND '1000' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '0901' AND '1000' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "9~10"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1001' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1100' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1001' AND '1100' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1001' AND '1100' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "10~11"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1101' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1200' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1101' AND '1200' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1101' AND '1200' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "11~12"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1201' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1300' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1201' AND '1300' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1201' AND '1300' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "12~13"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1301' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1400' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1301' AND '1400' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1301' AND '1400' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "13~14"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1401' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1500' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1401' AND '1500' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1401' AND '1500' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "14~15"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1501' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1600' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1501' AND '1600' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1501' AND '1600' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "15~16"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1601' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1700' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1601' AND '1700' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1601' AND '1700' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "16~17"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1701' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1800' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1701' AND '1800' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1701' AND '1800' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "17~18"
     , DECODE(
              -- 시작시간
              CASE
                   WHEN '1801' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END||
              -- 종료시간
              CASE
                   WHEN '1900' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                   ELSE 'N'
              END
             ,'NN'
             ,DECODE(
                     CASE
                          WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '1801' AND '1900' THEN 'Y'
                          ELSE 'N'
                     END||
                     CASE
                          WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '1801' AND '1900' THEN 'Y'
                          ELSE 'N'
                     END
                    ,'NN','N'
                    ,'Y'
                    )
             ,'Y'
             ) "18~19"
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
                 WHERE A.ORDDATE BETWEEN TO_DATE('20141101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
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
     , APPATBAT B
 WHERE A.PATNO = B.PATNO

-- 분류별… 항목을 정의하기 나름임.
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", A.MEDLOCATFG
     , COUNT(A.PATNO) CNT
     , SUM(DECODE(A."6~7",'Y','1','0'))  "6~7"
     , SUM(DECODE(A."7~8",'Y','1','0'))  "7~8"
     , SUM(DECODE(A."8~9",'Y','1','0'))  "8~9"
     , SUM(DECODE(A."9~10",'Y','1','0')) "9~10"
     , SUM(DECODE(A."10~11",'Y','1','0'))"10~11"
     , SUM(DECODE(A."11~12",'Y','1','0'))"11~12"
     , SUM(DECODE(A."12~13",'Y','1','0'))"12~13"
     , SUM(DECODE(A."13~14",'Y','1','0'))"13~14"
     , SUM(DECODE(A."14~15",'Y','1','0'))"14~15"
     , SUM(DECODE(A."15~16",'Y','1','0'))"15~16"
     , SUM(DECODE(A."16~17",'Y','1','0'))"16~17"
     , SUM(DECODE(A."17~18",'Y','1','0'))"17~18"
     , SUM(DECODE(A."18~19",'Y','1','0'))"18~19"
  FROM (
        SELECT A.*
             , B.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,B.BIRTHDAY)/12) AGE
             , DECODE(SUBSTR(B.RESNO2,1,1),'5','외국인','6','외국인','7','외국인','8','외국인','내국인') FGUBUN
             , DECODE(A.TYPG||A.ORGPKGTYP,'재검숙박/CEO',A.ORGPKGTYP,A.TYPG) PKGTYP
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '06:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '07:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '06:01' AND '07:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '06:01' AND '07:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "6~7"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '07:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '08:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '07:01' AND '08:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '07:01' AND '08:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "7~8"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '08:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '09:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '08:01' AND '09:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '08:01' AND '09:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "8~9"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '09:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '10:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '09:01' AND '10:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '09:01' AND '10:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "9~10"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '10:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '11:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '10:01' AND '11:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '10:01' AND '11:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "10~11"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '11:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '12:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '11:01' AND '12:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '11:01' AND '12:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "11~12"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '12:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '13:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '12:01' AND '13:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '12:01' AND '13:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "12~13"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '13:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '14:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '13:01' AND '14:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '13:01' AND '14:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "13~14"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '14:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '15:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '14:01' AND '15:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '14:01' AND '15:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "14~15"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '15:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '16:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '15:01' AND '16:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '15:01' AND '16:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "15~16"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '16:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '17:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '16:01' AND '17:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '16:01' AND '17:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "16~17"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '17:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '18:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '17:01' AND '18:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '17:01' AND '18:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "17~18"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '18:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '19:00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '18:01' AND '19:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '18:01' AND '19:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "18~19"
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
                         WHERE A.ORDDATE BETWEEN TO_DATE('20141101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
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
             , APPATBAT B
         WHERE A.PATNO = B.PATNO
       ) A
 GROUP BY TO_CHAR(A.ORDDATE,'YYYY-MM'), A.MEDLOCATFG
