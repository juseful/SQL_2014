SELECT --DISTINCT
       A.ORDDATE, A.MEDLOCATFG, B.SPCNO1, C.ACPTTIME, C.WORKTIME, C.REPTTIME
  FROM SMRSV00T A, MMEXMORT B, SFWORKMT C
 WHERE A.ORDDATE BETWEEN TO_DATE('20140301','YYYYMMDD') AND TO_DATE('20140331','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.DAYCTYN = 'Y'
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND B.PATFG = 'G'
   AND B.PATNO = C.PATNO
   AND B.ORDDATE = C.ORDDATE
   AND B.ORDSEQNO = C.ORDSEQNO
   AND B.SPCNO1 = C.SPCID
   AND C.EXAMCODE = 'BL3119'
 ORDER BY 1,2

SELECT --DISTINCT
       A.ORDDATE, A.MEDLOCATFG, B.SPCNO1, C.ACPTTIME, C.WORKTIME, C.REPTTIME
  FROM SMRSV00T A, MMEXMORT B, SFWORKMT C
 WHERE A.ORDDATE BETWEEN TO_DATE('20140901','YYYYMMDD') AND TO_DATE('20140930','YYYYMMDD')
   AND A.CANCELTIME IS NULL
   AND A.DAYCTYN = 'Y'
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND B.PATFG = 'G'
   AND B.PATNO = C.PATNO
   AND B.ORDDATE = C.ORDDATE
   AND B.ORDSEQNO = C.ORDSEQNO
   AND B.SPCNO1 = C.SPCID
   AND C.EXAMCODE = 'BL3119'
 ORDER BY 1,2