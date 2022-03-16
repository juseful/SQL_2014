-- 최종!!
SELECT A.*
     , MAX(DECODE(B.EXAMCODE,'SM0102'  ,B.RSLTNUM,''))                                                   "Wt"
     , MAX(DECODE(B.EXAMCODE,'SM0101'  ,B.RSLTNUM,''))                                                   "Ht"
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,''))                                                   BMI
     , MAX(DECODE(B.EXAMCODE,'SM010502'  ,B.RSLTNUM,''))                                                 "AB_Girth"
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(TO_CHAR(B.RSLTNUM),1,INSTR(TO_CHAR(B.RSLTNUM),'/')-1),''))  SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(TO_CHAR(B.RSLTNUM),INSTR(TO_CHAR(B.RSLTNUM),'/')+1),''))    DBP
     , MAX(DECODE(B.EXAMCODE,'BL2011'  ,B.RSLTNUM,''))                                                   "WBC"
     , MAX(DECODE(B.EXAMCODE,'BL2012'  ,B.RSLTNUM,''))                                                   "RBC"
     , MAX(DECODE(B.EXAMCODE,'BL2013'  ,B.RSLTNUM,''))                                                   "Hb"
     , MAX(DECODE(B.EXAMCODE,'BL2014'  ,B.RSLTNUM,''))                                                   "Hct"
     , MAX(DECODE(B.EXAMCODE,'BL201401',B.RSLTNUM,''))                                                   "MCV"
     , MAX(DECODE(B.EXAMCODE,'BL201402',B.RSLTNUM,''))                                                   "MCH"
     , MAX(DECODE(B.EXAMCODE,'BL201403',B.RSLTNUM,''))                                                   "MCHC"
     , MAX(DECODE(B.EXAMCODE,'BL2015'  ,B.RSLTNUM,''))                                                   "RDW"
     , MAX(DECODE(B.EXAMCODE,'BL2016'  ,B.RSLTNUM,''))                                                   "PLT"
     , MAX(DECODE(B.EXAMCODE,'BL2017'  ,B.RSLTNUM,''))                                                   "PDW"
     , MAX(DECODE(B.EXAMCODE,'BL201701',B.RSLTNUM,''))                                                   "MPV"
     , MAX(DECODE(B.EXAMCODE,'BL201801',B.RSLTNUM,''))                                                   "Blast"
     , MAX(DECODE(B.EXAMCODE,'BL201802',B.RSLTNUM,''))                                                   "Promyelocyte"
     , MAX(DECODE(B.EXAMCODE,'BL201803',B.RSLTNUM,''))                                                   "Myelocyte"
     , MAX(DECODE(B.EXAMCODE,'BL201804',B.RSLTNUM,''))                                                   "Metamyelocyte"
     , MAX(DECODE(B.EXAMCODE,'BL201805',B.RSLTNUM,''))                                                   "Band neutrophil"
     , MAX(DECODE(B.EXAMCODE,'BL201806',B.RSLTNUM,''))                                                   "Segmented neutrophil"
     , MAX(DECODE(B.EXAMCODE,'BL201807',B.RSLTNUM,''))                                                   "Eosinophil"
     , MAX(DECODE(B.EXAMCODE,'BL201808',B.RSLTNUM,''))                                                   "Basophil"
     , MAX(DECODE(B.EXAMCODE,'BL201809',B.RSLTNUM,''))                                                   "Lymphocyte"
     , MAX(DECODE(B.EXAMCODE,'BL201810',B.RSLTNUM,''))                                                   "Monocyte"
     , MAX(DECODE(B.EXAMCODE,'BL201811',B.RSLTNUM,''))                                                   "Atypical Lymphocyte"
     , MAX(DECODE(B.EXAMCODE,'BL201812',B.RSLTNUM,''))                                                   "Immature cell"
     , MAX(DECODE(B.EXAMCODE,'BL201813',B.RSLTNUM,''))                                                   "Plasma cell"
     , MAX(DECODE(B.EXAMCODE,'BL201814',B.RSLTNUM,''))                                                   "Nucleated RBC"
     , MAX(DECODE(B.EXAMCODE,'BL201815',B.RSLTNUM,''))                                                   "ANC"
     , MAX(DECODE(B.EXAMCODE,'BL201816',B.RSLTNUM,''))                                                   "ALC"
     , MAX(DECODE(B.EXAMCODE,'BL211101',B.RSLTNUM,''))                                                   "PT(sec)"
     , MAX(DECODE(B.EXAMCODE,'BL211102',B.RSLTNUM,''))                                                   "PT( % )"
     , MAX(DECODE(B.EXAMCODE,'BL211103',B.RSLTNUM,''))                                                   "PT(INR)"
     , MAX(DECODE(B.EXAMCODE,'BL2112'  ,B.RSLTNUM,''))                                                   "APTT"
     , MAX(DECODE(B.EXAMCODE,'BL2113'  ,B.RSLTNUM,''))                                                   "Fibrinogen"
     , MAX(DECODE(B.EXAMCODE,'BL2117'  ,B.RSLTNUM,''))                                                   "D-dimer"
     , MAX(DECODE(B.EXAMCODE,'BL2136'  ,B.RSLTNUM,''))                                                   "PAI-1"
     , MAX(DECODE(B.EXAMCODE,'BL3111'  ,B.RSLTNUM,''))                                                   "Protein"
     , MAX(DECODE(B.EXAMCODE,'BL3112'  ,B.RSLTNUM,''))                                                   "Albumin"
     , MAX(DECODE(B.EXAMCODE,'BL311201',B.RSLTNUM,''))                                                   "Globulin"
     , MAX(DECODE(B.EXAMCODE,'BL311202',B.RSLTNUM,''))                                                   "A/G ratio"
     , MAX(DECODE(B.EXAMCODE,'BL3113'  ,B.RSLTNUM,''))                                                   "Cholesterol"
     , MAX(DECODE(B.EXAMCODE,'BL3114'  ,B.RSLTNUM,''))                                                   "Bilirubin, Total"
     , MAX(DECODE(B.EXAMCODE,'BL3115'  ,B.RSLTNUM,''))                                                   "AST"
     , MAX(DECODE(B.EXAMCODE,'BL3116'  ,B.RSLTNUM,''))                                                   "ALT"
     , MAX(DECODE(B.EXAMCODE,'BL3117'  ,B.RSLTNUM,''))                                                   "ALP"
     , MAX(DECODE(B.EXAMCODE,'BL3118'  ,B.RSLTNUM,''))                                                   "Glucose, Fasting"
     , MAX(DECODE(B.EXAMCODE,'BL3119'  ,B.RSLTNUM,''))                                                   "BUN"
     , MAX(DECODE(B.EXAMCODE,'BL3120'  ,B.RSLTNUM,''))                                                   "Creatinine"
     , MAX(DECODE(B.EXAMCODE,'BL312001',B.RSLTNUM,''))                                                   "BUN & Creatinine ratio"
     , MAX(DECODE(B.EXAMCODE,'BL312002',B.RSLTNUM,''))                                                   "Estimated GFR"
     , MAX(DECODE(B.EXAMCODE,'BL3121'  ,B.RSLTNUM,''))                                                   "Uric Acid"
     , MAX(DECODE(B.EXAMCODE,'BL3122'  ,B.RSLTNUM,''))                                                   "Calcium"
     , MAX(DECODE(B.EXAMCODE,'BL3123'  ,B.RSLTNUM,''))                                                   "Phosphorus"
     , MAX(DECODE(B.EXAMCODE,'BL3125'  ,B.RSLTNUM,''))                                                   "GGT"
     , MAX(DECODE(B.EXAMCODE,'BL3164'  ,B.RSLTNUM,''))                                                   "HbA1C"
     , MAX(DECODE(B.EXAMCODE,'NR1103'  ,B.RSLTNUM,''))                                                   "CA-125"
     , MAX(DECODE(B.EXAMCODE,'NR4101'  ,B.RSLTNUM,''))                                                   "T3"
     , MAX(DECODE(B.EXAMCODE,'NR4103'  ,B.RSLTNUM,''))                                                   "TSH"
     , MAX(DECODE(B.EXAMCODE,'NR4302'  ,B.RSLTNUM,''))                                                   "Thyroglobulin"
     , MAX(DECODE(B.EXAMCODE,'NR4303'  ,B.RSLTNUM,''))                                                   "Free T4"
     , MAX(DECODE(B.EXAMCODE,'NR5101'  ,B.RSLTNUM,''))                                                   "Estradiol(E2)"
     , MAX(DECODE(B.EXAMCODE,'NR5103'  ,B.RSLTNUM,''))                                                   "Progesterone"
     , MAX(DECODE(B.EXAMCODE,'NR5106'  ,B.RSLTNUM,''))                                                   "Testosterone"
     , MAX(DECODE(B.EXAMCODE,'NR5110'  ,B.RSLTNUM,''))                                                   "SHBG"
     , MAX(DECODE(B.EXAMCODE,'NR5113'  ,B.RSLTNUM,''))                                                   "Free Testosterone"
     , MAX(DECODE(B.EXAMCODE,'NR6103'  ,B.RSLTNUM,''))                                                   "Prolactin"
     , MAX(DECODE(B.EXAMCODE,'NR6105'  ,B.RSLTNUM,''))                                                   "FSH"
     , MAX(DECODE(B.EXAMCODE,'NR7104'  ,B.RSLTNUM,''))                                                   "Insulin"
     , MAX(DECODE(B.EXAMCODE,'NR7105'  ,B.RSLTNUM,''))                                                   "C-Peptide"
     , MAX(DECODE(B.EXAMCODE,'BL3304'  ,B.RSLTNUM,''))                                                   "Apo A1"
     , MAX(DECODE(B.EXAMCODE,'BL3305'  ,B.RSLTNUM,''))                                                   "Apo B"
     , MAX(DECODE(B.EXAMCODE,'BL3307'  ,B.RSLTNUM,''))                                                   "Lp(a)"
     , MAX(DECODE(B.EXAMCODE,'BL2021'  ,B.RSLTNUM,''))                                                   "ESR"
     , MAX(DECODE(B.EXAMCODE,'BL3140'  ,B.RSLTNUM,''))                                                   "CRP"
     , MAX(DECODE(B.EXAMCODE,'BL3A2502',B.RSLTNUM,''))                                                   "Homocysteine"
     , MAX(DECODE(B.EXAMCODE,'BL3652'  ,B.RSLTNUM,''))                                                   "Deoxypyridinoline"
     , MAX(DECODE(B.EXAMCODE,'BL3653'  ,B.RSLTNUM,''))                                                   "Osteocalcin"
     , MAX(DECODE(B.EXAMCODE,'BL3665'  ,B.RSLTNUM,''))                                                   "CTx, Serum"
     , MAX(DECODE(B.EXAMCODE,'BL399201',B.RSLTNUM,''))                                                   "Vitamin D2 (HPLC)"
     , MAX(DECODE(B.EXAMCODE,'BL399202',B.RSLTNUM,''))                                                   "Vitamin D3 (HPLC)"
     , MAX(DECODE(B.EXAMCODE,'BL399203',B.RSLTNUM,''))                                                   "Vitamin D,  25-Hydroxy "
     , MAX(DECODE(B.EXAMCODE,'RG9214'  ,TO_CHAR(B.RSLTTEXT),''))                                         "BMD"
     , MAX(DECODE(B.EXAMCODE,'BL3113'  ,B.RSLTNUM,''))                                                   "Cholesterol"
     , MAX(DECODE(B.EXAMCODE,'BL3141'  ,B.RSLTNUM,''))                                                   "TG"
     , MAX(DECODE(B.EXAMCODE,'BL3142'  ,B.RSLTNUM,''))                                                   "HDL"
     , MAX(DECODE(B.EXAMCODE,'BL314201',B.RSLTNUM,''))                                                   "LDL"
     , MAX(DECODE(B.EXAMCODE,'BL314202',B.RSLTNUM,''))                                                   "Calculated LDL-C"
     , MAX(DECODE(B.EXAMCODE,'BL3364'  ,TO_CHAR(B.RSLTTEXT),''))                                         "LDL_Subfraction"
     , MAX(DECODE(B.EXAMCODE,'RM1010HC',TO_CHAR(B.RSLTTEXT),''))                                         "B_MRI_DEMENTIA"
     , MAX(DECODE(B.EXAMCODE,'RM3170HC',TO_CHAR(B.RSLTTEXT),''))                                         "B_MRI_MRA_DEMENTIA"
     , MAX(DECODE(B.EXAMCODE,'RM3170N' ,TO_CHAR(B.RSLTTEXT),''))                                         "B_MRI_MRA"
     , MAX(DECODE(B.EXAMCODE,'BS2111'  ,TO_CHAR(B.RSLTTEXT),''))                                         "ECG"
     , MAX(DECODE(B.EXAMCODE,'BS2231'  ,TO_CHAR(B.RSLTTEXT),''))                                         "ECHO"
     , MAX(DECODE(B.EXAMCODE,'SM3750'  ,TO_CHAR(B.RSLTTEXT),''))                                         "Treadmill"
     , MAX(DECODE(B.EXAMCODE,'RC2110'  ,TO_CHAR(B.RSLTTEXT),''))                                         "PELVIS ROUTINE CT"
     , MAX(DECODE(B.EXAMCODE,'RC2115'  ,TO_CHAR(B.RSLTTEXT),''))                                         "PELVIS NON-CONTRAST CT"
     , MAX(DECODE(B.EXAMCODE,'RC3120'  ,TO_CHAR(B.RSLTTEXT),''))                                         "ABDOMEN + PELVIS CT"
     , MAX(DECODE(B.EXAMCODE,'RM2070'  ,TO_CHAR(B.RSLTTEXT),''))                                         "PELVIS MRI"
     , MAX(DECODE(B.EXAMCODE,'SM1805'  ,TO_CHAR(B.RSLTTEXT),''))                                         "TRANSVAGINAL U.S"
     , MAX(DECODE(B.EXAMCODE,'RC2010'  ,TO_CHAR(B.RSLTTEXT),''))                                         "ABDOMEN POST-CONTRAST CT"
     , MAX(DECODE(B.EXAMCODE,'RG923C'  ,TO_CHAR(B.RSLTTEXT),''))                                         "MAMMO(ROUTINE BILATERAL)"
     , MAX(DECODE(B.EXAMCODE,'RG923D'  ,TO_CHAR(B.RSLTTEXT),''))                                         "MAMMO(ROUTINE UNILATERAL)"
     , MAX(DECODE(B.EXAMCODE,'RG927C'  ,TO_CHAR(B.RSLTTEXT),''))                                         "MAMMO(MAGNIFICATION)"
     , MAX(DECODE(B.EXAMCODE,'RS1010'  ,TO_CHAR(B.RSLTTEXT)
                            ,'RS1031'  ,TO_CHAR(B.RSLTTEXT),''))                                         "ABDOMEN US"
     , MAX(DECODE(B.EXAMCODE,'RS1172'  ,TO_CHAR(B.RSLTTEXT),''))                                         "THYROID US"
     , MAX(DECODE(B.EXAMCODE,'RS1190'  ,TO_CHAR(B.RSLTTEXT),''))                                         "BREAST US"
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA16Y' ,F.QCODENM
                                                  ,'MA17Y' ,F.QCODENM
                                                  ,'MA18Y' ,F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)   MA1Q02
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA19'  ,F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)     MA1Q0201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA110' ,F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)    MA1Q0202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA112Y',F.QCODENM
                                                  ,'MA113Y',F.QCODENM
                                                  ,'MA114Y',F.QCODENM
                                                  ,'MA115Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA117Y',F.QCODENM
                                                  ,'MA118Y',F.QCODENM
                                                  ,'MA119Y',F.QCODENM
                                                  ,'MA120Y',F.QCODENM
                                                  ,'MA121Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0204
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA123Y',F.QCODENM
                                                  ,'MA124Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q03
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA125' ,F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)    MA1Q0301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA127Y',F.QCODENM
                                                  ,'MA128Y',F.QCODENM
                                                  ,'MA129Y',F.QCODENM
                                                  ,'MA130Y',F.QCODENM
                                                  ,'MA131Y',F.QCODENM
                                                  ,'MA132Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA134Y',F.QCODENM
                                                  ,'MA135Y',F.QCODENM
                                                  ,'MA136Y',F.QCODENM
                                                  ,'MA137Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA149Y',F.QCODENM
                                                  ,'MA150Y',F.QCODENM
                                                  ,'MA151Y',F.QCODENM
                                                  ,'MA152Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q05
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA154Y',F.QCODENM
                                                  ,'MA155Y',F.QCODENM
                                                  ,'MA156Y',F.QCODENM
                                                  ,'MA157Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA159Y',F.QCODENM
                                                  ,'MA160Y',F.QCODENM
                                                  ,'MA161Y',F.QCODENM
                                                  ,'MA162Y',F.QCODENM
                                                  ,'MA163Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1715Y',F.QCODENM
                                                  ,'MA1716Y',F.QCODENM
                                                  ,'MA1717Y',F.QCODENM
                                                  ,'MA1718Y',F.QCODENM
                                                  ,'MA1719Y',F.QCODENM
                                                  ,'MA1720Y',F.QCODENM
                                                  ,'MA1721Y',F.QCODENM
                                                  ,'MA1722Y',F.QCODENM
                                                  ,'MA1723Y',F.QCODENM
                                                  ,'MA1724Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q20
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1726Y',F.QCODENM
                                                  ,'MA1727Y',F.QCODENM
                                                  ,'MA1728Y',F.QCODENM
                                                  ,'MA1729Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q21
     , (SELECT DECODE(MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1730','만 '||F.ACODE1||' 세','')),'만  세','',MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1730','만 '||F.ACODE1||' 세',''))) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)           MA1Q2101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1732Y',F.QCODENM
                                                  ,'MA1733Y',F.QCODENM
                                                  ,'MA1734Y',F.QCODENM
                                                  ,'MA1735Y',F.QCODENM
                                                  ,'MA1736Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q2102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1739Y',F.QCODENM
                                                  ,'MA1740Y',F.QCODENM
                                                  ,'MA1741Y',F.QCODENM
                                                  ,'MA1742Y',F.QCODENM
                                                  ,'MA1743Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q2201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1745Y',F.QCODENM
                                                  ,'MA1746Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q2202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA172Y','Y'
                                                  ,'MA173Y','Y'
                                                  ,'MA174Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q0602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA172Y',F.QCODENM
                                                  ,'MA173Y',F.QCODENM
                                                  ,'MA174Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA175',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA167Y','Y'
                                                  ,'MA168Y','Y'
                                                  ,'MA169Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                       MA1Q0601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA167Y',F.QCODENM
                                                  ,'MA168Y',F.QCODENM
                                                  ,'MA169Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA170',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA177Y','Y'
                                                  ,'MA178Y','Y'
                                                  ,'MA179Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q0603
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA177Y',F.QCODENM
                                                  ,'MA178Y',F.QCODENM
                                                  ,'MA179Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA180',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA182Y','Y'
                                                  ,'MA183Y','Y'
                                                  ,'MA184Y','Y'
                                                  ,'MA185Y','Y'
                                                  ,'MA186Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q0604
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA182Y',F.QCODENM
                                                  ,'MA183Y',F.QCODENM
                                                  ,'MA184Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA185Y',F.QCODENM
                                                  ,'MA186Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA187',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA189Y','Y'
                                                  ,'MA190Y','Y'
                                                  ,'MA191Y','Y'
                                                  ,'MA192Y','Y'
                                                  ,'MA193Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q0605
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA189Y',F.QCODENM
                                                  ,'MA190Y',F.QCODENM
                                                  ,'MA191Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA192Y',F.QCODENM
                                                  ,'MA193Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA194',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060503
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1103Y','Y'
                                                  ,'MA1104Y','Y'
                                                  ,'MA1105Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0607
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1103Y',F.QCODENM
                                                  ,'MA1104Y',F.QCODENM
                                                  ,'MA1105Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q060701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1106',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q060702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1108Y','Y'
                                                  ,'MA1109Y','Y'
                                                  ,'MA1110Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0608
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1108Y',F.QCODENM
                                                  ,'MA1109Y',F.QCODENM
                                                  ,'MA1110Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q060801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1111',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q060802
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1113Y','Y'
                                                  ,'MA1114Y','Y'
                                                  ,'MA1115Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0609
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1113Y',F.QCODENM
                                                  ,'MA1114Y',F.QCODENM
                                                  ,'MA1115Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q060901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1116',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q060902
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1118Y','Y'
                                                  ,'MA1119Y','Y'
                                                  ,'MA1120Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0610
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1118Y',F.QCODENM
                                                  ,'MA1119Y',F.QCODENM
                                                  ,'MA1120Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1121',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061002
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA196Y','Y'
                                                  ,'MA197Y','Y'
                                                  ,'MA198Y','Y'
                                                  ,'MA199Y','Y'
                                                  ,'MA1100Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0606
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA196Y',F.QCODENM
                                                  ,'MA197Y',F.QCODENM
                                                  ,'MA198Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA199Y',F.QCODENM
                                                  ,'MA1100Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q060602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1101',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q060603
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1123Y','Y'
                                                  ,'MA1124Y','Y'
                                                  ,'MA1125Y','Y'
                                                  ,'MA1126Y','Y'
                                                  ,'MA1127Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0611
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1123Y',F.QCODENM
                                                  ,'MA1124Y',F.QCODENM
                                                  ,'MA1125Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1126Y',F.QCODENM
                                                  ,'MA1127Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1128',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1166Y','Y'
                                                  ,'MA1167Y','Y'
                                                  ,'MA1168Y','Y'
                                                  ,'MA1169Y','Y'
                                                  ,'MA1170Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0618
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1166Y',F.QCODENM
                                                  ,'MA1167Y',F.QCODENM
                                                  ,'MA1168Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1169Y',F.QCODENM
                                                  ,'MA1170Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061802
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1171',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061803
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1173Y','Y'
                                                  ,'MA1174Y','Y'
                                                  ,'MA1175Y','Y'
                                                  ,'MA1176Y','Y'
                                                  ,'MA1177Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0619
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1173Y',F.QCODENM
                                                  ,'MA1174Y',F.QCODENM
                                                  ,'MA1175Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1176Y',F.QCODENM
                                                  ,'MA1177Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061902
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1178',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061903
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1180Y','Y'
                                                  ,'MA1181Y','Y'
                                                  ,'MA1182Y','Y'
                                                  ,'MA1183Y','Y'
                                                  ,'MA1184Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0620
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1180Y',F.QCODENM
                                                  ,'MA1181Y',F.QCODENM
                                                  ,'MA1182Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1183Y',F.QCODENM
                                                  ,'MA1184Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062002
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1185',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q062003
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1201Y','Y'
                                                  ,'MA1202Y','Y'
                                                  ,'MA1203Y','Y'
                                                  ,'MA1204Y','Y'
                                                  ,'MA1205Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0623
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1201Y',F.QCODENM
                                                  ,'MA1202Y',F.QCODENM
                                                  ,'MA1203Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1204Y',F.QCODENM
                                                  ,'MA1205Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1206',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q062303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1208Y','Y'
                                                  ,'MA1209Y','Y'
                                                  ,'MA1210Y','Y'
                                                  ,'MA1211Y','Y'
                                                  ,'MA1212Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0624
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1208Y',F.QCODENM
                                                  ,'MA1209Y',F.QCODENM
                                                  ,'MA1210Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1211Y',F.QCODENM
                                                  ,'MA1212Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1213',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q062403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1215Y','Y'
                                                  ,'MA1216Y','Y'
                                                  ,'MA1217Y','Y'
                                                  ,'MA1218Y','Y'
                                                  ,'MA1219Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0625
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1215Y',F.QCODENM
                                                  ,'MA1216Y',F.QCODENM
                                                  ,'MA1217Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1218Y',F.QCODENM
                                                  ,'MA1219Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q062502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1220',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q062503
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1135Y','Y'
                                                  ,'MA1136Y','Y'
                                                  ,'MA1137Y','Y'
                                                  ,'MA1138Y','Y'
                                                  ,'MA1139Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0613
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1135Y',F.QCODENM
                                                  ,'MA1136Y',F.QCODENM
                                                  ,'MA1137Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1138Y',F.QCODENM
                                                  ,'MA1139Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1140',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1142Y','Y'
                                                  ,'MA1143Y','Y'
                                                  ,'MA1144Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0614
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1142Y',F.QCODENM
                                                  ,'MA1143Y',F.QCODENM
                                                  ,'MA1144Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1145',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1147Y','Y'
                                                  ,'MA1148Y','Y'
                                                  ,'MA1149Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0615
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1147Y',F.QCODENM
                                                  ,'MA1148Y',F.QCODENM
                                                  ,'MA1149Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1150',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1152Y','Y'
                                                  ,'MA1153Y','Y'
                                                  ,'MA1154Y','Y'
                                                  ,'MA1155Y','Y'
                                                  ,'MA1156Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0616
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1152Y',F.QCODENM
                                                  ,'MA1153Y',F.QCODENM
                                                  ,'MA1154Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1155Y',F.QCODENM
                                                  ,'MA1156Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1157',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061603
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1159Y','Y'
                                                  ,'MA1160Y','Y'
                                                  ,'MA1161Y','Y'
                                                  ,'MA1162Y','Y'
                                                  ,'MA1163Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0617
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1159Y',F.QCODENM
                                                  ,'MA1160Y',F.QCODENM
                                                  ,'MA1161Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1162Y',F.QCODENM
                                                  ,'MA1163Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q061702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1164',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q061703
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-27-1Y','Y'
                                             ,'6-1-27-2Y','Y'
                                             ,'6-1-27-3Y','Y'
                                             ,'6-1-27-4Y','Y'
                                             ,'6-1-27-5Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-27%')                MA1Q0627
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-27-1Y',F.QCODENM
                                             ,'6-1-27-2Y',F.QCODENM
                                             ,'6-1-27-3Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-27%')                MA1Q062701
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-27-4Y',F.QCODENM
                                             ,'6-1-27-5Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-27%')                MA1Q062702
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-27-6',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-27%')                  MA1Q062703
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-28-1Y','Y'
                                             ,'6-1-28-2Y','Y'
                                             ,'6-1-28-3Y','Y'
                                             ,'6-1-28-4Y','Y'
                                             ,'6-1-28-5Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-28%')                MA1Q0628
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-28-1Y',F.QCODENM
                                             ,'6-1-28-2Y',F.QCODENM
                                             ,'6-1-28-3Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-28%')                MA1Q062801
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-28-4Y',F.QCODENM
                                             ,'6-1-28-5Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-28%')                MA1Q062802
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-28-6',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-28%')                  MA1Q062803
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-22-1Y','Y'
                                             ,'6-1-22-2Y','Y'
                                             ,'6-1-22-3Y','Y'
                                             ,'6-1-22-4Y','Y'
                                             ,'6-1-22-5Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-22%')                MA1Q0622
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-22-1Y',F.QCODENM
                                             ,'6-1-22-2Y',F.QCODENM
                                             ,'6-1-22-3Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-22%')                MA1Q062201
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-22-4Y',F.QCODENM
                                             ,'6-1-22-5Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-22%')                MA1Q062202
     , (SELECT MAX(DECODE(F.QCODE1||F.CHECKYN,'6-1-22-6',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 LIKE '6-1-22%')                  MA1Q062203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1297Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q08
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1299Y','Y'
                                                  ,'MA1300Y','Y'
                                                  ,'MA1301Y','Y'
                                                  ,'MA1302Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1299Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1300Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1301Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1302Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080104
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1303',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080105
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1305Y','Y'
                                                  ,'MA1306Y','Y'
                                                  ,'MA1307Y','Y'
                                                  ,'MA1308Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0802
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1305Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1306Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1307Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1308Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080204
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1309',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080205
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1311Y','Y'
                                                  ,'MA1312Y','Y'
                                                  ,'MA1313Y','Y'
                                                  ,'MA1314Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0803
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1311Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1312Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1313Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1314Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080304
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1315',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080305
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1317Y','Y'
                                                  ,'MA1318Y','Y'
                                                  ,'MA1319Y','Y'
                                                  ,'MA1320Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0804
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1317Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1318Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1319Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1320Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080404
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1321',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080405
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1323Y','Y'
                                                  ,'MA1324Y','Y'
                                                  ,'MA1325Y','Y'
                                                  ,'MA1326Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0805
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1323Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1324Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1325Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080503
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1326Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080504
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1327',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080505
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1329Y','Y'
                                                  ,'MA1330Y','Y'
                                                  ,'MA1331Y','Y'
                                                  ,'MA1332Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0806
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1329Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1330Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1331Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080603
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1332Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080604
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1333',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080605
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1335Y','Y'
                                                  ,'MA1336Y','Y'
                                                  ,'MA1337Y','Y'
                                                  ,'MA1338Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0807
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1335Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1336Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1337Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080703
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1338Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080704
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1339',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080705
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1341Y','Y'
                                                  ,'MA1342Y','Y'
                                                  ,'MA1343Y','Y'
                                                  ,'MA1344Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0808
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1341Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1342Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080802
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1343Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080803
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1344Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080804
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1345',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080805
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1347Y','Y'
                                                  ,'MA1348Y','Y'
                                                  ,'MA1349Y','Y'
                                                  ,'MA1350Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0809
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1347Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1348Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080902
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1349Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080903
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1350Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q080904
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1351',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q080905
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1353Y','Y'
                                                  ,'MA1354Y','Y'
                                                  ,'MA1355Y','Y'
                                                  ,'MA1356Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0810
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1353Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1354Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081002
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1355Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081003
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1356Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081004
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1357',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q081005
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1359Y','Y'
                                                  ,'MA1360Y','Y'
                                                  ,'MA1361Y','Y'
                                                  ,'MA1362Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0811
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1359Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1360Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1361Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1362Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081104
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1363',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q081105
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1365Y','Y'
                                                  ,'MA1366Y','Y'
                                                  ,'MA1367Y','Y'
                                                  ,'MA1368Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0812
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1365Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1366Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1367Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1368Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081204
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1369',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q081205
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1371Y','Y'
                                                  ,'MA1372Y','Y'
                                                  ,'MA1373Y','Y'
                                                  ,'MA1374Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                      MA1Q0813
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1371Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1372Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1373Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1374Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081304
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1375',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q081305
     , (SELECT DECODE(MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1376','기타 암 : '||F.ACODE1,'')),'기타 암 : ','',MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1376','기타 암 : '||F.ACODE1,''))) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)       MA1Q0814
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1377Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1378Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1379Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1380Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q081404
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1381',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q081405
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1229Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q07
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1231Y','Y'
                                                  ,'MA1232Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1231Y',F.QCODENM
                                                  ,'MA1232Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1234Y','Y'
                                                  ,'MA1235Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1234Y',F.QCODENM
                                                  ,'MA1235Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1237Y','Y'
                                                  ,'MA1238Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0703
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1237Y',F.QCODENM
                                                  ,'MA1238Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1240Y','Y'
                                                  ,'MA1241Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0704
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1240Y',F.QCODENM
                                                  ,'MA1241Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1243Y','Y'
                                                  ,'MA1244Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0705
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1243Y',F.QCODENM
                                                  ,'MA1244Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1246Y','Y'
                                                  ,'MA1247Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0706
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1246Y',F.QCODENM
                                                  ,'MA1247Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1249Y','Y'
                                                  ,'MA1250Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0707
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1249Y',F.QCODENM
                                                  ,'MA1250Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1252Y','Y'
                                                  ,'MA1253Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0708
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1252Y',F.QCODENM
                                                  ,'MA1253Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1255Y','Y'
                                                  ,'MA1256Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0709
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1255Y',F.QCODENM
                                                  ,'MA1256Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q070901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1258Y','Y'
                                                  ,'MA1259Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0710
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1258Y',F.QCODENM
                                                  ,'MA1259Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1261Y','Y'
                                                  ,'MA1262Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0711
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1261Y',F.QCODENM
                                                  ,'MA1262Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1264Y','Y'
                                                  ,'MA1265Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0712
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1264Y',F.QCODENM
                                                  ,'MA1265Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1267Y','Y'
                                                  ,'MA1268Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0713
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1267Y',F.QCODENM
                                                  ,'MA1268Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1270Y','Y'
                                                  ,'MA1271Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0714
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1270Y',F.QCODENM
                                                  ,'MA1271Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1273Y','Y'
                                                  ,'MA1274Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0715
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1273Y',F.QCODENM
                                                  ,'MA1274Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1276Y','Y'
                                                  ,'MA1277Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0716
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1276Y',F.QCODENM
                                                  ,'MA1277Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1279Y','Y'
                                                  ,'MA1280Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0717
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1279Y',F.QCODENM
                                                  ,'MA1280Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1282Y','Y'
                                                  ,'MA1283Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0718
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1282Y',F.QCODENM
                                                  ,'MA1283Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1285Y','Y'
                                                  ,'MA1286Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0719
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1285Y',F.QCODENM
                                                  ,'MA1286Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q071901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1288Y','Y'
                                                  ,'MA1289Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0720
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1288Y',F.QCODENM
                                                  ,'MA1289Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q072001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1291Y','Y'
                                                  ,'MA1292Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q0721
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1291Y',F.QCODENM
                                                  ,'MA1292Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q072101
     , (SELECT DECODE(MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1293' ,'기타약제 : '||F.ACODE1,'')),'기타약제 : ','',MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1293' ,'기타약제 : '||F.ACODE1,''))) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0722
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1294Y',F.QCODENM
                                                  ,'MA1295Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                MA1Q072201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1383Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q09
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1385Y','Y'
                                                  ,'MA1386Y','Y'
                                                  ,'MA1387Y','Y'
                                                  ,'MA1388Y','Y'
                                                  ,'MA1389Y','Y'
                                                  ,'MA1390Y','Y'
                                                  ,'MA1391Y','Y'
                                                  ,'MA1392Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1385Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1386Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1387Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1388Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090104
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1389Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090105
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1390Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090106
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1391Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090107
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1392Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090108
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1394Y','Y'
                                                  ,'MA1395Y','Y'
                                                  ,'MA1396Y','Y'
                                                  ,'MA1397Y','Y'
                                                  ,'MA1398Y','Y'
                                                  ,'MA1399Y','Y'
                                                  ,'MA1400Y','Y'
                                                  ,'MA1401Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0902
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1394Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1395Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1396Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1397Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090204
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1398Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090205
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1399Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090206
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1400Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090207
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1401Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090208
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1403Y','Y'
                                                  ,'MA1404Y','Y'
                                                  ,'MA1405Y','Y'
                                                  ,'MA1406Y','Y'
                                                  ,'MA1407Y','Y'
                                                  ,'MA1408Y','Y'
                                                  ,'MA1409Y','Y'
                                                  ,'MA1410Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0903
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1403Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1404Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1405Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1406Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090304
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1407Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090305
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1408Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090306
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1409Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090307
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1410Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090308
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1412Y','Y'
                                                  ,'MA1413Y','Y'
                                                  ,'MA1414Y','Y'
                                                  ,'MA1415Y','Y'
                                                  ,'MA1416Y','Y'
                                                  ,'MA1417Y','Y'
                                                  ,'MA1418Y','Y'
                                                  ,'MA1419Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0904
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1412Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1413Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1414Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1415Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090404
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1416Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090405
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1417Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090406
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1418Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090407
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1419Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090408
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1421Y','Y'
                                                  ,'MA1422Y','Y'
                                                  ,'MA1423Y','Y'
                                                  ,'MA1424Y','Y'
                                                  ,'MA1425Y','Y'
                                                  ,'MA1426Y','Y'
                                                  ,'MA1427Y','Y'
                                                  ,'MA1428Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0905
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1421Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1422Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1423Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090503
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1424Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090504
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1425Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090505
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1426Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090506
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1427Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090507
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1428Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090508
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1430Y','Y'
                                                  ,'MA1431Y','Y'
                                                  ,'MA1432Y','Y'
                                                  ,'MA1433Y','Y'
                                                  ,'MA1434Y','Y'
                                                  ,'MA1435Y','Y'
                                                  ,'MA1436Y','Y'
                                                  ,'MA1437Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0906
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1430Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1431Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1432Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090603
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1433Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090604
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1434Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090605
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1435Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090606
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1436Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090607
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1437Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090608
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1439Y','Y'
                                                  ,'MA1440Y','Y'
                                                  ,'MA1441Y','Y'
                                                  ,'MA1442Y','Y'
                                                  ,'MA1443Y','Y'
                                                  ,'MA1444Y','Y'
                                                  ,'MA1445Y','Y'
                                                  ,'MA1446Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0907
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1439Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1440Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1441Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090703
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1442Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090704
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1443Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090705
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1444Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090706
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1445Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090707
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1446Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090708
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1448Y','Y'
                                                  ,'MA1449Y','Y'
                                                  ,'MA1450Y','Y'
                                                  ,'MA1451Y','Y'
                                                  ,'MA1452Y','Y'
                                                  ,'MA1453Y','Y'
                                                  ,'MA1454Y','Y'
                                                  ,'MA1455Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0908
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1448Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1449Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090802
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1450Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090803
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1451Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090804
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1452Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090805
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1453Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090806
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1454Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090807
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1455Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090808
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1457Y','Y'
                                                  ,'MA1458Y','Y'
                                                  ,'MA1459Y','Y'
                                                  ,'MA1460Y','Y'
                                                  ,'MA1461Y','Y'
                                                  ,'MA1462Y','Y'
                                                  ,'MA1463Y','Y'
                                                  ,'MA1464Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0909
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1457Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1458Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090902
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1459Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090903
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1460Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090904
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1461Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090905
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1462Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090906
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1463Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090907
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1464Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q090908
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1466Y','Y'
                                                  ,'MA1467Y','Y'
                                                  ,'MA1468Y','Y'
                                                  ,'MA1469Y','Y'
                                                  ,'MA1470Y','Y'
                                                  ,'MA1471Y','Y'
                                                  ,'MA1472Y','Y'
                                                  ,'MA1473Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0910
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1466Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1467Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091002
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1468Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091003
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1469Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091004
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1470Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091005
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1471Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091006
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1472Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091007
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1473Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091008
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1475Y','Y'
                                                  ,'MA1476Y','Y'
                                                  ,'MA1477Y','Y'
                                                  ,'MA1478Y','Y'
                                                  ,'MA1479Y','Y'
                                                  ,'MA1480Y','Y'
                                                  ,'MA1481Y','Y'
                                                  ,'MA1482Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0911
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1475Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1476Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1477Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1478Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091104
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1479Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091105
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1480Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091106
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1481Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091107
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1482Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091108
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1484Y','Y'
                                                  ,'MA1485Y','Y'
                                                  ,'MA1486Y','Y'
                                                  ,'MA1487Y','Y'
                                                  ,'MA1488Y','Y'
                                                  ,'MA1489Y','Y'
                                                  ,'MA1490Y','Y'
                                                  ,'MA1491Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0912
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1484Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1485Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091202
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1486Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1487Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091204
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1488Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091205
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1489Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091206
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1490Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091207
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1491Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091208
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1493Y','Y'
                                                  ,'MA1494Y','Y'
                                                  ,'MA1495Y','Y'
                                                  ,'MA1496Y','Y'
                                                  ,'MA1497Y','Y'
                                                  ,'MA1498Y','Y'
                                                  ,'MA1499Y','Y'
                                                  ,'MA1500Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0913
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1493Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091301
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1494Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091302
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1495Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091303
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1496Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091304
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1497Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091305
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1498Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091306
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1499Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091307
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1500Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091308
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1502Y','Y'
                                                  ,'MA1503Y','Y'
                                                  ,'MA1504Y','Y'
                                                  ,'MA1505Y','Y'
                                                  ,'MA1506Y','Y'
                                                  ,'MA1507Y','Y'
                                                  ,'MA1508Y','Y'
                                                  ,'MA1509Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0914
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1502Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1503Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1504Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1505Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091404
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1506Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091405
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1507Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091406
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1508Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091407
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1509Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091408
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1511Y','Y'
                                                  ,'MA1512Y','Y'
                                                  ,'MA1513Y','Y'
                                                  ,'MA1514Y','Y'
                                                  ,'MA1515Y','Y'
                                                  ,'MA1516Y','Y'
                                                  ,'MA1517Y','Y'
                                                  ,'MA1518Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0915
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1511Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1512Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091502
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1513Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091503
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1514Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091504
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1515Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091505
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1516Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091506
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1517Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091507
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1518Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091508
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1520Y','Y'
                                                  ,'MA1521Y','Y'
                                                  ,'MA1522Y','Y'
                                                  ,'MA1523Y','Y'
                                                  ,'MA1524Y','Y'
                                                  ,'MA1525Y','Y'
                                                  ,'MA1526Y','Y'
                                                  ,'MA1527Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0916
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1520Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1521Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1522Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091603
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1523Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091604
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1524Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091605
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1525Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091606
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1526Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091607
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1527Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091608
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1529Y','Y'
                                                  ,'MA1530Y','Y'
                                                  ,'MA1531Y','Y'
                                                  ,'MA1532Y','Y'
                                                  ,'MA1533Y','Y'
                                                  ,'MA1534Y','Y'
                                                  ,'MA1535Y','Y'
                                                  ,'MA1536Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0917
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1529Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1530Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1531Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091703
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1532Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091704
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1533Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091705
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1534Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091706
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1535Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091707
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1536Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091708
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1538Y','Y'
                                                  ,'MA1539Y','Y'
                                                  ,'MA1540Y','Y'
                                                  ,'MA1541Y','Y'
                                                  ,'MA1542Y','Y'
                                                  ,'MA1543Y','Y'
                                                  ,'MA1544Y','Y'
                                                  ,'MA1545Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0918
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1538Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091801
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1539Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091802
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1540Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091803
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1541Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091804
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1542Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091805
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1543Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091806
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1544Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091807
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1545Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091808
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1547Y','Y'
                                                  ,'MA1548Y','Y'
                                                  ,'MA1549Y','Y'
                                                  ,'MA1550Y','Y'
                                                  ,'MA1551Y','Y'
                                                  ,'MA1552Y','Y'
                                                  ,'MA1553Y','Y'
                                                  ,'MA1554Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0919
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1547Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091901
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1548Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091902
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1549Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091903
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1550Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091904
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1551Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091905
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1552Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091906
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1553Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091907
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1554Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q091908
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1556Y','Y'
                                                  ,'MA1557Y','Y'
                                                  ,'MA1558Y','Y'
                                                  ,'MA1559Y','Y'
                                                  ,'MA1560Y','Y'
                                                  ,'MA1561Y','Y'
                                                  ,'MA1562Y','Y'
                                                  ,'MA1563Y','Y',''))       FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q0920
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1556Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092001
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1557Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092002
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1558Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092003
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1559Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092004
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1560Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092005
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1561Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092006
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1562Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092007
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1563Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092008
     , (SELECT DECODE(MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1564',F.QCODENM||': '||F.ACODE1,'')),'기타암 : ','',MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1564',F.QCODENM||': '||F.ACODE1,''))) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)  MA1Q0921
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1565Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1566Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1567Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1568Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092104
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1569Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092105
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1570Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092106
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1571Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092107
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1572Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                  MA1Q092108
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1813Y',G.FOODBASEQTY
                                                  ,'MA1814Y',G.FOODBASEQTY
                                                  ,'MA1815Y',G.FOODBASEQTY
                                                  ,'MA1816Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2401
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1818Y',G.FOODBASEQTY
                                                  ,'MA1819Y',G.FOODBASEQTY
                                                  ,'MA1820Y',G.FOODBASEQTY
                                                  ,'MA1821Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2402
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1823Y',G.FOODBASEQTY
                                                  ,'MA1824Y',G.FOODBASEQTY
                                                  ,'MA1825Y',G.FOODBASEQTY
                                                  ,'MA1826Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2403
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1828Y',G.FOODBASEQTY
                                                  ,'MA1829Y',G.FOODBASEQTY
                                                  ,'MA1830Y',G.FOODBASEQTY
                                                  ,'MA1831Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2404
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1833Y',G.FOODBASEQTY
                                                  ,'MA1834Y',G.FOODBASEQTY
                                                  ,'MA1835Y',G.FOODBASEQTY
                                                  ,'MA1836Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2405
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1838Y',G.FOODBASEQTY
                                                  ,'MA1839Y',G.FOODBASEQTY
                                                  ,'MA1840Y',G.FOODBASEQTY
                                                  ,'MA1841Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2406
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1843Y',G.FOODBASEQTY
                                                  ,'MA1844Y',G.FOODBASEQTY
                                                  ,'MA1845Y',G.FOODBASEQTY
                                                  ,'MA1846Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2407
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1848Y',G.FOODBASEQTY
                                                  ,'MA1849Y',G.FOODBASEQTY
                                                  ,'MA1850Y',G.FOODBASEQTY
                                                  ,'MA1851Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2408
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1853Y',G.FOODBASEQTY
                                                  ,'MA1854Y',G.FOODBASEQTY
                                                  ,'MA1855Y',G.FOODBASEQTY
                                                  ,'MA1856Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2409
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1858Y',G.FOODBASEQTY
                                                  ,'MA1859Y',G.FOODBASEQTY
                                                  ,'MA1860Y',G.FOODBASEQTY
                                                  ,'MA1861Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2410
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1863Y',G.FOODBASEQTY
                                                  ,'MA1864Y',G.FOODBASEQTY
                                                  ,'MA1865Y',G.FOODBASEQTY
                                                  ,'MA1866Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2411
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1868Y',G.FOODBASEQTY
                                                  ,'MA1869Y',G.FOODBASEQTY
                                                  ,'MA1870Y',G.FOODBASEQTY
                                                  ,'MA1871Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2412
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1873Y',G.FOODBASEQTY
                                                  ,'MA1874Y',G.FOODBASEQTY
                                                  ,'MA1875Y',G.FOODBASEQTY
                                                  ,'MA1876Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2413
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1878Y',G.FOODBASEQTY
                                                  ,'MA1879Y',G.FOODBASEQTY
                                                  ,'MA1880Y',G.FOODBASEQTY
                                                  ,'MA1881Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2414
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1883Y',G.FOODBASEQTY
                                                  ,'MA1884Y',G.FOODBASEQTY
                                                  ,'MA1885Y',G.FOODBASEQTY
                                                  ,'MA1886Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2415
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1888Y',G.FOODBASEQTY
                                                  ,'MA1889Y',G.FOODBASEQTY
                                                  ,'MA1890Y',G.FOODBASEQTY
                                                  ,'MA1891Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2416
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1893Y',G.FOODBASEQTY
                                                  ,'MA1894Y',G.FOODBASEQTY
                                                  ,'MA1895Y',G.FOODBASEQTY
                                                  ,'MA1896Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2417
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1898Y',G.FOODBASEQTY
                                                  ,'MA1899Y',G.FOODBASEQTY
                                                  ,'MA1900Y',G.FOODBASEQTY
                                                  ,'MA1901Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)                MA1Q2418
     , (-- 스트레스 총점
       (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1813Y',G.FOODBASEQTY
                                                  ,'MA1814Y',G.FOODBASEQTY
                                                  ,'MA1815Y',G.FOODBASEQTY
                                                  ,'MA1816Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2401
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1818Y',G.FOODBASEQTY
                                                  ,'MA1819Y',G.FOODBASEQTY
                                                  ,'MA1820Y',G.FOODBASEQTY
                                                  ,'MA1821Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2402
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1823Y',G.FOODBASEQTY
                                                  ,'MA1824Y',G.FOODBASEQTY
                                                  ,'MA1825Y',G.FOODBASEQTY
                                                  ,'MA1826Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2403
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1828Y',G.FOODBASEQTY
                                                  ,'MA1829Y',G.FOODBASEQTY
                                                  ,'MA1830Y',G.FOODBASEQTY
                                                  ,'MA1831Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2404
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1833Y',G.FOODBASEQTY
                                                  ,'MA1834Y',G.FOODBASEQTY
                                                  ,'MA1835Y',G.FOODBASEQTY
                                                  ,'MA1836Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2405
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1838Y',G.FOODBASEQTY
                                                  ,'MA1839Y',G.FOODBASEQTY
                                                  ,'MA1840Y',G.FOODBASEQTY
                                                  ,'MA1841Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2406
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1843Y',G.FOODBASEQTY
                                                  ,'MA1844Y',G.FOODBASEQTY
                                                  ,'MA1845Y',G.FOODBASEQTY
                                                  ,'MA1846Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2407
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1848Y',G.FOODBASEQTY
                                                  ,'MA1849Y',G.FOODBASEQTY
                                                  ,'MA1850Y',G.FOODBASEQTY
                                                  ,'MA1851Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2408
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1853Y',G.FOODBASEQTY
                                                  ,'MA1854Y',G.FOODBASEQTY
                                                  ,'MA1855Y',G.FOODBASEQTY
                                                  ,'MA1856Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2409
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1858Y',G.FOODBASEQTY
                                                  ,'MA1859Y',G.FOODBASEQTY
                                                  ,'MA1860Y',G.FOODBASEQTY
                                                  ,'MA1861Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2410
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1863Y',G.FOODBASEQTY
                                                  ,'MA1864Y',G.FOODBASEQTY
                                                  ,'MA1865Y',G.FOODBASEQTY
                                                  ,'MA1866Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2411
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1868Y',G.FOODBASEQTY
                                                  ,'MA1869Y',G.FOODBASEQTY
                                                  ,'MA1870Y',G.FOODBASEQTY
                                                  ,'MA1871Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2412
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1873Y',G.FOODBASEQTY
                                                  ,'MA1874Y',G.FOODBASEQTY
                                                  ,'MA1875Y',G.FOODBASEQTY
                                                  ,'MA1876Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2413
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1878Y',G.FOODBASEQTY
                                                  ,'MA1879Y',G.FOODBASEQTY
                                                  ,'MA1880Y',G.FOODBASEQTY
                                                  ,'MA1881Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2414
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1883Y',G.FOODBASEQTY
                                                  ,'MA1884Y',G.FOODBASEQTY
                                                  ,'MA1885Y',G.FOODBASEQTY
                                                  ,'MA1886Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2415
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1888Y',G.FOODBASEQTY
                                                  ,'MA1889Y',G.FOODBASEQTY
                                                  ,'MA1890Y',G.FOODBASEQTY
                                                  ,'MA1891Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2416
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1893Y',G.FOODBASEQTY
                                                  ,'MA1894Y',G.FOODBASEQTY
                                                  ,'MA1895Y',G.FOODBASEQTY
                                                  ,'MA1896Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2417
     + (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1898Y',G.FOODBASEQTY
                                                  ,'MA1899Y',G.FOODBASEQTY
                                                  ,'MA1900Y',G.FOODBASEQTY
                                                  ,'MA1901Y',G.FOODBASEQTY,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.QCODE1 = G.QCODE)--                MA1Q2418
       )                                                                                                                                                                                             "PWI_SF T_SCORE"
  FROM JYHJYBPT@DL_SDEV9_S A
     , STRESULT B
 WHERE A.ORDDATE BETWEEN TO_DATE('20130101','YYYYMMDD') AND TO_DATE('20131231','YYYYMMDD')
   AND A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND EXISTS (
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE B.PATNO = X.PATNO
                  AND B.ORDDATE = X.ORDDATE
                  AND B.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.PATNO, A.ORDDATE, A.AGE, A.SEX
