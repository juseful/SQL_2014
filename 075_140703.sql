-- 기본대상자
SELECT /* INDEX(A SWWORKMT_IDX9) INDEX(A SWWORKMT_IDX7) INDEX(B MMEXMORT_PK)*/
       A.PATNO, D.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,D.BIRTHDAY)/12) AGE, A.ORDDATE, B.PATFG, B.ORDCODE, C.ORDNAME, B.ORDSEQNO, A.READDR1
  FROM SWWORKMT A, MMEXMORT B, MMORDRCT C, APPATBAT D
 WHERE A.READTIME BETWEEN  TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+.99999
   AND A.READDR1 = '514043'
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND A.ORDSEQNO = B.ORDSEQNO
   AND B.PATFG = 'G'
   AND B.ORDCODE = C.ORDCODE
   AND A.PATNO = D.PATNO

-- 갑초제외 검사결과
SELECT A.*
     , CASE
            WHEN B.RSLTCODENM LIKE '%정상%' THEN '0'
            WHEN UPPER(B.RSLTCODENM) LIKE '%NORMAL%' THEN '0'
       ELSE '1'
       END GUBUN
  FROM (
SELECT A.*, MAX(DECODE(X.EXAMCODE
                      ,A.ORDCODE
                      ,TO_CHAR(X.RSLTTEXT)
                      ,''
                      )) RSLTTEXT
     , (
        SELECT MIN(X.RSLTCODE)
          FROM SMRSLTCT X, SMCDRSMT Y
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND A.ORDCODE = X.EXAMCODE
       ) RSLTCODE
  FROM (
SELECT /* INDEX(A SWWORKMT_IDX9) INDEX(A SWWORKMT_IDX7) INDEX(B MMEXMORT_PK)*/
       A.PATNO, D.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,D.BIRTHDAY)/12) AGE, A.ORDDATE, B.PATFG, B.ORDCODE, C.ORDNAME, B.ORDSEQNO, A.READDR1
  FROM SWWORKMT A, MMEXMORT B, MMORDRCT C, APPATBAT D
 WHERE A.READTIME BETWEEN  TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+.99999
   AND A.READDR1 = '514043'
   AND A.EXAMCODE != 'RS1172'
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND A.ORDSEQNO = B.ORDSEQNO
   AND B.PATFG = 'G'
   AND B.ORDCODE = C.ORDCODE
   AND A.PATNO = D.PATNO
       ) A
     , STRESULT X
 WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND A.ORDSEQNO = X.ORDSEQNO
           AND NVL(X.MODIFYYN,'N') != 'Y'
 GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE, A.PATFG, A.ORDCODE, A.ORDNAME, A.ORDSEQNO, A.READDR1
       ) A
     , SMCDRSMT B
 WHERE A.ORDCODE = B.EXAMCODE(+)
   AND A.RSLTCODE = B.RSLTCODE(+)

-- 갑초결과
                SELECT A.*, MAX(DECODE(X.EXAMCODE
                                      ,A.ORDCODE
                                      ,TO_CHAR(X.RSLTTEXT)
                                      ,''
                                      )) RSLTTEXT
                     , (
                        SELECT MIN(X.RSLTCODE)
                          FROM SMRSLTCT X, SMCDRSMT Y
                         WHERE A.PATNO = X.PATNO
                           AND A.ORDDATE = X.ORDDATE
                           AND A.ORDCODE = X.EXAMCODE
                       ) RSLTCODE
                  FROM (
                        SELECT /* INDEX(A SWWORKMT_IDX9) INDEX(A SWWORKMT_IDX7) INDEX(B MMEXMORT_PK)*/
                               A.PATNO, D.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,D.BIRTHDAY)/12) AGE, A.ORDDATE, B.PATFG, B.ORDCODE, C.ORDNAME, B.ORDSEQNO, A.READDR1
                          FROM SWWORKMT A, MMEXMORT B, MMORDRCT C, APPATBAT D
                         WHERE --A.PATNO = ''
                               --AND
                               A.READTIME BETWEEN  TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+.99999
                           AND A.READDR1 = '514043'
                           AND A.EXAMCODE = 'RS1172'
                           AND A.PATNO = B.PATNO
                           AND A.ORDDATE = B.ORDDATE
                           AND A.ORDSEQNO = B.ORDSEQNO
                           AND B.PATFG = 'G'
                           AND B.ORDCODE = C.ORDCODE
                           AND A.PATNO = D.PATNO
                       ) A
                     , STRESULT X
                 WHERE A.PATNO = X.PATNO
                           AND A.ORDDATE = X.ORDDATE
                           AND A.ORDSEQNO = X.ORDSEQNO
                           AND NVL(X.MODIFYYN,'N') != 'Y'
                 GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE, A.PATFG, A.ORDCODE, A.ORDNAME, A.ORDSEQNO, A.READDR1

-- 갑초 2014 결과 + 이전 결과
SELECT A.*
     , MAX(DECODE(B.EXAMCODE,'RS1172',TO_CHAR(B.RSLTTEXT),'')) PASTRSLT
  FROM (
        SELECT -- 갑초결과
               A.*
             , MAX(B.ORDDATE) PASTORD
          FROM (
                SELECT A.*, MAX(DECODE(X.EXAMCODE
                                      ,A.ORDCODE
                                      ,TO_CHAR(X.RSLTTEXT)
                                      ,''
                                      )) RSLTTEXT
                     , (
                        SELECT MIN(X.RSLTCODE)
                          FROM SMRSLTCT X, SMCDRSMT Y
                         WHERE A.PATNO = X.PATNO
                           AND A.ORDDATE = X.ORDDATE
                           AND A.ORDCODE = X.EXAMCODE
                       ) RSLTCODE
                  FROM (
                        SELECT /* INDEX(A SWWORKMT_IDX9) INDEX(A SWWORKMT_IDX7) INDEX(B MMEXMORT_PK)*/
                               A.PATNO, D.SEX, TRUNC(MONTHS_BETWEEN(A.ORDDATE,D.BIRTHDAY)/12) AGE, A.ORDDATE, B.PATFG, B.ORDCODE, C.ORDNAME, B.ORDSEQNO, A.READDR1
                          FROM SWWORKMT A, MMEXMORT B, MMORDRCT C, APPATBAT D
                         WHERE --A.PATNO = ''
                               --AND
                               A.READTIME BETWEEN  TO_DATE(&D1,'YYYYMMDD') AND TO_DATE(&D2,'YYYYMMDD')+.99999
                           AND A.READDR1 = '514043'
                           AND A.EXAMCODE = 'RS1172'
                           AND A.PATNO = B.PATNO
                           AND A.ORDDATE = B.ORDDATE
                           AND A.ORDSEQNO = B.ORDSEQNO
                           AND B.PATFG = 'G'
                           AND B.ORDCODE = C.ORDCODE
                           AND A.PATNO = D.PATNO
                       ) A
                     , STRESULT X
                 WHERE A.PATNO = X.PATNO
                           AND A.ORDDATE = X.ORDDATE
                           AND A.ORDSEQNO = X.ORDSEQNO
                           AND NVL(X.MODIFYYN,'N') != 'Y'
                 GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE, A.PATFG, A.ORDCODE, A.ORDNAME, A.ORDSEQNO, A.READDR1
               ) A
             , MMEXMORT B
         WHERE NVL(A.RSLTCODE,'XXXX') = '1004'
           AND A.PATNO = B.PATNO
           AND A.ORDDATE > B.ORDDATE
           AND B.PATFG = 'G'
           AND B.ORDCODE = 'RS1172'
         GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE, A.PATFG, A.ORDCODE, A.ORDNAME, A.ORDSEQNO, A.READDR1, A.RSLTTEXT, A.RSLTCODE
       ) A
     , STRESULT B
 WHERE A.PATNO = B.PATNO
   AND A.PASTORD = B.ORDDATE
   AND EXISTS (-- 건진처방 결과만 가져오기
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE B.PATNO = X.PATNO
                  AND B.ORDDATE = X.ORDDATE
                  AND B.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.PATNO, A.ORDDATE, A.SEX, A.AGE, A.PATFG, A.ORDCODE, A.ORDNAME, A.ORDSEQNO, A.READDR1, A.RSLTTEXT, A.RSLTCODE, A.PASTORD
