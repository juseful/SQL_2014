-- 분류별… 항목을 정의하기 나름임.
SELECT TO_CHAR(A.ORDDATE,'YYYY-MM') "MONTH", A.MEDLOCATFG
     , COUNT(A.PATNO) CNT
     , SUM(DECODE(A."6.1~6.5"  ,'Y','1','0')) "6.1~6.5"
     , SUM(DECODE(A."6.6~7.0"  ,'Y','1','0')) "6.6~7.0"
     , SUM(DECODE(A."7.1~7.5"  ,'Y','1','0')) "7.1~7.5"
     , SUM(DECODE(A."7.6~8.0"  ,'Y','1','0')) "7.6~8.0"
     , SUM(DECODE(A."8.1~8.5"  ,'Y','1','0')) "8.1~8.5"
     , SUM(DECODE(A."8.6~9.0"  ,'Y','1','0')) "8.6~9.0"
     , SUM(DECODE(A."9.1~9.5"  ,'Y','1','0')) "9.1~9.5"
     , SUM(DECODE(A."9.6~10.0" ,'Y','1','0')) "9.6~10.0"
     , SUM(DECODE(A."10.1~10.5",'Y','1','0')) "10.1~10.5"
     , SUM(DECODE(A."10.6~11.0",'Y','1','0')) "10.6~11.0"
     , SUM(DECODE(A."11.1~11.5",'Y','1','0')) "11.1~11.5"
     , SUM(DECODE(A."11.6~12.0",'Y','1','0')) "11.6~12.0"
     , SUM(DECODE(A."12.1~12.5",'Y','1','0')) "12.1~12.5"
     , SUM(DECODE(A."12.6~13.0",'Y','1','0')) "12.6~13.0"
     , SUM(DECODE(A."13.1~13.5",'Y','1','0')) "13.1~13.5"
     , SUM(DECODE(A."13.6~14.0",'Y','1','0')) "13.6~14.0"
     , SUM(DECODE(A."14.1~14.5",'Y','1','0')) "14.1~14.5"
     , SUM(DECODE(A."14.6~15.0",'Y','1','0')) "14.6~15.0"
     , SUM(DECODE(A."15.1~15.5",'Y','1','0')) "15.1~15.5"
     , SUM(DECODE(A."15.6~16.0",'Y','1','0')) "15.6~16.0"
     , SUM(DECODE(A."16.1~16.5",'Y','1','0')) "16.1~16.5"
     , SUM(DECODE(A."16.6~17.0",'Y','1','0')) "16.6~17.0"
     , SUM(DECODE(A."17.1~17.5",'Y','1','0')) "17.1~17.5"
     , SUM(DECODE(A."17.6~18.0",'Y','1','0')) "17.6~18.0"
     , SUM(DECODE(A."18.1~18.5",'Y','1','0')) "18.1~18.5"
     , SUM(DECODE(A."18.6~19.0",'Y','1','0')) "18.6~19.0"
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
                           WHEN '06:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '06:01' AND '06:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '06:01' AND '06:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "6.1~6.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '06:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '06:31' AND '07:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '06:31' AND '07:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "6.6~7.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '07:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '07:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '07:01' AND '07:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '07:01' AND '07:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "7.1~7.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '07:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '07:31' AND '08:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '07:31' AND '08:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "7.6~8.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '08:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '08:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '08:01' AND '08:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '08:01' AND '08:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "8.1~8.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '08:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '08:31' AND '09:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '08:31' AND '09:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "8.6~9.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '09:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '09:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '09:01' AND '09:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '09:01' AND '09:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "9.1~9.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '09:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '09:31' AND '10:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '09:31' AND '10:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "9.6~10.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '10:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '10:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '10:01' AND '10:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '10:01' AND '10:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "10.1~10.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '10:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '10:31' AND '11:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '10:31' AND '11:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "10.6~11.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '11:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '11:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '11:01' AND '11:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '11:01' AND '11:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "11.1~11.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '11:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '11:31' AND '12:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '11:31' AND '12:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "11.6~12.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '12:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '12:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '12:01' AND '12:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '12:01' AND '12:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "12.1~12.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '12::31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '13::00' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '12::31' AND '13::00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '12::31' AND '13::00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "12.6~13.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '13:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '13:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '13:01' AND '13:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '13:01' AND '13:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "13.1~13.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '13:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '13:31' AND '14:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '13:31' AND '14:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "13.6~14.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '14:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '14:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '14:01' AND '14:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '14:01' AND '14:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "14.1~14.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '14:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '14:31' AND '15:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '14:31' AND '15:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "14.6~15.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '15:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '15:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '15:01' AND '15:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '15:01' AND '15:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "15.1~15.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '15:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '15:31' AND '16:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '15:31' AND '16:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "15.6~16.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '16:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '16:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '16:01' AND '16:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '16:01' AND '16:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "16.1~16.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '16:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '16:31' AND '17:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '16:31' AND '17:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "16.6~17.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '17:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '17:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '17:01' AND '17:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '17:01' AND '17:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "17.1~17.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '17:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '17:31' AND '18:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '17:31' AND '18:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "17.6~18.0"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '18:01' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END||
                      -- 종료시간
                      CASE
                           WHEN '18:30' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
                           ELSE 'N'
                      END
                     ,'NN'
                     ,DECODE(
                             CASE
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '18:01' AND '18:30' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '18:01' AND '18:30' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "18.1~18.5"
             , DECODE(
                      -- 시작시간
                      CASE
                           WHEN '18:31' BETWEEN TO_CHAR(A.STTIME,'HH24:MI') AND TO_CHAR(A.ENDTIME,'HH24:MI') THEN 'Y'
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
                                  WHEN TO_CHAR(A.STTIME,'HH24:MI') BETWEEN '18:31' AND '19:00' THEN 'Y'
                                  ELSE 'N'
                             END||
                             CASE
                                  WHEN TO_CHAR(A.ENDTIME,'HH24:MI') BETWEEN '18:31' AND '19:00' THEN 'Y'
                                  ELSE 'N'
                             END
                            ,'NN','N'
                            ,'Y'
                            )
                     ,'Y'
                     ) "18.6~19.0"
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
                         WHERE A.ORDDATE BETWEEN TO_DATE('20140101','YYYYMMDD') AND TO_DATE('20141130','YYYYMMDD')
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
 ORDER BY 2,1
