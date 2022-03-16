-- 최종
SELECT A.ORDDATE, A.PATNO
     , (SELECT X.PATNAME FROM APPATBAT X WHERE A.PATNO = X.PATNO) PATNAME
     , 성별찾기펑션(A.PATNO) SEX
     , 나이계산펑션(a.patno, a.orddate) AGE
     , (
        SELECT MAX(DECODE(X.EXAMCODE,'RC1241',TO_CHAR(X.RSLTTEXT),''))
          FROM STRESULT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (
                       SELECT 'Y'
                         FROM MMEXMORT Y
                        WHERE X.PATNO = Y.PATNO
                          AND X.ORDDATE = Y.ORDDATE
                          AND X.ORDSEQNO = Y.ORDSEQNO
                          AND Y.PATFG = 'G'
                      )
       ) "LDCT"
     , (
        SELECT MAX(DECODE(X.EXAMCODE,'RC1184',TO_CHAR(X.RSLTTEXT),''))
          FROM STRESULT X
         WHERE A.PATNO = X.PATNO
           AND A.ORDDATE = X.ORDDATE
           AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (
                       SELECT 'Y'
                         FROM MMEXMORT Y
                        WHERE X.PATNO = Y.PATNO
                          AND X.ORDDATE = Y.ORDDATE
                          AND X.ORDSEQNO = Y.ORDSEQNO
                          AND Y.PATFG = 'G'
                      )
       ) "CACT"
     , A.ECHODATE, A.GAP
     , (
        SELECT MAX(DECODE(X.EXAMCODE,'BS2231',TO_CHAR(X.RSLTTEXT),''))
          FROM STRESULT X
         WHERE A.PATNO = X.PATNO
           AND A.ECHODATE = X.ORDDATE
           AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (
                       SELECT 'Y'
                         FROM MMEXMORT Y
                        WHERE X.PATNO = Y.PATNO
                          AND X.ORDDATE = Y.ORDDATE
                          AND X.ORDSEQNO = Y.ORDSEQNO
                          AND Y.PATFG = 'G'
                      )
       ) "ECHO"
     , (SELECT MAX(DECODE(X.EXAMCODE,'BL3118',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) FBS
     , (SELECT MAX(DECODE(X.EXAMCODE,'BL3164',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) HBA1C
     , (SELECT MAX(DECODE(X.EXAMCODE,'BL3113',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) TCHOL
     , (SELECT MAX(DECODE(X.EXAMCODE,'BL3142',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) HDL
     , (SELECT MAX(DECODE(X.EXAMCODE,'BL314201',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) LDL
     , (SELECT MAX(DECODE(X.EXAMCODE,'BL3141',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) TG
     , (SELECT MAX(DECODE(X.EXAMCODE,'SM0600',SUBSTR(TO_CHAR(X.RSLTNUM),1,INSTR(TO_CHAR(X.RSLTNUM),'/')-1),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) SBP
     , (SELECT MAX(DECODE(X.EXAMCODE,'SM0600',SUBSTR(TO_CHAR(X.RSLTNUM),INSTR(TO_CHAR(X.RSLTNUM),'/')+1),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) DBP
     , (SELECT MAX(DECODE(X.EXAMCODE,'SM0102',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) WEIGHT
     , (SELECT MAX(DECODE(X.EXAMCODE,'SM0101',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) HEIGHT
     , (SELECT MAX(DECODE(X.EXAMCODE,'SM316001',TO_CHAR(X.RSLTNUM),'')) FROM STRESULT X WHERE A.PATNO = X.PATNO AND A.ORDDATE = X.ORDDATE AND NVL(X.MODIFYYN,'N') != 'Y'
           AND EXISTS (SELECT 'Y' FROM MMEXMORT Y WHERE X.PATNO = Y.PATNO AND X.ORDDATE = Y.ORDDATE AND X.ORDSEQNO = Y.ORDSEQNO AND Y.PATFG = 'G')                        ) BMI
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM52Y' ,F.QCODENM
                                                  ,'AM59Y' ,F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                    AMQ007
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM53'  ,F.ACODE1 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                    AMQ0071
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM54'  ,F.ACODE1 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                    AMQ0072
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM55'  ,F.ACODE1 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                    AMQ0073
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM57Y' ,F.QCODENM
                                                  ,'AM58Y' ,'□ 아니오, '||F.ACODE1||'년 전에 끊었다.','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)   AMQ0074
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR46Y',G.QCODENM
                                                  ,'RR48Y',G.QCODENM
                                                  ,'RR49Y',G.QCODENM,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE) RRQ05
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ,'RR47',F.ACODE1,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)              RRQ0501
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA16Y' ,F.QCODENM
                                                  ,'MA17Y' ,F.QCODENM
                                                  ,'MA18Y' ,F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)   MA1Q02
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA19'  ,F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)    MA1Q0201
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
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM106Y',F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ01103
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM106Y',F.ACODE2 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ011031
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN||F.ACODE1,'AM106YY','치료중','AM106YN','치료중아님','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)      AMQ011032
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM107Y',F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ01104
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM107Y',F.ACODE2 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ011041
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN||F.ACODE1,'AM107YY','치료중','AM107YN','치료중아님','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)      AMQ011042
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM108Y',F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ01105
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM108Y',F.ACODE2 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ011051
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN||F.ACODE1,'AM108YY','치료중','AM108YN','치료중아님','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)      AMQ011052
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM109Y',F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ01106
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM109Y',F.ACODE2 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ011061
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN||F.ACODE1,'AM109YY','치료중','AM109YN','치료중아님','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)      AMQ011062
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM110Y',F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ01107
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM110Y',F.ACODE2 ,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                       AMQ011071
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN||F.ACODE1,'AM110YY','치료중','AM110YN','치료중아님','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)      AMQ011072
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR80Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)    RRQ0803
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR81Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)    RRQ0804
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR82Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)    RRQ0805
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR83Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)    RRQ0806
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR84Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)    RRQ0807
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA167Y','Y'
                                                  ,'MA168Y','Y'
                                                  ,'MA169Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                       MA1Q0601
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA167Y',F.QCODENM
                                                  ,'MA168Y',F.QCODENM
                                                  ,'MA169Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA170',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060102
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA172Y','Y'
                                                  ,'MA173Y','Y'
                                                  ,'MA174Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q0602
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA172Y',F.QCODENM
                                                  ,'MA173Y',F.QCODENM
                                                  ,'MA174Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                 MA1Q060201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA175',F.ACODE1,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                   MA1Q060202
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
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM134Y' ,F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                      AMQ01203
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM134Y' ,F.ACODE1||' 개월 또는 '||F.ACODE2||' 년','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)       AMQ012031
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM135Y' ,F.CHECKYN,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                      AMQ01204
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'AM135Y' ,F.ACODE1||' 개월 또는 '||F.ACODE2||' 년','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)       AMQ012041
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR105Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)   RRQ0903
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'RR106Y',F.CHECKYN,'')) FROM SMQUESAT F, SMQUESMT G WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE AND F.ANSCODE = G.QCODE)   RRQ0904
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1231Y','Y'
                                                  ,'MA1232Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                            MA1Q0701
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1231Y',F.QCODENM
                                                  ,'MA1232Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                      MA1Q070101
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1234Y','Y'
                                                  ,'MA1235Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                            MA1Q0702
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1234Y',F.QCODENM
                                                  ,'MA1235Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                      MA1Q070201
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1237Y','Y'
                                                  ,'MA1238Y','Y','')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                            MA1Q0703
     , (SELECT MAX(DECODE(F.QPKG||F.SEQ||F.CHECKYN,'MA1237Y',F.QCODENM
                                                  ,'MA1238Y',F.QCODENM,'')) FROM SMQUESAT F WHERE A.PATNO = F.PATNO AND A.ORDDATE = F.ORDDATE)                                      MA1Q070301
  FROM (
        SELECT A.*, B.ORDDATE ECHODATE, B.ORDSEQNO
             , ABS(ROUND(MONTHS_BETWEEN(B.ORDDATE,A.ORDDATE)/12,1)) GAP
             , ABS(ROUND(MONTHS_BETWEEN(B.ORDDATE,A.ORDDATE)/12,1)) RANK
             , ROW_NUMBER () OVER (PARTITION BY A.PATNO ORDER BY ABS(ROUND(MONTHS_BETWEEN(B.ORDDATE,A.ORDDATE)/12,1)), B.ORDDATE) RN
          FROM (
                SELECT A.ORDDATE, A.PATNO
                  FROM SMRSV00T A, SMPKGMST B
                 WHERE A.ORDDATE BETWEEN TO_DATE('20090715','YYYYMMDD') AND TO_DATE('20090724','YYYYMMDD')
                   AND A.CANCELTIME IS NULL
                   AND A.PKGCODE = B.PKGCODE
                   AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                   and B.PKGTYP NOT IN ('3A','3B','4A')
                   AND EXISTS (-- LDCT
                               SELECT 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'RC1241'
                                  AND X.PROCSTAT > 'C'
                              )
                   AND EXISTS (-- CACT
                               SELECT 'Y'
                                 FROM MMEXMORT X
                                WHERE A.PATNO = X.PATNO
                                  AND A.ORDDATE = X.ORDDATE
                                  AND X.PATFG = 'G'
                                  AND X.ORDCODE = 'RC1184'
                                  AND X.PROCSTAT > 'C'
                              )
               ) A
             , MMEXMORT B
         WHERE A.PATNO = B.PATNO
           AND B.ORDDATE BETWEEN (A.ORDDATE - 365) AND (A.ORDDATE + 365)
           AND B.PATFG = 'G'
           AND B.ORDCODE = 'BS2231'
           AND B.PROCSTAT > 'C'
         ORDER BY 2,6
       ) A
