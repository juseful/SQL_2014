-- 영양소분석값, 이진영 교수님 추가 1차
SELECT A.PATNO||A.ORDDATE CONT
     , A.PATNO, A.ORDDATE
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , MAX(DECODE(C.FOODCODE,'3A70101',C.NUM1,'')) KCAL
     , MAX(DECODE(C.FOODCODE,'3A70103',C.NUM1,'')) WATER
     , MAX(DECODE(C.FOODCODE,'3A70104',C.NUM1,'')) PROTEIN
     , MAX(DECODE(C.FOODCODE,'3A70105',C.NUM1,'')) LIPID
     , MAX(DECODE(C.FOODCODE,'3A70106',C.NUM1,'')) DANGJIL
     , MAX(DECODE(C.FOODCODE,'3A70107',C.NUM1,'')) JOSUMYUSO
     , MAX(DECODE(C.FOODCODE,'3A70108',C.NUM1,'')) CARBONHYDRATE
     , MAX(DECODE(C.FOODCODE,'3A70109',C.NUM1,'')) CA
     , MAX(DECODE(C.FOODCODE,'3A70110',C.NUM1,'')) P
     , MAX(DECODE(C.FOODCODE,'3A70111',C.NUM1,'')) FE
     , MAX(DECODE(C.FOODCODE,'3A70112',C.NUM1,'')) ZN
     , MAX(DECODE(C.FOODCODE,'3A70113',C.NUM1,'')) MG
     , MAX(DECODE(C.FOODCODE,'3A70114',C.NUM1,'')) NA
     , MAX(DECODE(C.FOODCODE,'3A70115',C.NUM1,'')) K
     , MAX(DECODE(C.FOODCODE,'3A70116',C.NUM1,'')) V_A
     , MAX(DECODE(C.FOODCODE,'3A70117',C.NUM1,'')) RETINOL
     , MAX(DECODE(C.FOODCODE,'3A70118',C.NUM1,'')) VETACARO
     , MAX(DECODE(C.FOODCODE,'3A70119',C.NUM1,'')) V_D
     , MAX(DECODE(C.FOODCODE,'3A70120',C.NUM1,'')) V_E
     , MAX(DECODE(C.FOODCODE,'3A70121',C.NUM1,'')) V_C
     , MAX(DECODE(C.FOODCODE,'3A70122',C.NUM1,'')) V_B1
     , MAX(DECODE(C.FOODCODE,'3A70123',C.NUM1,'')) V_B2
     , MAX(DECODE(C.FOODCODE,'3A70124',C.NUM1,'')) NIACIN
     , MAX(DECODE(C.FOODCODE,'3A70125',C.NUM1,'')) V_B6
     , MAX(DECODE(C.FOODCODE,'3A70126',C.NUM1,'')) FOLIC_ACID
     , MAX(DECODE(C.FOODCODE,'3A70127',C.NUM1,'')) V_B12
     , MAX(DECODE(C.FOODCODE,'3A70128',C.NUM1,'')) DISCARD
     , MAX(DECODE(C.FOODCODE,'3A70129',C.NUM1,'')) CHOLESTEROL
     , MAX(DECODE(C.FOODCODE,'3A70130',C.NUM1,'')) TOTAL_FATTYACID
     , MAX(DECODE(C.FOODCODE,'3A70131',C.NUM1,'')) SATU_FATTYACID
     , MAX(DECODE(C.FOODCODE,'3A70132',C.NUM1,'')) MONO_UNSATU_FA
     , MAX(DECODE(C.FOODCODE,'3A70133',C.NUM1,'')) MULTI_UNSATU_FA
     , MAX(DECODE(C.FOODCODE,'3A70134',C.NUM1,'')) ALPHA_CHAROTIN
     , MAX(DECODE(C.FOODCODE,'3A70135',C.NUM1,'')) PRO_A_CHAROTIN
     , MAX(DECODE(C.FOODCODE,'3A70136',C.NUM1,'')) RYCOPEN
     , MAX(DECODE(C.FOODCODE,'3A70137',C.NUM1,'')) RUTEIN
     , MAX(DECODE(C.FOODCODE,'3A70138',C.NUM1,'')) ALCOHOL
     , MAX(DECODE(C.FOODCODE,'3A70139',C.NUM1,'')) FIBER
  FROM (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A
         WHERE A.PATNO IN (-- 1차, 2차
                          )
           AND A.PATNO||A.ORDDATE IN (-- 1차, 2차
                                     )
       ) A
     , SMFOODRT C
 WHERE A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
 GROUP BY A.PATNO, A.ORDDATE

-- 스트레스 총점, 이진영 교수님 추가 1차
SELECT A.PATNO||A.ORDDATE CONT
     , A.PATNO, A.ORDDATE
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , (-- 스트레스 총점
        SELECT /* INDEX(X SMQUESAT_PK)*/
         MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-1-1CY',G.FOODBASEQTY
                                                  ,'24-1-2CY',G.FOODBASEQTY
                                                  ,'24-1-3CY',G.FOODBASEQTY
                                                  ,'24-1-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_01
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-2-1CY',G.FOODBASEQTY
                                                  ,'24-2-2CY',G.FOODBASEQTY
                                                  ,'24-2-3CY',G.FOODBASEQTY
                                                  ,'24-2-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_02
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-3-1CY',G.FOODBASEQTY
                                                  ,'24-3-2CY',G.FOODBASEQTY
                                                  ,'24-3-3CY',G.FOODBASEQTY
                                                  ,'24-3-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_03
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-4-1CY',G.FOODBASEQTY
                                                  ,'24-4-2CY',G.FOODBASEQTY
                                                  ,'24-4-3CY',G.FOODBASEQTY
                                                  ,'24-4-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_04
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-5-1CY',G.FOODBASEQTY
                                                  ,'24-5-2CY',G.FOODBASEQTY
                                                  ,'24-5-3CY',G.FOODBASEQTY
                                                  ,'24-5-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_05
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-6-1CY',G.FOODBASEQTY
                                                  ,'24-6-2CY',G.FOODBASEQTY
                                                  ,'24-6-3CY',G.FOODBASEQTY
                                                  ,'24-6-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_06
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-7-1CY',G.FOODBASEQTY
                                                  ,'24-7-2CY',G.FOODBASEQTY
                                                  ,'24-7-3CY',G.FOODBASEQTY
                                                  ,'24-7-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_07
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-8-1CY',G.FOODBASEQTY
                                                  ,'24-8-2CY',G.FOODBASEQTY
                                                  ,'24-8-3CY',G.FOODBASEQTY
                                                  ,'24-8-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_08
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-9-1CY',G.FOODBASEQTY
                                                  ,'24-9-2CY',G.FOODBASEQTY
                                                  ,'24-9-3CY',G.FOODBASEQTY
                                                  ,'24-9-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_09
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-10-1CY',G.FOODBASEQTY
                                                  ,'24-10-2CY',G.FOODBASEQTY
                                                  ,'24-10-3CY',G.FOODBASEQTY
                                                  ,'24-10-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_10
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-11-1CY',G.FOODBASEQTY
                                                  ,'24-11-2CY',G.FOODBASEQTY
                                                  ,'24-11-3CY',G.FOODBASEQTY
                                                  ,'24-11-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_11
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-12-1CY',G.FOODBASEQTY
                                                  ,'24-12-2CY',G.FOODBASEQTY
                                                  ,'24-12-3CY',G.FOODBASEQTY
                                                  ,'24-12-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_12
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-13-1CY',G.FOODBASEQTY
                                                  ,'24-13-2CY',G.FOODBASEQTY
                                                  ,'24-13-3CY',G.FOODBASEQTY
                                                  ,'24-13-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_13
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-14-1CY',G.FOODBASEQTY
                                                  ,'24-14-2CY',G.FOODBASEQTY
                                                  ,'24-14-3CY',G.FOODBASEQTY
                                                  ,'24-14-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_14
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-15-1CY',G.FOODBASEQTY
                                                  ,'24-15-2CY',G.FOODBASEQTY
                                                  ,'24-15-3CY',G.FOODBASEQTY
                                                  ,'24-15-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_15
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-16-1CY',G.FOODBASEQTY
                                                  ,'24-16-2CY',G.FOODBASEQTY
                                                  ,'24-16-3CY',G.FOODBASEQTY
                                                  ,'24-16-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_16
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-17-1CY',G.FOODBASEQTY
                                                  ,'24-17-2CY',G.FOODBASEQTY
                                                  ,'24-17-3CY',G.FOODBASEQTY
                                                  ,'24-17-4CY',G.FOODBASEQTY
                                                  ,''))                                                                 --PWI_SF_17
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-18-1CY',G.FOODBASEQTY
                                                  ,'24-18-2CY',G.FOODBASEQTY
                                                  ,'24-18-3CY',G.FOODBASEQTY
                                                  ,'24-18-4CY',G.FOODBASEQTY
                                                  ,''))
          FROM SMQUESAT f, SMQUESMT G
         WHERE A.PATNO = f.PATNO
           AND A.ORDDATE = F.ORDDATE
           AND F.QCODE1 LIKE '24%'
           AND F.QCODE1 = G.QCODE
       ) "stress_totalSCORE"
 FROM (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A
         WHERE A.PATNO IN (-- 1차, 2차
                          )
           AND A.PATNO||A.ORDDATE IN (-- 1차, 2차
                                     )
      ) A
 GROUP BY A.PATNO, A.ORDDATE;
