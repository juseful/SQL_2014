-- 상병진단이력, 찾는데 시간 오래 안 걸림~^^, 약 25,277 건임.
SELECT A.PATNO, A.fstdate
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , MAX(DECODE(A.DIAGCODE,'G47.30',A.MEDDATE,'')) "G47.30"
     , MAX(DECODE(A.DIAGCODE,'G47.31',A.MEDDATE,'')) "G47.31"
     , MAX(DECODE(A.DIAGCODE,'G47.4',A.MEDDATE,'')) "G47.4"
     , MAX(DECODE(A.DIAGCODE,'G47.8/G47.9',A.MEDDATE,'')) "G47.8/G47.9"
     , MAX(DECODE(A.DIAGCODE,'H10.1',A.MEDDATE,'')) "H10.1"
     , MAX(DECODE(A.DIAGCODE,'I20.0',A.MEDDATE,'')) "I20.0"
     , MAX(DECODE(A.DIAGCODE,'I20.1/I20.8/I20.9',A.MEDDATE,'')) "I20.1/I20.8/I20.9"
     , MAX(DECODE(A.DIAGCODE,'I21.0/I21.1/I21.2/I21.3/I21.9',A.MEDDATE,'')) "I21.0/I21.1/I21.2/I21.3/I21.9"
     , MAX(DECODE(A.DIAGCODE,'I24.9',A.MEDDATE,'')) "I24.9"
     , MAX(DECODE(A.DIAGCODE,'I60.x8/I61.x',A.MEDDATE,'')) "I60.x8/I61.x"
     , MAX(DECODE(A.DIAGCODE,'I63.x',A.MEDDATE,'')) "I63.x"
     , MAX(DECODE(A.DIAGCODE,'I67.1',A.MEDDATE,'')) "I67.1"
     , MAX(DECODE(A.DIAGCODE,'J30.x',A.MEDDATE,'')) "J30.1/j30.2/j30.3/j30.4"
     , MAX(DECODE(A.DIAGCODE,'J44.x',A.MEDDATE,'')) "J44.x"
     , MAX(DECODE(A.DIAGCODE,'J45.x',A.MEDDATE,'')) "J45.x"
     , MAX(DECODE(A.DIAGCODE,'L20.x',A.MEDDATE,'')) "L20.x"
     , MAX(DECODE(A.DIAGCODE,'M80.x/M81.x/M82.x',A.MEDDATE,'')) "M80.x/M81.x/M82.x"
  FROM (
-- 상병진단이력
SELECT MIN(C.MEDDATE) MEDDATE, A.PATNO, A.fstdate
    , DECODE(
             C.DIAGCODE,'G47.30','G47.30_obstuctive sleep apnea'
                       ,'G47.31','G47.31_central sleep apnea'
                       ,'G47.4','G47.4_narcolepsy and cataplexy'
                       ,'347','G47.4_narcolepsy and cataplexy'
                       ,'G47.8','G47.8/G47.9_sleep disorder unspecified'
                       ,'G47.9','G47.8/G47.9_sleep disorder unspecified'
                       ,'780.5','G47.8/G47.9_sleep disorder unspecified'
                       ,'H10.1','H10.1_ATOPIC_CONJUCTIVITIS'
                       ,'I20.0','I20.0_unstable angina'
                       ,'I20.1','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.8','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.9','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'413','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I21.0','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.1','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.2','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.3','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.9','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'410','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I24.9','I24.9_acute ischemic heart disease, unspecified'
                       ,'411','I24.9_acute ischemic heart disease, unspecified'
                       ,'I60.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.0','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.1','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.2','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.3','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.4','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.5','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.6','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.9','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'431','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I63.0','I63.x_CVA'
                       ,'I63.00','I63.x_CVA'
                       ,'I63.01','I63.x_CVA'
                       ,'I63.02','I63.x_CVA'
                       ,'I63.08','I63.x_CVA'
                       ,'I63.09','I63.x_CVA'
                       ,'I63.1','I63.x_CVA'
                       ,'I63.10','I63.x_CVA'
                       ,'I63.11','I63.x_CVA'
                       ,'I63.12','I63.x_CVA'
                       ,'I63.18','I63.x_CVA'
                       ,'I63.19','I63.x_CVA'
                       ,'I63.2','I63.x_CVA'
                       ,'I63.20','I63.x_CVA'
                       ,'I63.21','I63.x_CVA'
                       ,'I63.22','I63.x_CVA'
                       ,'I63.28','I63.x_CVA'
                       ,'I63.29','I63.x_CVA'
                       ,'I63.3','I63.x_CVA'
                       ,'I63.30','I63.x_CVA'
                       ,'I63.31','I63.x_CVA'
                       ,'I63.32','I63.x_CVA'
                       ,'I63.33','I63.x_CVA'
                       ,'I63.38','I63.x_CVA'
                       ,'I63.39','I63.x_CVA'
                       ,'I63.4','I63.x_CVA'
                       ,'I63.40','I63.x_CVA'
                       ,'I63.41','I63.x_CVA'
                       ,'I63.42','I63.x_CVA'
                       ,'I63.43','I63.x_CVA'
                       ,'I63.48','I63.x_CVA'
                       ,'I63.49','I63.x_CVA'
                       ,'I63.5','I63.x_CVA'
                       ,'I63.50','I63.x_CVA'
                       ,'I63.51','I63.x_CVA'
                       ,'I63.52','I63.x_CVA'
                       ,'I63.53','I63.x_CVA'
                       ,'I63.58','I63.x_CVA'
                       ,'I63.59','I63.x_CVA'
                       ,'I63.6','I63.x_CVA'
                       ,'I63.8','I63.x_CVA'
                       ,'I63.9','I63.x_CVA'
                       ,'434.9','I63.x_CVA'
                       ,'I67.1','I67.1_cerebralaneurym'
                       ,'437.3','I67.1_cerebralaneurym'
                       ,'J30.1','J30.x_ALLERGIC_RHINITIS'
                       ,'477.0','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.2','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.3','J30.x_ALLERGIC_RHINITIS'
                       ,'477.8','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.4','J30.x_ALLERGIC_RHINITIS'
                       ,'477.9','J30.x_ALLERGIC_RHINITIS'
                       ,'J44.0','J44.x_COPD'
                       ,'J44.1','J44.x_COPD'
                       ,'J44.8','J44.x_COPD'
                       ,'491.2','J44.x_COPD'
                       ,'J44.9','J44.x_COPD'
                       ,'496','J44.x_COPD'
                       ,'J45.0','J45.x_ASTHMA'
                       ,'493.0','J45.x_ASTHMA'
                       ,'J45.1','J45.x_ASTHMA'
                       ,'493.1','J45.x_ASTHMA'
                       ,'J45.8','J45.x_ASTHMA'
                       ,'J45.9','J45.x_ASTHMA'
                       ,'493.9','J45.x_ASTHMA'
                       ,'L20.0','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.8','L20.x_ATOPIC_DERMATITIS'
                       ,'691.8','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.80','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.81','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.82','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.83','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.88','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.9','L20.x_ATOPIC_DERMATITIS'
                       ,'M80.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.6','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.60','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.61','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.62','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.63','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.64','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.65','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.66','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.67','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.68','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.69','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'733.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,''
            ) DIAGNM
     , SUBSTR(DECODE(
             C.DIAGCODE,'G47.30','G47.30_obstuctive sleep apnea'
                       ,'G47.31','G47.31_central sleep apnea'
                       ,'G47.4','G47.4_narcolepsy and cataplexy'
                       ,'347','G47.4_narcolepsy and cataplexy'
                       ,'G47.8','G47.8/G47.9_sleep disorder unspecified'
                       ,'G47.9','G47.8/G47.9_sleep disorder unspecified'
                       ,'780.5','G47.8/G47.9_sleep disorder unspecified'
                       ,'H10.1','H10.1_ATOPIC_CONJUCTIVITIS'
                       ,'I20.0','I20.0_unstable angina'
                       ,'I20.1','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.8','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.9','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'413','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I21.0','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.1','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.2','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.3','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.9','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'410','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I24.9','I24.9_acute ischemic heart disease, unspecified'
                       ,'411','I24.9_acute ischemic heart disease, unspecified'
                       ,'I60.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.0','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.1','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.2','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.3','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.4','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.5','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.6','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.9','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'431','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I63.0','I63.x_CVA'
                       ,'I63.00','I63.x_CVA'
                       ,'I63.01','I63.x_CVA'
                       ,'I63.02','I63.x_CVA'
                       ,'I63.08','I63.x_CVA'
                       ,'I63.09','I63.x_CVA'
                       ,'I63.1','I63.x_CVA'
                       ,'I63.10','I63.x_CVA'
                       ,'I63.11','I63.x_CVA'
                       ,'I63.12','I63.x_CVA'
                       ,'I63.18','I63.x_CVA'
                       ,'I63.19','I63.x_CVA'
                       ,'I63.2','I63.x_CVA'
                       ,'I63.20','I63.x_CVA'
                       ,'I63.21','I63.x_CVA'
                       ,'I63.22','I63.x_CVA'
                       ,'I63.28','I63.x_CVA'
                       ,'I63.29','I63.x_CVA'
                       ,'I63.3','I63.x_CVA'
                       ,'I63.30','I63.x_CVA'
                       ,'I63.31','I63.x_CVA'
                       ,'I63.32','I63.x_CVA'
                       ,'I63.33','I63.x_CVA'
                       ,'I63.38','I63.x_CVA'
                       ,'I63.39','I63.x_CVA'
                       ,'I63.4','I63.x_CVA'
                       ,'I63.40','I63.x_CVA'
                       ,'I63.41','I63.x_CVA'
                       ,'I63.42','I63.x_CVA'
                       ,'I63.43','I63.x_CVA'
                       ,'I63.48','I63.x_CVA'
                       ,'I63.49','I63.x_CVA'
                       ,'I63.5','I63.x_CVA'
                       ,'I63.50','I63.x_CVA'
                       ,'I63.51','I63.x_CVA'
                       ,'I63.52','I63.x_CVA'
                       ,'I63.53','I63.x_CVA'
                       ,'I63.58','I63.x_CVA'
                       ,'I63.59','I63.x_CVA'
                       ,'I63.6','I63.x_CVA'
                       ,'I63.8','I63.x_CVA'
                       ,'I63.9','I63.x_CVA'
                       ,'434.9','I63.x_CVA'
                       ,'I67.1','I67.1_cerebralaneurym'
                       ,'437.3','I67.1_cerebralaneurym'
                       ,'J30.1','J30.x_ALLERGIC_RHINITIS'
                       ,'477.0','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.2','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.3','J30.x_ALLERGIC_RHINITIS'
                       ,'477.8','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.4','J30.x_ALLERGIC_RHINITIS'
                       ,'477.9','J30.x_ALLERGIC_RHINITIS'
                       ,'J44.0','J44.x_COPD'
                       ,'J44.1','J44.x_COPD'
                       ,'J44.8','J44.x_COPD'
                       ,'491.2','J44.x_COPD'
                       ,'J44.9','J44.x_COPD'
                       ,'496','J44.x_COPD'
                       ,'J45.0','J45.x_ASTHMA'
                       ,'493.0','J45.x_ASTHMA'
                       ,'J45.1','J45.x_ASTHMA'
                       ,'493.1','J45.x_ASTHMA'
                       ,'J45.8','J45.x_ASTHMA'
                       ,'J45.9','J45.x_ASTHMA'
                       ,'493.9','J45.x_ASTHMA'
                       ,'L20.0','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.8','L20.x_ATOPIC_DERMATITIS'
                       ,'691.8','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.80','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.81','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.82','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.83','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.88','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.9','L20.x_ATOPIC_DERMATITIS'
                       ,'M80.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.6','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.60','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.61','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.62','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.63','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.64','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.65','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.66','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.67','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.68','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.69','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'733.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,''
            )
              ,1
              ,INSTR(DECODE(
             C.DIAGCODE,'G47.30','G47.30_obstuctive sleep apnea'
                       ,'G47.31','G47.31_central sleep apnea'
                       ,'G47.4','G47.4_narcolepsy and cataplexy'
                       ,'347','G47.4_narcolepsy and cataplexy'
                       ,'G47.8','G47.8/G47.9_sleep disorder unspecified'
                       ,'G47.9','G47.8/G47.9_sleep disorder unspecified'
                       ,'780.5','G47.8/G47.9_sleep disorder unspecified'
                       ,'H10.1','H10.1_ATOPIC_CONJUCTIVITIS'
                       ,'I20.0','I20.0_unstable angina'
                       ,'I20.1','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.8','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.9','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'413','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I21.0','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.1','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.2','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.3','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.9','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'410','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I24.9','I24.9_acute ischemic heart disease, unspecified'
                       ,'411','I24.9_acute ischemic heart disease, unspecified'
                       ,'I60.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.0','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.1','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.2','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.3','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.4','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.5','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.6','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.9','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'431','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I63.0','I63.x_CVA'
                       ,'I63.00','I63.x_CVA'
                       ,'I63.01','I63.x_CVA'
                       ,'I63.02','I63.x_CVA'
                       ,'I63.08','I63.x_CVA'
                       ,'I63.09','I63.x_CVA'
                       ,'I63.1','I63.x_CVA'
                       ,'I63.10','I63.x_CVA'
                       ,'I63.11','I63.x_CVA'
                       ,'I63.12','I63.x_CVA'
                       ,'I63.18','I63.x_CVA'
                       ,'I63.19','I63.x_CVA'
                       ,'I63.2','I63.x_CVA'
                       ,'I63.20','I63.x_CVA'
                       ,'I63.21','I63.x_CVA'
                       ,'I63.22','I63.x_CVA'
                       ,'I63.28','I63.x_CVA'
                       ,'I63.29','I63.x_CVA'
                       ,'I63.3','I63.x_CVA'
                       ,'I63.30','I63.x_CVA'
                       ,'I63.31','I63.x_CVA'
                       ,'I63.32','I63.x_CVA'
                       ,'I63.33','I63.x_CVA'
                       ,'I63.38','I63.x_CVA'
                       ,'I63.39','I63.x_CVA'
                       ,'I63.4','I63.x_CVA'
                       ,'I63.40','I63.x_CVA'
                       ,'I63.41','I63.x_CVA'
                       ,'I63.42','I63.x_CVA'
                       ,'I63.43','I63.x_CVA'
                       ,'I63.48','I63.x_CVA'
                       ,'I63.49','I63.x_CVA'
                       ,'I63.5','I63.x_CVA'
                       ,'I63.50','I63.x_CVA'
                       ,'I63.51','I63.x_CVA'
                       ,'I63.52','I63.x_CVA'
                       ,'I63.53','I63.x_CVA'
                       ,'I63.58','I63.x_CVA'
                       ,'I63.59','I63.x_CVA'
                       ,'I63.6','I63.x_CVA'
                       ,'I63.8','I63.x_CVA'
                       ,'I63.9','I63.x_CVA'
                       ,'434.9','I63.x_CVA'
                       ,'I67.1','I67.1_cerebralaneurym'
                       ,'437.3','I67.1_cerebralaneurym'
                       ,'J30.1','J30.x_ALLERGIC_RHINITIS'
                       ,'477.0','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.2','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.3','J30.x_ALLERGIC_RHINITIS'
                       ,'477.8','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.4','J30.x_ALLERGIC_RHINITIS'
                       ,'477.9','J30.x_ALLERGIC_RHINITIS'
                       ,'J44.0','J44.x_COPD'
                       ,'J44.1','J44.x_COPD'
                       ,'J44.8','J44.x_COPD'
                       ,'491.2','J44.x_COPD'
                       ,'J44.9','J44.x_COPD'
                       ,'496','J44.x_COPD'
                       ,'J45.0','J45.x_ASTHMA'
                       ,'493.0','J45.x_ASTHMA'
                       ,'J45.1','J45.x_ASTHMA'
                       ,'493.1','J45.x_ASTHMA'
                       ,'J45.8','J45.x_ASTHMA'
                       ,'J45.9','J45.x_ASTHMA'
                       ,'493.9','J45.x_ASTHMA'
                       ,'L20.0','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.8','L20.x_ATOPIC_DERMATITIS'
                       ,'691.8','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.80','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.81','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.82','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.83','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.88','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.9','L20.x_ATOPIC_DERMATITIS'
                       ,'M80.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.6','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.60','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.61','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.62','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.63','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.64','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.65','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.66','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.67','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.68','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.69','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'733.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,''
            )
                    ,'_'
                    )-1
             ) DIAGCODE
  FROM (
        SELECT A.PATNO, min(orddate) fstdate
          FROM SMRSV00T A, SMPKGMST B
         WHERE A.ORDDATE BETWEEN TO_DATE('19950101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
         group by a.patno
       ) A
     , MMPDIAGT C
 WHERE
--       A.PATNO = ''
--   AND
       A.PATNO = C.PATNO
   AND (C.DIAGCODE LIKE 'J45.%'
       OR
        C.DIAGCODE LIKE 'J44.%'
       OR
        C.DIAGCODE LIKE 'L20.%'
       OR
        C.DIAGCODE LIKE 'H10.1'
       OR
        C.DIAGCODE LIKE 'J30.1%'
       OR
        C.DIAGCODE LIKE 'J30.2%'
       OR
        C.DIAGCODE LIKE 'J30.3%'
       OR
        C.DIAGCODE LIKE 'J30.4%'
       OR
        C.DIAGCODE LIKE 'I60.%8%'
       OR
        C.DIAGCODE LIKE 'I61.%'
       OR
        C.DIAGCODE LIKE 'I63.%'
       OR
        C.DIAGCODE LIKE 'I67.1'
       OR
        C.DIAGCODE LIKE 'I20.0'
       OR
        C.DIAGCODE LIKE 'I20.1'
       OR
        C.DIAGCODE LIKE 'I20.8'
       OR
        C.DIAGCODE LIKE 'I20.9'
       OR
        C.DIAGCODE LIKE 'I21.0'
       OR
        C.DIAGCODE LIKE 'I21.1'
       OR
        C.DIAGCODE LIKE 'I21.2'
       OR
        C.DIAGCODE LIKE 'I21.3'
       OR
        C.DIAGCODE LIKE 'I21.9'
       OR
        C.DIAGCODE LIKE 'I24.9'
       OR
        C.DIAGCODE LIKE 'G47.30'
       OR
        C.DIAGCODE LIKE 'G47.31'
       OR
        C.DIAGCODE LIKE 'G47.4'
       OR
        C.DIAGCODE LIKE 'G47.8'
       OR
        C.DIAGCODE LIKE 'G47.9'
       OR
        C.DIAGCODE LIKE 'M80.%'
       OR
        C.DIAGCODE LIKE 'M81.%'
       OR
        C.DIAGCODE LIKE 'M82.%'
       )
   AND C.MAINYN = 'Y'
GROUP BY A.PATNO, A.fstdate
    , DECODE(
             C.DIAGCODE,'G47.30','G47.30_obstuctive sleep apnea'
                       ,'G47.31','G47.31_central sleep apnea'
                       ,'G47.4','G47.4_narcolepsy and cataplexy'
                       ,'347','G47.4_narcolepsy and cataplexy'
                       ,'G47.8','G47.8/G47.9_sleep disorder unspecified'
                       ,'G47.9','G47.8/G47.9_sleep disorder unspecified'
                       ,'780.5','G47.8/G47.9_sleep disorder unspecified'
                       ,'H10.1','H10.1_ATOPIC_CONJUCTIVITIS'
                       ,'I20.0','I20.0_unstable angina'
                       ,'I20.1','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.8','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I20.9','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'413','I20.1/I20.8/I20.9_angina factoris unspecified'
                       ,'I21.0','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.1','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.2','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.3','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I21.9','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'410','I21.0/I21.1/I21.2/I21.3/I21.9_acute myocaridal infaction'
                       ,'I24.9','I24.9_acute ischemic heart disease, unspecified'
                       ,'411','I24.9_acute ischemic heart disease, unspecified'
                       ,'I60.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.0','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.1','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.2','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.3','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.4','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.5','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.6','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.8','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I61.9','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'431','I60.x8/I61.x_brain haemorrhage from artery'
                       ,'I63.0','I63.x_CVA'
                       ,'I63.00','I63.x_CVA'
                       ,'I63.01','I63.x_CVA'
                       ,'I63.02','I63.x_CVA'
                       ,'I63.08','I63.x_CVA'
                       ,'I63.09','I63.x_CVA'
                       ,'I63.1','I63.x_CVA'
                       ,'I63.10','I63.x_CVA'
                       ,'I63.11','I63.x_CVA'
                       ,'I63.12','I63.x_CVA'
                       ,'I63.18','I63.x_CVA'
                       ,'I63.19','I63.x_CVA'
                       ,'I63.2','I63.x_CVA'
                       ,'I63.20','I63.x_CVA'
                       ,'I63.21','I63.x_CVA'
                       ,'I63.22','I63.x_CVA'
                       ,'I63.28','I63.x_CVA'
                       ,'I63.29','I63.x_CVA'
                       ,'I63.3','I63.x_CVA'
                       ,'I63.30','I63.x_CVA'
                       ,'I63.31','I63.x_CVA'
                       ,'I63.32','I63.x_CVA'
                       ,'I63.33','I63.x_CVA'
                       ,'I63.38','I63.x_CVA'
                       ,'I63.39','I63.x_CVA'
                       ,'I63.4','I63.x_CVA'
                       ,'I63.40','I63.x_CVA'
                       ,'I63.41','I63.x_CVA'
                       ,'I63.42','I63.x_CVA'
                       ,'I63.43','I63.x_CVA'
                       ,'I63.48','I63.x_CVA'
                       ,'I63.49','I63.x_CVA'
                       ,'I63.5','I63.x_CVA'
                       ,'I63.50','I63.x_CVA'
                       ,'I63.51','I63.x_CVA'
                       ,'I63.52','I63.x_CVA'
                       ,'I63.53','I63.x_CVA'
                       ,'I63.58','I63.x_CVA'
                       ,'I63.59','I63.x_CVA'
                       ,'I63.6','I63.x_CVA'
                       ,'I63.8','I63.x_CVA'
                       ,'I63.9','I63.x_CVA'
                       ,'434.9','I63.x_CVA'
                       ,'I67.1','I67.1_cerebralaneurym'
                       ,'437.3','I67.1_cerebralaneurym'
                       ,'J30.1','J30.x_ALLERGIC_RHINITIS'
                       ,'477.0','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.2','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.3','J30.x_ALLERGIC_RHINITIS'
                       ,'477.8','J30.x_ALLERGIC_RHINITIS'
                       ,'J30.4','J30.x_ALLERGIC_RHINITIS'
                       ,'477.9','J30.x_ALLERGIC_RHINITIS'
                       ,'J44.0','J44.x_COPD'
                       ,'J44.1','J44.x_COPD'
                       ,'J44.8','J44.x_COPD'
                       ,'491.2','J44.x_COPD'
                       ,'J44.9','J44.x_COPD'
                       ,'496','J44.x_COPD'
                       ,'J45.0','J45.x_ASTHMA'
                       ,'493.0','J45.x_ASTHMA'
                       ,'J45.1','J45.x_ASTHMA'
                       ,'493.1','J45.x_ASTHMA'
                       ,'J45.8','J45.x_ASTHMA'
                       ,'J45.9','J45.x_ASTHMA'
                       ,'493.9','J45.x_ASTHMA'
                       ,'L20.0','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.8','L20.x_ATOPIC_DERMATITIS'
                       ,'691.8','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.80','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.81','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.82','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.83','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.88','L20.x_ATOPIC_DERMATITIS'
                       ,'L20.9','L20.x_ATOPIC_DERMATITIS'
                       ,'M80.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M80.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.2','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.20','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.21','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.22','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.23','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.24','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.25','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.26','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.27','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.28','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.29','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.3','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.30','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.31','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.32','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.33','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.34','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.35','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.36','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.37','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.38','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.39','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.4','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.40','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.41','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.42','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.43','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.44','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.45','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.46','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.47','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.48','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.49','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.5','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.50','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.51','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.52','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.53','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.54','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.55','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.56','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.57','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.58','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.59','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.6','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.60','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.61','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.62','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.63','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.64','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.65','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.66','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.67','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.68','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.69','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.9','M80.x/M81.x/M82.x_osteoporosis'
                       ,'733.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.90','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.91','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.92','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.93','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.94','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.95','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.96','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.97','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.98','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M81.99','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.0','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.00','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.01','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.02','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.03','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.04','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.05','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.06','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.07','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.08','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.09','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.1','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.10','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.11','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.12','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.13','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.14','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.15','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.16','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.17','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.18','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.19','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.8','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.80','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.81','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.82','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.83','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.84','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.85','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.86','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.87','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.88','M80.x/M81.x/M82.x_osteoporosis'
                       ,'M82.89','M80.x/M81.x/M82.x_osteoporosis'
                       ,''
            )
       ) A
 GROUP BY A.PATNO, A.fstdate

-- 건진처방 검사 결과
SELECT A.PATNO, A.ORDDATE
     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , MAX(DECODE(B.EXAMCODE,'SM0101',B.RSLTNUM,''))     "height"
     , MAX(DECODE(B.EXAMCODE,'SM0102',B.RSLTNUM,''))     "weight"
     , MAX(DECODE(B.EXAMCODE,'SM316001',B.RSLTNUM,''))   "bmi"
     , MAX(DECODE(B.EXAMCODE,'SM010502',B.RSLTNUM,''))   "AB_GIRTH"
     , MAX(DECODE(B.EXAMCODE,'SM0104',B.RSLTNUM,''))     "%_BODYFAT"
     , MAX(DECODE(B.EXAMCODE,'SM0106',B.RSLTNUM,''))     "Obesity"
     , MAX(DECODE(B.EXAMCODE,'SM0111',B.RSLTNUM,''))     "Bodymass"
     , MAX(DECODE(B.EXAMCODE,'SM0112',B.RSLTNUM,''))     "%_Abfat"
     , MAX(DECODE(B.EXAMCODE,'SM3140',B.RSLTNUM,''))     "bodyfatmass"
     , MAX(DECODE(B.EXAMCODE,'BL2011',B.RSLTNUM,''))     "wbc"
     , MAX(DECODE(B.EXAMCODE,'BL2012',B.RSLTNUM,''))     "rbc"
     , MAX(DECODE(B.EXAMCODE,'BL2013',B.RSLTNUM,''))     "hb"
     , MAX(DECODE(B.EXAMCODE,'BL2014',B.RSLTNUM,''))     "hct"
     , MAX(DECODE(B.EXAMCODE,'BL2016',B.RSLTNUM,''))     "platelet"
     , MAX(DECODE(B.EXAMCODE,'BL201808',B.RSLTNUM,''))   "Band_neutrophils"
     , MAX(DECODE(B.EXAMCODE,'BL201806',B.RSLTNUM,''))   "Seg_neutrophils"
     , MAX(DECODE(B.EXAMCODE,'BL201807',B.RSLTNUM,''))   "eosinoph"
     , MAX(DECODE(B.EXAMCODE,'BL201808',B.RSLTNUM,''))   "basoph"
     , MAX(DECODE(B.EXAMCODE,'BL201809',B.RSLTNUM,''))   "lymph"
     , MAX(DECODE(B.EXAMCODE,'BL201810',B.RSLTNUM,''))   "monoc"
     , MAX(DECODE(B.EXAMCODE,'BL2017',B.RSLTNUM,''))     "PDW"
     , MAX(DECODE(B.EXAMCODE,'BL2015',B.RSLTNUM,''))     "RDW"
     , MAX(DECODE(B.EXAMCODE,'BL201815',B.RSLTNUM,''))   "ANC"
     , MAX(DECODE(B.EXAMCODE,'BL2021',B.RSLTNUM,''))     "ESR"
     , MAX(DECODE(B.EXAMCODE,'BL211101',B.RSLTNUM,''))   "PT_SEC"
     , MAX(DECODE(B.EXAMCODE,'BL211102',B.RSLTNUM,''))   "PT_%"
     , MAX(DECODE(B.EXAMCODE,'BL211103',B.RSLTNUM,''))   "PT_INR"
     , MAX(DECODE(B.EXAMCODE,'BL2112',B.RSLTNUM,''))     "APTT"
     , MAX(DECODE(B.EXAMCODE,'BL2113',B.RSLTNUM,''))     "Fibrinogen"
     , MAX(DECODE(B.EXAMCODE,'BL2136',B.RSLTNUM,''))     "PAI-1"
     , MAX(DECODE(B.EXAMCODE,'BL2141',B.RSLTNUM,''))     "tPA"
     , MAX(DECODE(B.EXAMCODE,'BL3111',B.RSLTNUM,''))     "Protein, Total"
     , MAX(DECODE(B.EXAMCODE,'BL3112',B.RSLTNUM,''))     "Albumin"
     , MAX(DECODE(B.EXAMCODE,'BL3114',B.RSLTNUM,''))     "Bilirubin, Total"
     , MAX(DECODE(B.EXAMCODE,'BL3115',B.RSLTNUM,''))     "AST"
     , MAX(DECODE(B.EXAMCODE,'BL3116',B.RSLTNUM,''))     "ALT"
     , MAX(DECODE(B.EXAMCODE,'BL3117',B.RSLTNUM,''))     "ALP"
     , MAX(DECODE(B.EXAMCODE,'BL3125',B.RSLTNUM,''))     "GGT"
     , MAX(DECODE(B.EXAMCODE,'BL3118',B.RSLTNUM,''))     "gluc"
     , MAX(DECODE(B.EXAMCODE,'BL3164',B.RSLTNUM,''))     "hba1c"
     , MAX(DECODE(B.EXAMCODE,'BL3119',B.RSLTNUM,''))     "BUN"
     , MAX(DECODE(B.EXAMCODE,'BL3120',B.RSLTNUM,''))     "Creatinine"
     , MAX(DECODE(B.EXAMCODE,'BL3121',B.RSLTNUM,''))     "Uric Acid"
     , MAX(DECODE(B.EXAMCODE,'BL3122',B.RSLTNUM,''))     "Ca"
     , MAX(DECODE(B.EXAMCODE,'BL3123',B.RSLTNUM,''))     "P"
     , MAX(DECODE(B.EXAMCODE,'BL3131',B.RSLTNUM,''))     "Na"
     , MAX(DECODE(B.EXAMCODE,'BL3132',B.RSLTNUM,''))     "K"
     , MAX(DECODE(B.EXAMCODE,'BL3133',B.RSLTNUM,''))     "Cl"
     , MAX(DECODE(B.EXAMCODE,'BL3135',B.RSLTNUM,''))     "Iron, Serum"
     , MAX(DECODE(B.EXAMCODE,'BL3136',B.RSLTNUM,''))     "TIBC "
     , MAX(DECODE(B.EXAMCODE,'NR2401',B.RSLTNUM,''))     "Ferritin"
     , MAX(DECODE(B.EXAMCODE,'BL3113',B.RSLTNUM,''))     "tchol"
     , MAX(DECODE(B.EXAMCODE,'BL3141',B.RSLTNUM,''))     "tg"
     , MAX(DECODE(B.EXAMCODE,'BL3142',B.RSLTNUM,''))     "hdl"
     , MAX(DECODE(B.EXAMCODE,'BL314201',B.RSLTNUM,''))   "ldl"
     , MAX(DECODE(B.EXAMCODE,'BL3304',B.RSLTNUM,''))     "Apo A1 "
     , MAX(DECODE(B.EXAMCODE,'BL3305',B.RSLTNUM,''))     "Apo B "
     , MAX(DECODE(B.EXAMCODE,'BL3982',B.RSLTNUM,''))     "NT-pro BNP"
     , MAX(DECODE(B.EXAMCODE,'BL3307',B.RSLTNUM,''))     "Lp(a)"
     , MAX(DECODE(B.EXAMCODE,'BL3A2502',B.RSLTNUM,''))   "Homocystein"
     , MAX(DECODE(B.EXAMCODE,'NR6104',B.RSLTNUM,''))     "LH"
     , MAX(DECODE(B.EXAMCODE,'NR6105',B.RSLTNUM,''))     "FSH"
     , MAX(DECODE(B.EXAMCODE,'BL3610',B.RSLTNUM
                            ,'NR6103',B.RSLTNUM,''))     "Prolactin"
     , MAX(DECODE(B.EXAMCODE,'NR5105',B.RSLTNUM,''))     "HCG"
     , MAX(DECODE(B.EXAMCODE,'NR5101',B.RSLTNUM,''))     "E2 "
     , MAX(DECODE(B.EXAMCODE,'NR1107',B.RSLTNUM
                            ,'BL3713',B.RSLTNUM,''))     "PSA"
     , MAX(DECODE(B.EXAMCODE,'NR1101',B.RSLTNUM
                            ,'BL3711',B.RSLTNUM,''))     "AFP"
     , MAX(DECODE(B.EXAMCODE,'NR1102',B.RSLTNUM
                            ,'BL3712',B.RSLTNUM,''))     "CEA"
     , MAX(DECODE(B.EXAMCODE,'NR1103',B.RSLTNUM,''))     "CA-125"
     , MAX(DECODE(B.EXAMCODE,'NR1104',B.RSLTNUM
                            ,'BL3717',B.RSLTNUM,''))     "CA-19-9"
     , MAX(DECODE(B.EXAMCODE,'NR2301',B.RSLTNUM,''))     "Vit B12"
     , MAX(DECODE(B.EXAMCODE,'NR2302',B.RSLTNUM,''))     "Folate"
     , MAX(DECODE(B.EXAMCODE,'NR4101',B.RSLTNUM,''))     "T3 RIA"
     , MAX(DECODE(B.EXAMCODE,'NR4102',B.RSLTNUM,''))     "T4 RIA"
     , MAX(DECODE(B.EXAMCODE,'NR4103',B.RSLTNUM,''))     "TSH"
     , MAX(DECODE(B.EXAMCODE,'NR7104',B.RSLTNUM,''))     "Insulin"
     , MAX(DECODE(B.EXAMCODE,'NR7105',B.RSLTNUM,''))     "C-Peptide "
     , MAX(DECODE(B.EXAMCODE,'BL512001',B.RSLTNUM,''))     "Anti-HAV Ab,IgG"
     , MAX(DECODE(B.EXAMCODE,'NR0101',B.RSLTNUM
                            ,'BL5111',B.RSLTNUM,''))     "HBsAg"
     , MAX(DECODE(B.EXAMCODE,'NR0102',B.RSLTNUM
                            ,'BL5112',B.RSLTNUM,''))     "HBsAb"
     , MAX(DECODE(B.EXAMCODE,'NR0103',B.RSLTNUM
                            ,'BL5113',B.RSLTNUM,''))     "HBcAb(IgG)"
     , MAX(DECODE(B.EXAMCODE,'BL5117',B.RSLTNUM,''))     "Anti-HCV Antibody"
     , MAX(DECODE(B.EXAMCODE,'BL512202',B.RSLTNUM
                            ,'BL5122',B.RSLTNUM,''))     "Anti-HIV Antibody"
     , MAX(DECODE(B.EXAMCODE,'BL3140',B.RSLTNUM,''))     "CRP"
     , MAX(DECODE(B.EXAMCODE,'BL399203',B.RSLTNUM,''))   "VitD"
     , MAX(DECODE(B.EXAMCODE,'BL399202',B.RSLTNUM,''))   "VitD_D3"
     , MAX(DECODE(B.EXAMCODE,'BL399201',B.RSLTNUM,''))   "VitD_D2"
     , MAX(DECODE(B.EXAMCODE,'BL3653',B.RSLTNUM,''))     "osteocalcin"
     , MAX(DECODE(B.EXAMCODE,'BL3665',B.RSLTNUM,''))     "CTX, serum"
     , MAX(DECODE(B.EXAMCODE,'BAR1101',B.RSLTNUM
                            ,'BL3335',B.RSLTNUM,''))    "IgE"
     , MAX(DECODE(B.EXAMCODE,'BAR2201',B.RSLTNUM,''))    "d1"
     , MAX(DECODE(B.EXAMCODE,'BAR2202',B.RSLTNUM,''))    "d2"
     , MAX(DECODE(B.EXAMCODE,'BAR2301',B.RSLTNUM,''))    "e1"
     , MAX(DECODE(B.EXAMCODE,'BAR2504',B.RSLTNUM,''))    "gx2"
     , MAX(DECODE(B.EXAMCODE,'BAR2901',B.RSLTNUM,''))    "mx1"
     , MAX(DECODE(B.EXAMCODE,'BAR2C07',B.RSLTNUM,''))    "tx9"
     , MAX(DECODE(B.EXAMCODE,'BAR2D04',B.RSLTNUM,''))    "wx5"
     , MAX(DECODE(B.EXAMCODE,'BL3249',B.RSLTNUM,''))     "U_CR"
     , MAX(DECODE(B.EXAMCODE,'BL3252',B.RSLTNUM,''))     "U_ALB"
     , MAX(DECODE(B.EXAMCODE,'BL326501',B.RSLTNUM,''))   "alb/creatinine ratio "
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) SBP
     , MAX(DECODE(B.EXAMCODE,'SM0600',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) DBP
     , MAX(DECODE(B.EXAMCODE,'RS2010',TO_CHAR(B.RSLTTEXT),'')) CAROTID_SONO
     , MAX(DECODE(B.EXAMCODE,'SM053101',B.RSLTNUM,'')) "distal CCA IMT rt"
     , MAX(DECODE(B.EXAMCODE,'SM053111',B.RSLTNUM,'')) "distal CCA IMT lt (mm)"
     , MAX(DECODE(B.EXAMCODE,'SM0540',B.RSLTNUM,''))   "ABN_IMT plaques"
     , MAX(DECODE(B.EXAMCODE,'SM054011',B.RSLTNUM,'')) "ABN_IMT : RT ICA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054012',B.RSLTNUM,'')) "ABN_Fibrofatty : RT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM054013',B.RSLTNUM,'')) "ABN_Length : RT ICA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054021',B.RSLTNUM,'')) "ABN_IMT : RT ECA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054022',B.RSLTNUM,'')) "ABN_Fibrofatty : RT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM054023',B.RSLTNUM,'')) "ABN_Length : RT ECA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054031',B.RSLTNUM,'')) "ABN_IMT : RT CCA PROX(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054032',B.RSLTNUM,'')) "ABN_Fibrofatty : RT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM054033',B.RSLTNUM,'')) "ABN_Length : RT CCA PROX(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054041',B.RSLTNUM,'')) "ABN_IMT : RT CCA MID(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054042',B.RSLTNUM,'')) "ABN_Fibrofatty : RT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM054043',B.RSLTNUM,'')) "ABN_Length : RT CCA MID(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054051',B.RSLTNUM,'')) "ABN_IMT : RT CCA DIST(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054052',B.RSLTNUM,'')) "ABN_Fibrofatty : RT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM054053',B.RSLTNUM,'')) "ABN_Length : RT CCA DIST(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054061',B.RSLTNUM,'')) "ABN_IMT : RT CCA BIF(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054062',B.RSLTNUM,'')) "ABN_Fibrofatty : RT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM054063',B.RSLTNUM,'')) "ABN_Length : RT CCA BIF(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054071',B.RSLTNUM,'')) "ABN_IMT : RT VA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054072',B.RSLTNUM,'')) "ABN_Fibrofatty : RT VA"
     , MAX(DECODE(B.EXAMCODE,'SM054073',B.RSLTNUM,'')) "ABN_Length : RT VA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054081',B.RSLTNUM,'')) "ABN_IMT : RT SCA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054082',B.RSLTNUM,'')) "ABN_Fibrofatty : RT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM054083',B.RSLTNUM,'')) "ABN_Length : RT SCA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054111',B.RSLTNUM,'')) "ABN_IMT : LT ICA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054112',B.RSLTNUM,'')) "ABN_Fibrofatty : LT ICA"
     , MAX(DECODE(B.EXAMCODE,'SM054113',B.RSLTNUM,'')) "ABN_Length : LT ICA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054121',B.RSLTNUM,'')) "ABN_IMT : LT ECA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054122',B.RSLTNUM,'')) "ABN_Fibrofatty : LT ECA"
     , MAX(DECODE(B.EXAMCODE,'SM054123',B.RSLTNUM,'')) "ABN_Length : LT ECA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054131',B.RSLTNUM,'')) "ABN_IMT : LT CCA PROX(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054132',B.RSLTNUM,'')) "ABN_Fibrofatty : LT CCA PROX"
     , MAX(DECODE(B.EXAMCODE,'SM054133',B.RSLTNUM,'')) "ABN_Length : LT CCA PROX(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054141',B.RSLTNUM,'')) "ABN_IMT : LT CCA MID(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054142',B.RSLTNUM,'')) "ABN_Fibrofatty : LT CCA MID"
     , MAX(DECODE(B.EXAMCODE,'SM054143',B.RSLTNUM,'')) "ABN_Length : LT CCA MID(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054151',B.RSLTNUM,'')) "ABN_IMT : LT CCA DIST(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054152',B.RSLTNUM,'')) "ABN_Fibrofatty : LT CCA DIST"
     , MAX(DECODE(B.EXAMCODE,'SM054153',B.RSLTNUM,'')) "ABN_Length : LT CCA DIST(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054161',B.RSLTNUM,'')) "ABN_IMT : LT CCA BIF(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054162',B.RSLTNUM,'')) "ABN_Fibrofatty : LT CCA BIF"
     , MAX(DECODE(B.EXAMCODE,'SM054163',B.RSLTNUM,'')) "ABN_Length : LT CCA BIF(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054171',B.RSLTNUM,'')) "ABN_IMT : LT VA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054172',B.RSLTNUM,'')) "ABN_Fibrofatty : LT VA"
     , MAX(DECODE(B.EXAMCODE,'SM054173',B.RSLTNUM,'')) "ABN_Length : LT VA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054181',B.RSLTNUM,'')) "ABN_IMT : LT SCA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM054182',B.RSLTNUM,'')) "ABN_Fibrofatty : LT SCA"
     , MAX(DECODE(B.EXAMCODE,'SM054183',B.RSLTNUM,'')) "ABN_Length : LT SCA(mm)"
     , MAX(DECODE(B.EXAMCODE,'SM0550',B.RSLTNUM,''))   "Stenotic Lesion"
     , MAX(DECODE(B.EXAMCODE,'SM055013',B.RSLTNUM,'')) "Stenotic : RT ICA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055023',B.RSLTNUM,'')) "Stenotic : RT ECA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055033',B.RSLTNUM,'')) "Stenotic : RT CCA PROX(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055043',B.RSLTNUM,'')) "Stenotic : RT CCA MID(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055053',B.RSLTNUM,'')) "Stenotic : RT CCA DIST(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055063',B.RSLTNUM,'')) "Stenotic : RT CCA BIF(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055073',B.RSLTNUM,'')) "Stenotic : RT VA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055083',B.RSLTNUM,'')) "Stenotic : RT SCA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055113',B.RSLTNUM,'')) "Stenotic : LT ICA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055123',B.RSLTNUM,'')) "Stenotic : LT ECA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055133',B.RSLTNUM,'')) "Stenotic : LT CCA PROX(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055143',B.RSLTNUM,'')) "Stenotic : LT CCA MID(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055153',B.RSLTNUM,'')) "Stenotic : LT CCA DIST(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055163',B.RSLTNUM,'')) "Stenotic : LT CCA BIF(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055173',B.RSLTNUM,'')) "Stenotic : LT VA(%)"
     , MAX(DECODE(B.EXAMCODE,'SM055183',B.RSLTNUM,'')) "Stenotic : LT SCA(%)"
     , MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BP:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ht:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BP:')-3
                        )
                 ,''
                 )
          ) ECHO_BP
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ht:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Wt:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ht:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ht:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Wt:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ht:')-3
                        )
                 ,''
                 )
          )
                   ,'cm'
                   )-1
             ) "ECHO_Ht"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Wt:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BSA:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Wt:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Wt:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BSA:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Wt:')-3
                        )
                 ,''
                 )
          )
                   ,'kg'
                   )-1
             ) "ECHO_Wt"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BSA:')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'M-Modedata')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BSA:')-4
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BSA:')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'M-Modedata')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BSA:')-4
                        )
                 ,''
                 )
          )
                   ,'㎡'
                   )-1
             ) ECHO_BSA
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDd:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'IVSd:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDd:')-6
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDd:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'IVSd:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDd:')-6
                        )
                 ,''
                 )
          )
                   ,'mm'
                   )-1
             ) "ECHO_LVIDd"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'IVSd:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'IVSd:')-5
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'IVSd:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'IVSd:')-5
                        )
                 ,''
                 )
          )
                   ,'mm'
                   )-1
             )  "ECHO_IVSd"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E:')+2
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'e`:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E:')-2
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E:')+2
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'e`:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E:')-2
                        )
                 ,''
                 )
          )
                   ,'m/s'
                   )-1
             ) ECHO_E
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'e`:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDs:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'e`:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'e`:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDs:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'e`:')-3
                        )
                 ,''
                 )
          )
                   ,'m/s'
                   )-1
             ) "ECHO_e`"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDs:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVPWd:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDs:')-6
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDs:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVPWd:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVIDs:')-6
                        )
                 ,''
                 )
          )
                   ,'mm'
                   )-1
             ) "ECHO_LVIDs"
     , MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVPWd:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmA:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVPWd:')-6
                        )
                 ,''
                 )
          ) "ECHO_LVPWd"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmA:')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'a`:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmA:')-4
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmA:')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'a`:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmA:')-4
                        )
                 ,''
                 )
          )
                   ,'m/s'
                   )-1
             ) "ECHO_A"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'a`:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LA:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'a`:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'a`:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LA:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'a`:')-3
                        )
                 ,''
                 )
          )
                   ,'m/s'
                   )-1
             )  "ECHO_a`"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LA:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/A:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LA:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LA:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/A:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LA:')-3
                        )
                 ,''
                 )
          )
                   ,'mm'
                   )-1
             ) "ECHO_LA"
     , MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/A:')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/e`:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/A:')-4
                        )
                 ,''
                 )
          ) "ECHO_E/A"
     , MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/e`:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVEF:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'E/e`:')-5
                        )
                 ,''
                 )
          ) "ECHO_E/e`"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVEF:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ao:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVEF:')-5
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVEF:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ao:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LVEF:')-5
                        )
                 ,''
                 )
          )
                   ,'%'
                   )-1
             ) "ECHO_LVEF"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ao:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DT:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ao:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ao:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DT:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Ao:')-3
                        )
                 ,''
                 )
          )
                   ,'mm'
                   )-1
             ) "ECHO_Ao"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DT:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LAVI:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DT:')-3
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DT:')+3
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LAVI:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DT:')-3
                        )
                 ,''
                 )
          )
                   ,'msec'
                   )-1
             ) "ECHO_DT"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LAVI:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'A-L(')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LAVI:')-5
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LAVI:')+5
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'A-L(')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'LAVI:')-5
                        )
                 ,''
                 )
          )
                   ,'ml/m2'
                   )-1
             ) "ECHO_LAVI"
     , MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'A-L(')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),')LVMI:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'A-L(')-4
                        )
                 ,''
                 )
          ) "ECHO_A-L"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),')LVMI:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RWT:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),')LVMI:')-6
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),')LVMI:')+6
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RWT:')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),')LVMI:')-6
                        )
                 ,''
                 )
          )
                   ,'g/㎡'
                   )-1
             ) "ECHO_LVMI"
     , MAX(DECODE(B.EXAMCODE
                 ,'BS2231'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RWT:')+4
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'[RWMA]')
                         -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RWT:')-4
                        )
                 ,''
                 )
          ) "ECHO_RWT"
     , MAX(DECODE(B.EXAMCODE,'BS2231',TO_CHAR(B.RSLTTEXT),'')) ECHO
     , MAX(
           DECODE(
                  B.EXAMCODE
                 ,'RC1184'
                 ,DECODE(
                         SUBSTR(
                                REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                               ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'AJ-130=')+7
                               ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),',volume130')
                               -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'AJ-130=')-7
                               )
                        ,''
                        ,'0'
                        ,SUBSTR(
                                REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                               ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'AJ-130=')+7
                               ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),',volume130')
                               -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'AJ-130=')-7
                               )
                        )
                 ,''
                 )
          ) CAC_SCORE_AJ130
     , MAX(DECODE(
                  DECODE(
                         B.EXAMCODE
                        ,'RC1184'
                        ,DECODE(
                                DECODE(
                                       DECODE(
                                              DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             ,''
                                             ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Moderatedegree'),'0','','3') -- Moderatedegree
                                             ,DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             )
                                      ,''
                                      ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Highdegree'),'0','','4') -- Highdegree
                                      ,DECODE(
                                              DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             ,''
                                             ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Moderatedegree'),'0','','3') -- Moderatedegree
                                             ,DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             )
                                      )
                               ,''
                               ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Veryhighdegree'),'0','','5') -- Veryhighdegree
                               ,DECODE(
                                       DECODE(
                                              DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             ,''
                                             ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Moderatedegree'),'0','','3') -- Moderatedegree
                                             ,DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             )
                                      ,''
                                      ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Highdegree'),'0','','4') -- Highdegree
                                      ,DECODE(
                                              DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             ,''
                                             ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Moderatedegree'),'0','','3') -- Moderatedegree
                                             ,DECODE(
                                                     DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    ,''
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree'),'0','','2') -- Milddegree
                                                    ,DECODE(INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree'),'0','','1') -- Minimaldegree
                                                    )
                                             )
                                      )
                               )
                        ,''
                        )
                 ,'1',SUBSTR(
                             REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')+9
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Minimaldegree')
                            -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')-9
                            )
                 ,'2',SUBSTR(
                             REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')+9
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Milddegree')
                            -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')-9
                            )
                 ,'3',SUBSTR(
                             REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')+9
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Moderatedegree')
                            -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')-9
                            )
                 ,'4',SUBSTR(
                             REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')+9
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Highdegree')
                            -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')-9
                            )
                 ,'5',SUBSTR(
                             REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')+9
                            ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Veryhighdegree')
                            -INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'130score=')-9
                            )
                 ,''
                 )
          ) V_130_SCORE
     , MAX(
           DECODE(
                  B.EXAMCODE
                 ,'RC1184'
                 ,DECODE(
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Percentilerank')
                        ,'0'
                        ,''
                        ,SUBSTR(
                                REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                               ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Percentilerank')+14
                               )
                        )
                 ,''
                 )
          ) "RANK%"
     , MAX(DECODE(B.EXAMCODE,'RC1184',TO_CHAR(B.RSLTTEXT),'')) CACT
     , MAX(DECODE(B.EXAMCODE,'RM3170N',TO_CHAR(B.RSLTTEXT),'')) "BRAIN MRI/A"
     , MAX(DECODE(B.EXAMCODE,'BS1701',TO_CHAR(B.RSLTTEXT),'')) TCD
     , MAX(DECODE(B.EXAMCODE,'RG010P',TO_CHAR(B.RSLTTEXT),'')) CHEST_PA
     , MAX(DECODE(B.EXAMCODE,'RC1241',TO_CHAR(B.RSLTTEXT),'')) "LOW DOSE CHEST CT"
     , MAX(DECODE(B.EXAMCODE,'RM11103C',TO_CHAR(B.RSLTTEXT),'')) "HEART_MRI"
     , MAX(DECODE(B.EXAMCODE,'RG923C',TO_CHAR(B.RSLTTEXT),'')) MAMMO
     , MAX(DECODE(B.EXAMCODE,'RS1190',TO_CHAR(B.RSLTTEXT),'')) BREAST_SONO
     , MAX(DECODE(B.EXAMCODE,'RS1010',TO_CHAR(B.RSLTTEXT)
                            ,'RS1031',TO_CHAR(B.RSLTTEXT),'')) "ABD_SONO"
     , MAX(DECODE(B.EXAMCODE,'RC3120',TO_CHAR(B.RSLTTEXT),'')) ABD_PELVIS_CT
      , MAX(
             DECODE(
                    B.EXAMCODE
                    ,'RG9214'
                    ,SUBSTR(
                            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                           ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'Tvalue는')+8
                           ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'로서')
                           -INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'Tvalue는')-8
                           )
                    ,'')
             )  "LUMBAR SPINE"  -- L1_4 최종
      , MAX(
            SUBSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'neck')
                                )
                         )
                  ,INSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'neck')
                                )
                         )
                        ,'Tvalue는'
                        )+8
                  ,INSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                 ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'neck')
                                )
                         )
                         ,'로서'
                        )
                  -INSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                 ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'neck')
                                )
                         )
                        ,'Tvalue는'
                        )-8
                  )
           ) "FEMUR neck"  -- FNECK 최종
      , MAX(
            SUBSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'total')
                                )
                         )
                  ,INSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'total')
                                )
                         )
                        ,'Tvalue는'
                        )+8
                  ,INSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'total')
                                )
                         )
                         ,'로서'
                        )
                  -INSTR(
                   DECODE(
                          B.EXAMCODE
                         ,'RG9214'
                         ,SUBSTR(
                                 REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')','')
                                 ,INSTR(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(10),''),CHR(13),''),CHR(32),''),'(',''),')',''),'total')
                                )
                         )
                        ,'Tvalue는'
                        )-8
                  )
           ) "FEMUR TOTAL"  -- FTOTAL 최종
      , MAX(DECODE(B.EXAMCODE,'RG9214',TO_CHAR(B.RSLTTEXT),'')) BMD
     , MAX(DECODE(B.EXAMCODE,'SM1805',TO_CHAR(B.RSLTTEXT),'')) "Transvaginal US"
     , MAX(DECODE(B.EXAMCODE
                 ,'RS1140'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Prostatevolume:')+15
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'cc,Transitionalzone')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Prostatevolume:')-15
                        )
                 ,''
                 )
          ) "Prostate volume(cc)"
     , MAX(DECODE(B.EXAMCODE
                 ,'RS1140'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Transitionalzonevolume:')+23
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ccFocalabnormal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'Transitionalzonevolume:')-23
                        )
                 ,''
                 )
          ) "Transitional zone volume(cc)"
     , MAX(DECODE(B.EXAMCODE
                 ,'RS1140'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DRESize:')+8
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'gmConsistency')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'DRESize:')-8
                        )
                 ,''
                 )
          ) "Size(gm)"
     , MAX(DECODE(B.EXAMCODE,'RS1140',TO_CHAR(B.RSLTTEXT),'')) TRUS
     , MAX(DECODE(B.EXAMCODE,'BS2111',TO_CHAR(B.RSLTTEXT),'')) "EKG"
     , MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingHR:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BPMTargetHR:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingHR:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingHR:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BPMTargetHR:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingHR:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시심박수:')+13
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'회목표심박수:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시심박수:')-13
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시심박수:')+13
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'회목표심박수:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시심박수:')-13
                        )
                 ,''
                 )
          )  "Resting HR(BPM)"
     , MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TargetHR:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BPMMaximalHR:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TargetHR:')-9
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TargetHR:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BPMMaximalHR:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TargetHR:')-9
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'목표심박수:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'회최대심박수:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'목표심박수:')-11
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'목표심박수:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'회최대심박수:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'목표심박수:')-11
                        )
                 ,''
                 )
          ) "Target HR(BPM)"
     , MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalHR:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BPMRestingBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalHR:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalHR:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'BPMRestingBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalHR:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대심박수:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'회안정시혈압:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대심박수:')-11
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대심박수:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'회안정시혈압:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대심박수:')-11
                        )
                 ,''
                 )
          )"Max_HR(BPM)"
--     , MAX(DECODE(B.EXAMCODE
--                 ,'SM3750'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
--                        )
--                 ,'BS2401'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
--                        )
--                 ,''
--                 )
--          )
--       ||
--       MAX(DECODE(B.EXAMCODE
--                 ,'SM3750'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
--                        )
--                 ,'BS2401'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
--                        )
--                 ,''
--                 )
--          ) "Resting BP(mmhg)"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,''
                 )
          )
                   ,'/'
                   )-1
          ) "Resting BP(mmhg)_SBP"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,''
                 )
          )
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgMaximalBP:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'RestingBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')+11
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg최대혈압')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'안정시혈압:')-11
                        )
                 ,''
                 )
          )
                   ,'/'
                   )+1
          ) "Resting BP(mmhg)_DBP"
--     , MAX(DECODE(B.EXAMCODE
--                 ,'SM3750'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
--                        )
--                 ,'BS2401'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
--                        )
--                 ,''
--                 )
--          )
--       ||
--       MAX(DECODE(B.EXAMCODE
--                 ,'SM3750'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
--                        )
--                 ,'BS2401'
--                 ,SUBSTR(
--                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
--                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
--                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
--                        )
--                 ,''
--                 )
--          ) "Max BP(mmhg)"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,''
                 )
          )
             ,1
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,''
                 )
          )
                   ,'/'
                   )-1
          ) "Max BP(mmhg)_SBP"
     , SUBSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,''
                 )
          )
             ,INSTR(
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHgTotal')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'MaximalBP:')-10
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')+9
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'mmHg운동지속시간:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'최대혈압:')-9
                        )
                 ,''
                 )
          )
                   ,'/'
                   )+1
          ) "Max BP(mmhg)_DBP"
     , MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'VO2peak:')+8
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ml/kg/min(')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'VO2peak:')-8
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'VO2peak:')+8
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ml/kg/min(')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'VO2peak:')-8
                        )
                 ,''
                 )
          ) "VO2peak"
     , MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ml/kg/min(')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'METs)')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ml/kg/min(')-10
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ml/kg/min(')+10
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'METs)')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'ml/kg/min(')-10
                        )
                 ,''
                 )
          ) "METs"
     , MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TotalExerciseTime:')+18
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'REASONFORENDINGTEST')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TotalExerciseTime:')-18
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TotalExerciseTime:')+18
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'REASONFORENDINGTEST')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'TotalExerciseTime:')-18
                        )
                 ,''
                 )
          )
       ||
       MAX(DECODE(B.EXAMCODE
                 ,'SM3750'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'운동지속시간:')+13
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'운동중지이유:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'운동지속시간:')-13
                        )
                 ,'BS2401'
                 ,SUBSTR(
                         REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),'')
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'운동지속시간:')+13
                        ,INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'운동중지이유:')-
                         INSTR(REPLACE(REPLACE(REPLACE(TO_CHAR(B.RSLTTEXT),CHR(13),''),CHR(10),''),CHR(32),''),'운동지속시간:')-13
                        )
                 ,''
                 )
          ) "Total exercise time"
     , MAX(DECODE(B.EXAMCODE,'SM3750',TO_CHAR(B.RSLTTEXT)
                            ,'BS2401',TO_CHAR(B.RSLTTEXT),'')) "Treadmill TEST"
     , MAX(DECODE(B.EXAMCODE,'SM0661',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1),'')) "baPWV:Rt"
     , MAX(DECODE(B.EXAMCODE,'SM0661',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1),'')) "baPWV:Lt"
     , MAX(DECODE(B.EXAMCODE,'SM066101',TO_CHAR(B.RSLTTEXT),'')) "PWV"
     , MAX(DECODE(B.EXAMCODE,'SM0662',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1),'')) "ABI:Rt"
     , MAX(DECODE(B.EXAMCODE,'SM0662',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1),'')) "ABI:Lt"
     , MAX(DECODE(B.EXAMCODE,'SM066201',TO_CHAR(B.RSLTTEXT),'')) "ABI"
     , MAX(DECODE(B.EXAMCODE,'SM0401',B.RSLTNUM,''))    "FVC(L)"
     , MAX(DECODE(B.EXAMCODE,'SM040101',B.RSLTNUM,''))  "노력성폐활량(%)"
     , MAX(DECODE(B.EXAMCODE,'SM0402',B.RSLTNUM,''))    "FEV 1(L)"
     , MAX(DECODE(B.EXAMCODE,'SM040201',B.RSLTNUM,''))  "1초간노력성호기량(%)"
     , MAX(DECODE(B.EXAMCODE,'SM0403',B.RSLTNUM,''))    "FEV 1 / FVC(%)"
     , MAX(DECODE(B.EXAMCODE,'SM0404',B.RSLTNUM,''))    "FEF 25-75%(L/sec)"
     , MAX(DECODE(B.EXAMCODE,'SM040401',B.RSLTNUM,''))  "노력성호기중간유량(%)"
     , MAX(DECODE(B.EXAMCODE,'SM0405',B.RSLTNUM,''))    "PEF(L/sec)"
     , MAX(DECODE(B.EXAMCODE,'SM040501',B.RSLTNUM,''))  "최고호기유속(%)"
     , MAX(DECODE(B.EXAMCODE,'SM0450',TO_CHAR(B.RSLTTEXT),'')) "PFT"
     , MAX(DECODE(B.EXAMCODE,'SM2001',TO_CHAR(B.RSLTTEXT),'')) "Dental exam"
     , MAX(DECODE(B.EXAMCODE,'SM0205',SUBSTR(B.RSLTNUM,1,INSTR(B.RSLTNUM,'/')-1))) "Intraocular pressure_R"
     , MAX(DECODE(B.EXAMCODE,'SM0205',SUBSTR(B.RSLTNUM,INSTR(B.RSLTNUM,'/')+1))) "Intraocular pressure_L"
     , MAX(DECODE(B.EXAMCODE,'SM0210',TO_CHAR(B.RSLTTEXT),'')) "Fundoscopy"
     , MAX(DECODE(B.EXAMCODE,'BS4100',TO_CHAR(B.RSLTTEXT),'')) "EGD"
     , MAX(DECODE(B.EXAMCODE,'BP1A01A',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A151A',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A151B',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A151C',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A151D',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A151E',TO_CHAR(B.RSLTTEXT)
                                                         ,'')) "EGD_Bx"
     , MAX(DECODE(B.EXAMCODE,'BS4141',TO_CHAR(B.RSLTTEXT),'')) "Colonoscopy"
     , MAX(DECODE(B.EXAMCODE,'BP1A01B',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A152A',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A152B',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A152C',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A152D',TO_CHAR(B.RSLTTEXT)
                            ,'BP1A152E',TO_CHAR(B.RSLTTEXT)
                                                         ,'')) "Colonoscopy_Bx"
  FROM (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A, SMPKGMST B
         WHERE A.ORDDATE BETWEEN TO_DATE('20120228','YYYYMMDD') AND TO_DATE('20120302','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
     , STRESULT B
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
   AND NVL(B.MODIFYYN,'N') != 'Y'
   AND EXISTS (-- 건진처방 결과만 가져오기
               SELECT 'Y'
                 FROM MMEXMORT X
                WHERE B.PATNO = X.PATNO
                  AND B.ORDDATE = X.ORDDATE
                  AND B.ORDSEQNO = X.ORDSEQNO
                  AND X.PATFG = 'G'
              )
 GROUP BY A.PATNO, A.ORDDATE

-- 영양소분석값
SELECT A.PATNO, A.ORDDATE
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
          FROM SMRSV00T A, SMPKGMST B
         WHERE A.ORDDATE BETWEEN TO_DATE('19940101','YYYYMMDD') AND TO_DATE('20140630','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
     , SMFOODRT C
 WHERE A.PATNO = C.PATNO
   AND A.ORDDATE = C.ORDDATE
 GROUP BY A.PATNO, A.ORDDATE;

-- 코딩북에 따른 의학문진결과
SELECT /* INDEX(F SMQUESAT_PK) */
       A.PATNO, A.ORDDATE
--     , CASE WHEN LENGTH(SUBSTR(F.PATNO,1,5)||((789+SUBSTR(F.PATNO,6))||SUBSTR(F.PATNO,6))) = '11'
--            THEN '0'||SUBSTR(F.PATNO,1,5)||((789+SUBSTR(F.PATNO,6))||SUBSTR(F.PATNO,6))
--       ELSE SUBSTR(F.PATNO,1,5)||((789+SUBSTR(F.PATNO,6))||SUBSTR(F.PATNO,6)) END PATNO2
     , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1014C010Y','1'
                                                                    ,'1014C011Y','2'
                                                                    ,'1014C012Y','3'
                                                                    ,'1014C013Y','4'
                                                                    ,'1014C014Y','5','')) "Marriage"
     , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1015C015Y',F.QCODENM
                                                                    ,'1015C016Y',F.QCODENM
                                                                    ,'1015C017Y',F.QCODENM
                                                                    ,'1015C018Y',F.QCODENM
                                                                    ,'1015C019Y',F.QCODENM
                                                                    ,'1015C020Y',F.QCODENM,'')) "Education"
       , DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021C008Y','Y','0'))||  -- 과거
                MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211024C008Y','Y'
                                                                             ,'1036C008Y','Y'
                                                                             ,'10211024A005Y','S'
                                                                             ,'1036C236Y','S'
                                                                             ,'1021C027Y','N'
                                                                             ,'1036C027Y','N'
                                                                             ,'0')) -- 현재
                                                                             ,'0S','PAST'
                                                                             ,'0N','NONE'
                                                                             ,'YN','오류'
                                                                             ,'0Y','CURRENT'
                                                                             ,'YY','CURRENT'
                                                                             ,'Y0','PAST'
                                                                             ,'YS','PAST'
                                                                             ,'')                                       DRINKYN        -- 구문진_음주여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'3-0-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-0-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             NEW_DRINKYN    -- 신문진_음주여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T005',F.ACODE1
                                                                      ,''))                                             DRINK_STARTYEAR-- 음주시작연령
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T006',F.ACODE1
                                                                      ,'3-1T',F.ACODE1
                                                                      ,''))                                             DRINK_YEAR     -- 음주기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y','1'
                                                                      ,'10211022C029Y','2'
                                                                      ,'10211022C030Y','3'
                                                                      ,'10211022C031Y','4'
                                                                      ,'10211022C032Y','5'
                                                                      ,'10211022C033Y','6' -- 정밀
                                                                      ,'10361022C028Y','1'
                                                                      ,'10361022C029Y','2'
                                                                      ,'10361022C030Y','3'
                                                                      ,'10361022C031Y','4'
                                                                      ,'10361022C032Y','5'
                                                                      ,'10361022C033Y','6' -- 재진
                                                                      ,'3-2-1CY','1'
                                                                      ,'3-2-2CY','2'
                                                                      ,'3-2-3CY','3'
                                                                      ,'3-2-4CY','4'
                                                                      ,'3-2-5CY','5'
                                                                      ,'3-2-6CY','6'
                                                                      ,''))                                             DRINK_NUM      -- 음주횟수
      , DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019C008Y','Y','0'))||  -- 과거
               MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10191020C008Y','Y'
                                                                            ,'1035C008Y','Y'
                                                                            ,'2-0-3CY','Y'
                                                                            ,'10191020A005Y','S'
                                                                            ,'1035C236Y','S'
                                                                            ,'2-0-2CY','S'
                                                                            ,'1019C026Y','N'
                                                                            ,'1035C026Y','N'
                                                                            ,'2-0-1CY','N'
                                                                            ,'0')) -- 현재
                                                                            ,'0S','1'
                                                                            ,'0N','0'
                                                                            ,'YN',''
                                                                            ,'0Y','2'
                                                                            ,'YY','2'
                                                                            ,'Y0','1'
                                                                            ,'YS','1'
                                                                            ,'')                                        SMOKEYN        -- 흡연여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T003',F.ACODE1
                                                                      ,'2-2T',F.ACODE1
                                                                      ,''))                                             SMOKE_YEAR     -- 흡연기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T002',F.ACODE1
                                                                      ,'2-1T',F.ACODE1
                                                                      ,''))                                             SMOKE_START_YEAR     -- 흡연시작나이
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T004',F.ACODE1||'개비'
                                                                      ,'1035T004',F.ACODE1||'개비'
                                                                      ,'1035T004Y',F.ACODE1||'개비'
                                                                      ,'2-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             SMOKE_AMT      -- 흡연량
      , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'4-0-1CY'   ,'1'
                                                 ,'1025C008Y' ,'1'
                                                 ,'4-0-2CY'   ,'0'
                                                 ,'1025C009Y' ,'0'
                                                 ,'4-0-3CY'   ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   "adverse_drug_event"
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-1CY'   ,'1'
                                                           ,'10251026C043Y','1'
                                                                                            ,''))                  "adverse_drug_aspirinNSAID" --'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-2CY'   ,SUBSTR(F.QCODENM,3)
                                                           ,'10251026C039Y','1'
                                                           ,'10251026C040Y','1'
                                                                                            ,''))                  "adverse_drug_antibiotics"--'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-3CY'   ,SUBSTR(F.QCODENM,3)--'1'
                                                           ,'10251026C041Y','1'
                                                                                            ,''))                  "adverse_drug_contrastagent"--'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-4CY'   ,SUBSTR(F.QCODENM,3)
                                                           ,'10251026C042Y','1'
                                                                                            ,''))                  "adverse_drug_local"--'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-5CY'   ,SUBSTR(F.QCODENM,3)
                                                           ,'10251026C044Y','1'
                                                                                            ,''))                  "adverse_drug_etc"--'1'
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017C008Y',F.QCODENM
                                                                      ,'1017C009Y',F.QCODENM,''))                       EXEC_YN        -- 구문진_운동여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171018C029Y','0'
                                                                      ,'10171018C030Y','2'
                                                                      ,'10171018C031Y','3'
                                                                      ,'10171018C032Y','4'
                                                                      ,'10171018C033Y','4'
                                                                      ,''))                                             EXEC_AMT       -- 구문진_운동횟수
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C217Y',F.QCODENM,''))     EXEC_TYP01       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C218Y',F.QCODENM,''))     EXEC_TYP02       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C219Y',F.QCODENM,''))     EXEC_TYP03       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C220Y',F.QCODENM,''))     EXEC_TYP04       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C221Y',F.QCODENM,''))     EXEC_TYP05       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C222Y',F.QCODENM,''))     EXEC_TYP06       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C223Y',F.QCODENM,''))     EXEC_TYP07       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041A011Y',F.QCODENM,''))     EXEC_TYP08       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C250Y',F.QCODENM,''))     EXEC_TYP09       -- 구문진_운동종류
       , DECODE(SUBSTR(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE2,''))||'hr'||-- EXEC_HOUR
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE1,''))||'mn'|| -- EXEC_MIN
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171042C227Y',F.QCODENM
                                                                                    ,'10171042C228Y',F.QCODENM
                                                                                    ,'10171042C229Y',F.QCODENM
                                                                                    ,'10171042C225Y',F.QCODENM
                                                                                    ,'10171042C226Y',F.QCODENM
                                                                                    ,'')),1,4)
               ,'hrmn'
               ,SUBSTR(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE2,''))||'hr'||-- EXEC_HOUR
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE1,''))||'mn'|| -- EXEC_MIN
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171042C227Y',F.QCODENM
                                                                                    ,'10171042C228Y',F.QCODENM
                                                                                    ,'10171042C229Y',F.QCODENM
                                                                                    ,'10171042C225Y',F.QCODENM
                                                                                    ,'10171042C226Y',F.QCODENM
                                                                                    ,'')),5)
               ,MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE2,''))||'hr'||-- EXEC_HOUR
                MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE1,''))||'mn')           EXEC_TIME      -- 구문진_운동시간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-0-1CY','3'
                                                                      ,'5-0-2CY','2'
                                                                      ,'5-0-3CY','1'
                                                                      ,'5-0-4CY','0'
                                                                      ,''))                                             NEW_EXEC_YN    -- 신문진_운동여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-1-1CY','0' -- 신문진 운동횟수구분 '없다'
                                                                      ,'5-1-2CY','2' -- 신문진 운동횟수구분
                                                                      ,'5-1-3CY','3'
                                                                      ,'5-1-4CY','4'
                                                                      ,''))                                             NEW_EXEC_AMT   -- 신문진_운동횟수
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-2-1CY','0' -- 신문진 운동횟수구분 '없다'
                                                                      ,'5-2-2CY','1' -- 신문진 운동횟수구분
                                                                      ,'5-2-3CY','2'
                                                                      ,'5-2-4CY','3'
                                                                      ,'5-2-5CY','5'
                                                                      ,''))                                             NEW_EXEC_TIME  -- 신문진_운동시간
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-1-1CY',G.FOODBASEQTY
--                                                  ,'24-1-2CY',G.FOODBASEQTY
--                                                  ,'24-1-3CY',G.FOODBASEQTY
--                                                  ,'24-1-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_01
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-2-1CY',G.FOODBASEQTY
--                                                  ,'24-2-2CY',G.FOODBASEQTY
--                                                  ,'24-2-3CY',G.FOODBASEQTY
--                                                  ,'24-2-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_02
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-3-1CY',G.FOODBASEQTY
--                                                  ,'24-3-2CY',G.FOODBASEQTY
--                                                  ,'24-3-3CY',G.FOODBASEQTY
--                                                  ,'24-3-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_03
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-4-1CY',G.FOODBASEQTY
--                                                  ,'24-4-2CY',G.FOODBASEQTY
--                                                  ,'24-4-3CY',G.FOODBASEQTY
--                                                  ,'24-4-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_04
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-5-1CY',G.FOODBASEQTY
--                                                  ,'24-5-2CY',G.FOODBASEQTY
--                                                  ,'24-5-3CY',G.FOODBASEQTY
--                                                  ,'24-5-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_05
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-6-1CY',G.FOODBASEQTY
--                                                  ,'24-6-2CY',G.FOODBASEQTY
--                                                  ,'24-6-3CY',G.FOODBASEQTY
--                                                  ,'24-6-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_06
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-7-1CY',G.FOODBASEQTY
--                                                  ,'24-7-2CY',G.FOODBASEQTY
--                                                  ,'24-7-3CY',G.FOODBASEQTY
--                                                  ,'24-7-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_07
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-8-1CY',G.FOODBASEQTY
--                                                  ,'24-8-2CY',G.FOODBASEQTY
--                                                  ,'24-8-3CY',G.FOODBASEQTY
--                                                  ,'24-8-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_08
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-9-1CY',G.FOODBASEQTY
--                                                  ,'24-9-2CY',G.FOODBASEQTY
--                                                  ,'24-9-3CY',G.FOODBASEQTY
--                                                  ,'24-9-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_09
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-10-1CY',G.FOODBASEQTY
--                                                  ,'24-10-2CY',G.FOODBASEQTY
--                                                  ,'24-10-3CY',G.FOODBASEQTY
--                                                  ,'24-10-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_10
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-11-1CY',G.FOODBASEQTY
--                                                  ,'24-11-2CY',G.FOODBASEQTY
--                                                  ,'24-11-3CY',G.FOODBASEQTY
--                                                  ,'24-11-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_11
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-12-1CY',G.FOODBASEQTY
--                                                  ,'24-12-2CY',G.FOODBASEQTY
--                                                  ,'24-12-3CY',G.FOODBASEQTY
--                                                  ,'24-12-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_12
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-13-1CY',G.FOODBASEQTY
--                                                  ,'24-13-2CY',G.FOODBASEQTY
--                                                  ,'24-13-3CY',G.FOODBASEQTY
--                                                  ,'24-13-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_13
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-14-1CY',G.FOODBASEQTY
--                                                  ,'24-14-2CY',G.FOODBASEQTY
--                                                  ,'24-14-3CY',G.FOODBASEQTY
--                                                  ,'24-14-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_14
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-15-1CY',G.FOODBASEQTY
--                                                  ,'24-15-2CY',G.FOODBASEQTY
--                                                  ,'24-15-3CY',G.FOODBASEQTY
--                                                  ,'24-15-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_15
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-16-1CY',G.FOODBASEQTY
--                                                  ,'24-16-2CY',G.FOODBASEQTY
--                                                  ,'24-16-3CY',G.FOODBASEQTY
--                                                  ,'24-16-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_16
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-17-1CY',G.FOODBASEQTY
--                                                  ,'24-17-2CY',G.FOODBASEQTY
--                                                  ,'24-17-3CY',G.FOODBASEQTY
--                                                  ,'24-17-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_17
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-18-1CY',G.FOODBASEQTY
--                                                  ,'24-18-2CY',G.FOODBASEQTY
--                                                  ,'24-18-3CY',G.FOODBASEQTY
--                                                  ,'24-18-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_18
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-1-1CY',G.FOODBASEQTY
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
                                                  ,''))                                                                 stress_totalSCORE--PWI_SF_18
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-20-1CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-2CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-3CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-4CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-5CY',SUBSTR(F.QCODENM,3)
                                                  ,''))                                                                 stress_home
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-19-1CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-2CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-3CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-4CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-5CY',SUBSTR(F.QCODENM,3)
                                                  ,''))                                                                 stress_social
      , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5002A007Y',F.ACODE1
                                                 ,'20-0-1CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-2CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-3CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-4CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-5CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-6CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-7CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-8CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-9CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-10CY' ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   MENS_START
      , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5007C008Y' ,'1'
                                                 ,'5007C009Y' ,'2'
                                                 ,'5007C201Y' ,'4'
                                                 ,'5007C202Y' ,'3'
                                                 ,'21-0-1CY'  ,'1'
                                                 ,'21-0-2CY'  ,'2'
                                                 ,'21-0-3CY'  ,'3'
                                                 ,'21-0-4CY'  ,'4'
                                                 ,''))                                                   MENOPAUSEYN
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075008C203Y','1'
                                                           ,'50075008C204Y','2,3'
                                                           ,'50075008C205Y','2,3'
                                                           ,'50075008C206Y','4'
                                                           ,'50075008C038Y','4'
                                                           ,'21-2-1CY'  ,'1'
                                                           ,'21-2-2CY'  ,'2'
                                                           ,'21-2-3CY'  ,'3'
                                                           ,'21-2-4CY'  ,'4'
                                                           ,'21-2-5CY'  ,'4'
                                                           ,''))                                                   MENOPAUSE_CAUSE
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075009C008Y','Y'
                                                           ,'50075009C009Y','N'
                                                           ,''))                                                   FHORMONECARE_YN
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075009T202',DECODE(F.ACODE2||'년','년','',F.ACODE2||'년')||DECODE(F.ACODE1||'개월','개월','',F.ACODE1||'개월')
            /*   구,신문진 결과가 달라 매치할 수 없음    */,'50075009T202Y',DECODE(F.ACODE2||'년','년','',F.ACODE2||'년')||DECODE(F.ACODE1||'개월','개월','',F.ACODE1||'개월')
                                                           ,'22-1-1CY'  ,SUBSTR(F.QCODENM,3)--'1'
                                                           ,'22-1-2CY'  ,SUBSTR(F.QCODENM,3)--'2'
                                                           ,'22-1-3CY'  ,SUBSTR(F.QCODENM,3)--'3'
                                                           ,'22-1-4CY'  ,SUBSTR(F.QCODENM,3)--'4'
                                                           ,'22-1-5CY'  ,SUBSTR(F.QCODENM,3)--'5'
                                                           ,''))                                                   FHORMONECARE_YEAR
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'500750095010C008Y',F.QCODENM
                                                                     ,'500750095010A005Y',F.QCODENM
                                                                     ,'500750095010C236Y',F.QCODENM
                                                                     ,'22-2-1CY'  ,SUBSTR(F.QCODENM,3)
                                                                     ,'22-2-2CY'  ,SUBSTR(F.QCODENM,3)
                                                                     ,''))                                                   FHORMONECARE_ING
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115012C208Y',F.QCODENM--'0'
                                                 ,'50115012A002Y',F.ACODE1
                                                 ,'23-1-1CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-2CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-3CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-4CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-5CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-6CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-7CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-8CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-9CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-10CY' ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   DELIVERY_NUM
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115014A004Y',F.ACODE1
                                                 ,'50115014A004',F.ACODE1
                                                 ,'23-3-3CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-4CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-5CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-6CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-7CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-8CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-9CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-10CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-11CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-12CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,''))                                                   SPONTANEOUS_ABORTION_NUM
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115014A004Y',F.ACODE2
                                                 ,'50115014A004',F.ACODE2
                                                 ,'23-3-13CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-14CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-15CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-16CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-17CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-18CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-19CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-20CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-21CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-22CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,''))                                                   INDUCED_ABROTION_NUM
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115013A003Y',F.ACODE1
                                                 ,'50115013A003',F.ACODE1
                                                 ,'23-4-3CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-4CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-5CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-6CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-7CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-8CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-9CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-10CY' ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-11CY' ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-12CY' ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   PRETERM_BIRTH_NUM
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-1-0CY','0'
--                                                  ,'19-1-1CY','1'
--                                                  ,'19-1-2CY','2'
--                                                  ,'19-1-3CY','3'
--                                                  ,'19-1-4CY','4'
--                                                  ,'19-1-5CY','5'
--                                                  ,''))                "IPSS_01"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-2-0CY','0'
--                                                  ,'19-2-1CY','1'
--                                                  ,'19-2-2CY','2'
--                                                  ,'19-2-3CY','3'
--                                                  ,'19-2-4CY','4'
--                                                  ,'19-2-5CY','5'
--                                                  ,''))                "IPSS_02"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-3-0CY','0'
--                                                  ,'19-3-1CY','1'
--                                                  ,'19-3-2CY','2'
--                                                  ,'19-3-3CY','3'
--                                                  ,'19-3-4CY','4'
--                                                  ,'19-3-5CY','5'
--                                                  ,''))                "IPSS_03"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-4-0CY','0'
--                                                  ,'19-4-1CY','1'
--                                                  ,'19-4-2CY','2'
--                                                  ,'19-4-3CY','3'
--                                                  ,'19-4-4CY','4'
--                                                  ,'19-4-5CY','5'
--                                                  ,''))                "IPSS_04"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-5-0CY','0'
--                                                  ,'19-5-1CY','1'
--                                                  ,'19-5-2CY','2'
--                                                  ,'19-5-3CY','3'
--                                                  ,'19-5-4CY','4'
--                                                  ,'19-5-5CY','5'
--                                                  ,''))                "IPSS_05"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-6-0CY','0'
--                                                  ,'19-6-1CY','1'
--                                                  ,'19-6-2CY','2'
--                                                  ,'19-6-3CY','3'
--                                                  ,'19-6-4CY','4'
--                                                  ,'19-6-5CY','5'
--                                                  ,''))                "IPSS_06"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-7-0CY','0'
--                                                  ,'19-7-1CY','1'
--                                                  ,'19-7-2CY','2'
--                                                  ,'19-7-3CY','3'
--                                                  ,'19-7-4CY','4'
--                                                  ,'19-7-5CY','5'
--                                                  ,''))                "IPSS_07"
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-1-0CY','0'
                                                  ,'19-1-1CY','1'
                                                  ,'19-1-2CY','2'
                                                  ,'19-1-3CY','3'
                                                  ,'19-1-4CY','4'
                                                  ,'19-1-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-2-0CY','0'
                                                  ,'19-2-1CY','1'
                                                  ,'19-2-2CY','2'
                                                  ,'19-2-3CY','3'
                                                  ,'19-2-4CY','4'
                                                  ,'19-2-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-3-0CY','0'
                                                  ,'19-3-1CY','1'
                                                  ,'19-3-2CY','2'
                                                  ,'19-3-3CY','3'
                                                  ,'19-3-4CY','4'
                                                  ,'19-3-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-4-0CY','0'
                                                  ,'19-4-1CY','1'
                                                  ,'19-4-2CY','2'
                                                  ,'19-4-3CY','3'
                                                  ,'19-4-4CY','4'
                                                  ,'19-4-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-5-0CY','0'
                                                  ,'19-5-1CY','1'
                                                  ,'19-5-2CY','2'
                                                  ,'19-5-3CY','3'
                                                  ,'19-5-4CY','4'
                                                  ,'19-5-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-6-0CY','0'
                                                  ,'19-6-1CY','1'
                                                  ,'19-6-2CY','2'
                                                  ,'19-6-3CY','3'
                                                  ,'19-6-4CY','4'
                                                  ,'19-6-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-7-0CY','0'
                                                  ,'19-7-1CY','1'
                                                  ,'19-7-2CY','2'
                                                  ,'19-7-3CY','3'
                                                  ,'19-7-4CY','4'
                                                  ,'19-7-5CY','5'
                                                  ,''))                "IPSS_score"
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-8-0CY','0'
                                                  ,'19-8-1CY','1'
                                                  ,'19-8-2CY','2'
                                                  ,'19-8-3CY','3'
                                                  ,'19-8-4CY','4'
                                                  ,'19-8-5CY','5'
                                                  ,'19-8-6CY','6'
                                                  ,''))                  "Prostate_satisfactioninlife"
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-7-0CY','0'
                                                  ,'19-7-1CY','1'
                                                  ,'19-7-2CY','2'
                                                  ,'19-7-3CY','3'
                                                  ,'19-7-4CY','4'
                                                  ,'19-7-5CY','5'
                                                  ,''))                  "nocturia"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'10-0-2CY','1','')) "GI_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'10-0-5CY','1'
                                                ,'3002C072Y','1'
                                                ,'3002C073Y','1'
                                                ,'3002C072','1'
                                                ,'3002C073','1'
                                                ,''))                "GI_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'10-0-4CY','1','')) "GI_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-1CY','1'
                                                ,'3004C112Y','1'
                                                ,''))                "Respiratory_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-2CY','1'
                                                ,'3004C113Y','1'
                                                ,''))                "Respiratory_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-3CY','1'
                                                ,'3004C114Y','1'
                                                ,''))                "Respiratory_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-4CY','1'
                                                ,''))                "Respiratory_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-5CY','1'
                                                ,'3004C117Y','1'
                                                ,''))                "Respiratory_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-2CY','1'
                                                ,'3006C125Y','1'
                                                ,''))                "GU_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-3CY','1'
                                                ,'3006C126Y','1'
                                                ,''))                "GU_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-8CY','1'
                                                ,'3006C129Y','1'
                                                ,''))                "GU_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-10CY','1'
                                                ,'3005C124Y','1'
                                                ,''))                "GU_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-1CY','1'
                                                ,''))                "TOOTH_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-2CY','1'
                                                ,'3009C145Y','1'
                                                ,''))                "TOOTH_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-3CY','1'
                                                ,'3009C147Y','1'
                                                ,''))                "TOOTH_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-6CY','1'
                                                ,'3009C149Y','1'
                                                ,''))                "TOOTH_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-5CY','1'
                                                ,''))                "TOOTH_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'13-0-1CY','1'
                                                ,'3003C107Y','1'
                                                ,''))                "CHEST_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'13-0-2CY','1'
                                                ,'3003C108Y','1'
                                                ,''))                "CHEST_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'13-0-3CY','1'
                                                ,'3003C109Y','1'
                                                ,''))                "CHEST_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-1CY','1'
                                                ,'3007C131Y','1'
                                                ,''))                "NEURO_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-2CY','1'
                                                ,'3001C061Y','1'
                                                ,''))                "NEURO_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-3CY','1'
                                                ,'3007C132Y','1'
                                                ,''))                "NEURO_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-5CY','1'
                                                ,'3007C134Y','1'
                                                ,''))                "NEURO_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-8CY','1'
                                                ,''))                "NEURO_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-7CY','1'
                                                ,'3007C131Y','1'
                                                ,''))                "NEURO_06"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-6CY','1'
                                                ,'3007C135Y','1'
                                                ,''))                "NEURO_07"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-9CY','1'
                                                ,''))                "NEURO_08"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-1CY','1'
                                                ,'3001C057Y','1'
                                                ,''))                "Etc_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-2CY','1'
                                                ,'3001C058Y','1'
                                                ,''))                "Etc_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-3CY','1'
                                                ,''))                "Etc_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-5CY','1'
                                                ,''))                "Etc_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-7CY','1'
                                                ,'3008C138Y','1'
                                                ,''))                "Etc_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-8CY','1'
                                                ,''))                "Etc_06"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-9CY','1'
                                                ,'3008C139Y','1'
                                                ,''))                "Etc_07"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-13CY','1'
                                                ,'3008C143Y','1'
                                                ,''))                "Etc_08"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A101Y','Y',''))   "Hx_천식/알레르기"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A106Y','Y',''))   "Hx_협심증/심근경색"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A108Y','Y',''))   "Hx_위염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A109Y','Y',''))   "Hx_장염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A111Y','Y',''))   "Hx_치질"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A112Y','Y',''))   "Hx_급성간염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A113Y','Y',''))   "Hx_만성간염/간경화"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A115Y','Y',''))   "Hx_담석/담낭염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A116Y','Y',''))   "Hx_신장질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A117Y','Y',''))   "Hx_방광질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A118Y','Y',''))   "Hx_갑상선질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A120Y','Y',''))   "Hx_자궁근종"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A121Y','Y',''))   "Hx_자궁경부염증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A122Y','Y',''))   "Hx_허리디스크"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A102Y','Y'
                                                ,'6-1-1-1CY','Y'
                                                ,'6-1-1-2CY','Y'
                                                ,'6-1-1-3CY','Y'
                                                ,'6-1-1-4CY','Y'
                                                ,'6-1-1-5CY','Y'
                                                                ,''))   "Hx_고혈압"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A105Y','Y'
                                                ,'6-1-2-1CY','Y'
                                                ,'6-1-2-2CY','Y'
                                                ,'6-1-2-3CY','Y'
                                                ,'6-1-2-4CY','Y'
                                                ,'6-1-2-5CY','Y'
                                                                ,''))   "Hx_당뇨병"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A103Y','Y'
                                                ,'6-1-3-1CY','Y'
                                                ,'6-1-3-2CY','Y'
                                                ,'6-1-3-3CY','Y'
                                                ,'6-1-3-4CY','Y'
                                                ,'6-1-3-5CY','Y'
                                                                ,''))   "Hx_고지혈증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-4-1CY','Y'
                                                ,'6-1-4-2CY','Y'
                                                ,'6-1-4-3CY','Y'
                                                ,'6-1-4-4CY','Y'
                                                ,'6-1-4-5CY','Y'
                                                                ,''))   "Hx_협심증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-5-1CY','Y'
                                                ,'6-1-5-2CY','Y'
                                                ,'6-1-5-3CY','Y'
                                                ,'6-1-5-4CY','Y'
                                                ,'6-1-5-5CY','Y'
                                                                ,''))   "Hx_심근경색"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A104Y','Y'
                                                ,'6-1-6-1CY','Y'
                                                ,'6-1-6-2CY','Y'
                                                ,'6-1-6-3CY','Y'
                                                ,'6-1-6-4CY','Y'
                                                ,'6-1-6-5CY','Y'
                                                                ,''))   "Hx_뇌졸중/중풍"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-7-1CY','Y'
                                                ,'6-1-7-2CY','Y'
                                                ,'6-1-7-3CY','Y'
                                                ,'6-1-7-4CY','Y'
                                                ,'6-1-7-5CY','Y'
                                                                ,''))   "Hx_B형간염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-8-1CY','Y'
                                                ,'6-1-8-2CY','Y'
                                                ,'6-1-8-3CY','Y'
                                                ,'6-1-8-4CY','Y'
                                                ,'6-1-8-5CY','Y'
                                                                ,''))   "Hx_C형간염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-9-1CY','Y'
                                                ,'6-1-9-2CY','Y'
                                                ,'6-1-9-3CY','Y'
                                                ,'6-1-9-4CY','Y'
                                                ,'6-1-9-5CY','Y'
                                                                ,''))   "Hx_간경변"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A114Y','Y'
                                                ,'6-1-10-1CY','Y'
                                                ,'6-1-10-2CY','Y'
                                                ,'6-1-10-3CY','Y'
                                                ,'6-1-10-4CY','Y'
                                                ,'6-1-10-5CY','Y'
                                                                ,''))   "Hx_지방간"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A107Y','Y'
                                                ,'6-1-11-1CY','Y'
                                                ,'6-1-11-2CY','Y'
                                                ,'6-1-11-3CY','Y'
                                                ,'6-1-11-4CY','Y'
                                                ,'6-1-11-5CY','Y'
                                                                 ,''))   "Hx_위,십이지장궤양"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-12-1CY','Y'
                                                ,'6-1-12-2CY','Y'
                                                ,'6-1-12-3CY','Y'
                                                ,'6-1-12-4CY','Y'
                                                ,'6-1-12-5CY','Y'
                                                                 ,''))   "Hx_헬리코박터균"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A110Y','Y'
                                                ,'6-1-13-1CY','Y'
                                                ,'6-1-13-2CY','Y'
                                                ,'6-1-13-3CY','Y'
                                                ,'6-1-13-4CY','Y'
                                                ,'6-1-13-5CY','Y'
                                                                 ,''))   "Hx_대장폴립(용종)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-14-1CY','Y'
                                                ,'6-1-14-2CY','Y'
                                                ,'6-1-14-3CY','Y'
                                                ,'6-1-14-4CY','Y'
                                                ,'6-1-14-5CY','Y'
                                                                 ,''))   "Hx_만성폐쇄성폐질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-15-1CY','Y'
                                                ,'6-1-15-2CY','Y'
                                                ,'6-1-15-3CY','Y'
                                                ,'6-1-15-4CY','Y'
                                                ,'6-1-15-5CY','Y'
                                                                 ,''))   "Hx_천식"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A100Y','Y'
                                                ,'6-1-16-1CY','Y'
                                                ,'6-1-16-2CY','Y'
                                                ,'6-1-16-3CY','Y'
                                                ,'6-1-16-4CY','Y'
                                                ,'6-1-16-5CY','Y'
                                                                 ,''))   "Hx_결핵"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A119Y','Y'
                                                ,'6-1-17-1CY','Y'
                                                ,'6-1-17-2CY','Y'
                                                ,'6-1-17-3CY','Y'
                                                ,'6-1-17-4CY','Y'
                                                ,'6-1-17-5CY','Y'
                                                                 ,''))   "Hx_유방양성종양"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-18-1CY','Y'
                                                ,'6-1-18-2CY','Y'
                                                ,'6-1-18-3CY','Y'
                                                ,'6-1-18-4CY','Y'
                                                ,'6-1-18-5CY','Y'
                                                                 ,''))   "Hx_갑상선기능저하증및항진증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-19-1CY','Y'
                                                ,'6-1-19-2CY','Y'
                                                ,'6-1-19-3CY','Y'
                                                ,'6-1-19-4CY','Y'
                                                ,'6-1-19-5CY','Y'
                                                                ,''))   "Hx_갑상선결절및낭종"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-20-1CY','Y'
                                                ,'6-1-20-2CY','Y'
                                                ,'6-1-20-3CY','Y'
                                                ,'6-1-20-4CY','Y'
                                                ,'6-1-20-5CY','Y'
                                                                 ,''))   "Hx_신장및방광질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-21-1CY','Y'
                                                ,'6-1-21-2CY','Y'
                                                ,'6-1-21-3CY','Y'
                                                ,'6-1-21-4CY','Y'
                                                ,'6-1-21-5CY','Y'
                                                                 ,''))   "Hx_신장요로결석"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-22-1CY','Y'
                                                ,'6-1-22-2CY','Y'
                                                ,'6-1-22-3CY','Y'
                                                ,'6-1-22-4CY','Y'
                                                ,'6-1-22-5CY','Y'
                                                                 ,''))   "Hx_혈뇨"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-23-1CY','Y'
                                                ,'6-1-23-2CY','Y'
                                                ,'6-1-23-3CY','Y'
                                                ,'6-1-23-4CY','Y'
                                                ,'6-1-23-5CY','Y'
                                                                 ,''))   "Hx_백내장"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-24-1CY','Y'
                                                ,'6-1-24-2CY','Y'
                                                ,'6-1-24-3CY','Y'
                                                ,'6-1-24-4CY','Y'
                                                ,'6-1-24-5CY','Y'
                                                                 ,''))   "Hx_녹내장"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-25-1CY','Y'
                                                ,'6-1-25-2CY','Y'
                                                ,'6-1-25-3CY','Y'
                                                ,'6-1-25-4CY','Y'
                                                ,'6-1-25-5CY','Y'
                                                                 ,''))   "Hx_디스크(허리/목)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-27-1CY','Y'
                                                ,'6-1-27-2CY','Y'
                                                ,'6-1-27-3CY','Y'
                                                ,'6-1-27-4CY','Y'
                                                ,'6-1-27-5CY','Y'
                                                                 ,''))   "Hx_전립선비대증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-28-1CY','Y'
                                                ,'6-1-28-2CY','Y'
                                                ,'6-1-28-3CY','Y'
                                                ,'6-1-28-4CY','Y'
                                                ,'6-1-28-5CY','Y'
                                                                ,''))   "Hx_관절염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A154Y','Y','')) "PH_종합비타민"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A155Y','Y','')) "PH_비타민A"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A156Y','Y','')) "PH_비타민B"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A157Y','Y','')) "PH_비타민C"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A158Y','Y','')) "PH_비타민E"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A159Y','Y','')) "PH_베타카로테인"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A163Y','Y','')) "PH_개소주,흑염소"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A152Y','Y'
                                                ,'7-1-1-1CY','Y'
                                                ,'7-1-1-2CY','Y'
                                                                ,'')) "PH_혈압"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A153Y','Y'
                                                ,'7-1-2-1CY','Y'
                                                ,'7-1-2-2CY','Y'
                                                                ,'')) "PH_당뇨"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-3-1CY','Y'
                                                ,'7-1-3-2CY','Y'
                                                                ,'')) "PH_고지혈증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A150Y','Y'
                                                ,'7-1-4-1CY','Y'
                                                ,'7-1-4-2CY','Y'
                                                                ,'')) "PH_아스피린"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-5-1CY','Y'
                                                ,'7-1-5-2CY','Y'
                                                                ,'')) "PH_와파린"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-6-1CY','Y'
                                                ,'7-1-6-2CY','Y'
                                                                ,'')) "PH_기타혈전방지제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-7-1CY','Y'
                                                ,'7-1-7-2CY','Y'
                                                                ,'')) "PH_부정맥"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-8-1CY','Y'
                                                ,'7-1-8-2CY','Y'
                                                                ,'')) "PH_위장(조화제,제산제)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-9-1CY','Y'
                                                ,'7-1-9-2CY','Y'
                                                                ,'')) "PH_간장(간보호제)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-10-1CY','Y'
                                                ,'7-1-10-2CY','Y'
                                                                ,'')) "PH_변비"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A151Y','Y'
                                                ,'7-1-11-1CY','Y'
                                                ,'7-1-11-2CY','Y'
                                                                ,'')) "PH_소염진통제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-12-1CY','Y'
                                                ,'7-1-12-2CY','Y'
                                                                ,'')) "PH_갑상선치료"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-13-1CY','Y'
                                                ,'7-1-13-2CY','Y'
                                                                ,'')) "PH_골다공증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-14-1CY','Y'
                                                ,'7-1-14-2CY','Y'
                                                                ,'')) "PH_여성호르몬"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-15-1CY','Y'
                                                ,'7-1-15-2CY','Y'
                                                                ,'')) "PH_전립선비대증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A160Y','Y'
                                                ,'7-1-16-1CY','Y'
                                                ,'7-1-16-2CY','Y'
                                                                ,'')) "PH_칼슘"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A161Y','Y'
                                                ,'7-1-17-1CY','Y'
                                                ,'7-1-17-2CY','Y'
                                                                ,'')) "PH_철분"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A162Y','Y'
                                                ,'7-1-18-1CY','Y'
                                                ,'7-1-18-2CY','Y'
                                                                ,'')) "PH_수면제,항우울증약"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-19-1CY','Y'
                                                ,'7-1-19-2CY','Y'
                                                                ,'')) "PH_호흡기"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-20-1CY','Y'
                                                ,'7-1-20-2CY','Y'
                                                                ,'')) "PH_영양제및보조식품"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A164Y','Y'
                                                ,'7-1-21-1CY','Y'
                                                ,'7-1-21-2CY','Y'
                                                                ,'')) "PH_한약,보약"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-1CY','Y'
                                                ,'8-1-1-2CY','Y'
                                                ,'8-1-1-3CY','Y'
                                                ,'8-1-1-4CY','Y'
                                                                ,''))       "위암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-5T',F.ACODE1,''))  "위암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-1CY','Y'
                                                ,'8-1-2-2CY','Y'
                                                ,'8-1-2-3CY','Y'
                                                ,'8-1-2-4CY','Y'
                                                                ,''))      "폐암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-5T',F.ACODE1,''))  "폐암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-1CY','Y'
                                                ,'8-1-3-2CY','Y'
                                                ,'8-1-3-3CY','Y'
                                                ,'8-1-3-4CY','Y'
                                                                ,''))      "간암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-5T',F.ACODE1,''))  "간암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-1CY','Y'
                                                ,'8-1-4-2CY','Y'
                                                ,'8-1-4-3CY','Y'
                                                ,'8-1-4-4CY','Y'
                                                                ,''))      "대장암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-5T',F.ACODE1,''))  "대장암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-1CY','Y'
                                                ,'8-1-5-2CY','Y'
                                                ,'8-1-5-3CY','Y'
                                                ,'8-1-5-4CY','Y'
                                                                ,''))      "유방암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-5T',F.ACODE1,''))  "유방암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-1CY','Y'
                                                ,'8-1-6-2CY','Y'
                                                ,'8-1-6-3CY','Y'
                                                ,'8-1-6-4CY','Y'
                                                                ,''))      "자궁경부암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-5T',F.ACODE1,''))  "자궁경부암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-1CY','Y'
                                                ,'8-1-7-2CY','Y'
                                                ,'8-1-7-3CY','Y'
                                                ,'8-1-7-4CY','Y'
                                                                ,''))      "갑상선암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-5T',F.ACODE1,''))  "갑상선암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-1CY','Y'
                                                ,'8-1-8-2CY','Y'
                                                ,'8-1-8-3CY','Y'
                                                ,'8-1-8-4CY','Y'
                                                                ,''))      "방광암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-5T',F.ACODE1,''))  "방광암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-1CY','Y'
                                                ,'8-1-9-2CY','Y'
                                                ,'8-1-9-3CY','Y'
                                                ,'8-1-9-4CY','Y'
                                                                ,''))      "식도암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-5T',F.ACODE1,''))  "식도암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-1CY','Y'
                                                ,'8-1-10-2CY','Y'
                                                ,'8-1-10-3CY','Y'
                                                ,'8-1-10-4CY','Y'
                                                                ,''))       "담낭암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-5T',F.ACODE1,''))  "담낭암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-1CY','Y'
                                                ,'8-1-11-2CY','Y'
                                                ,'8-1-11-3CY','Y'
                                                ,'8-1-11-4CY','Y'
                                                                ,''))       "난소암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-5T',F.ACODE1,''))  "난소암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-1CY','Y'
                                                ,'8-1-12-2CY','Y'
                                                ,'8-1-12-3CY','Y'
                                                ,'8-1-12-4CY','Y'
                                                                ,''))       "전립선암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-5T',F.ACODE1,''))  "전립선암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-1CY','Y'
                                                ,'8-1-13-2CY','Y'
                                                ,'8-1-13-3CY','Y'
                                                ,'8-1-13-4CY','Y'
                                                                ,''))       "췌장암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-5T',F.ACODE1,''))  "췌장암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "결핵_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "결핵_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "결핵_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "결핵_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "결핵_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "결핵_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "결핵_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "결핵_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "심근경색_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "심근경색_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "심근경색_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "심근경색_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "심근경색_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "심근경색_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "심근경색_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "심근경색_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "협심증_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "협심증_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "협심증_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "협심증_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "협심증_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "협심증_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "협심증_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "협심증_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "심장기형_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "심장기형_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "심장기형_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "심장기형_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "심장기형_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "심장기형_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "심장기형_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "심장기형_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "언청이_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "언청이_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "언청이_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "언청이_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "언청이_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "언청이_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "언청이_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "언청이_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "기타선청기형_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "기타선청기형_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "기타선청기형_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "기타선청기형_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "기타선청기형_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "기타선청기형_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "기타선청기형_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "기타선청기형_외조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "간질환_부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "간질환_모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "간질환_형제"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "간질환_자녀"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "간질환_친조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "간질환_친조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "간질환_외조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "간질환_외조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "편두통_부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "편두통_모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "편두통_형제"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "편두통_자녀"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "편두통_친조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "편두통_친조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "편두통_외조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "편두통_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-1-1CY','Y'                                    ,'')) "고혈압_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-1-2CY','Y'                                    ,'')) "고혈압_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-1-3CY','Y'                                    ,'')) "고혈압_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-1-4CY','Y'                                    ,'')) "고혈압_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-1-5CY','Y'                                    ,'')) "고혈압_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-1-6CY','Y'                                    ,'')) "고혈압_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-1-7CY','Y'                                    ,'')) "고혈압_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-1-8CY','Y'                                    ,'')) "고혈압_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-2-1CY','Y'                                    ,'')) "당뇨병_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-2-2CY','Y'                                    ,'')) "당뇨병_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-2-3CY','Y'                                    ,'')) "당뇨병_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-2-4CY','Y'                                    ,'')) "당뇨병_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-2-5CY','Y'                                    ,'')) "당뇨병_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-2-6CY','Y'                                    ,'')) "당뇨병_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-2-7CY','Y'                                    ,'')) "당뇨병_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-2-8CY','Y'                                    ,'')) "당뇨병_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-1CY','Y'                                    ,'')) "심근경색/협심증_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-2CY','Y'                                    ,'')) "심근경색/협심증_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-3CY','Y'                                    ,'')) "심근경색/협심증_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-4CY','Y'                                    ,'')) "심근경색/협심증_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-5CY','Y'                                    ,'')) "심근경색/협심증_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-6CY','Y'                                    ,'')) "심근경색/협심증_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-7CY','Y'                                    ,'')) "심근경색/협심증_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-8CY','Y'                                    ,'')) "심근경색/협심증_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-4-1CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-4-2CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-4-3CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-4-4CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-4-5CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-4-6CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-4-7CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-4-8CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-5-1CY','Y'                                    ,'')) "치매_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-5-2CY','Y'                                    ,'')) "치매_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-5-3CY','Y'                                    ,'')) "치매_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-5-4CY','Y'                                    ,'')) "치매_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-5-5CY','Y'                                    ,'')) "치매_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-5-6CY','Y'                                    ,'')) "치매_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-5-7CY','Y'                                    ,'')) "치매_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-5-8CY','Y'                                    ,'')) "치매_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-6-1CY','Y'                                    ,'')) "만성간염또는간경변_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-6-2CY','Y'                                    ,'')) "만성간염또는간경변_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-6-3CY','Y'                                    ,'')) "만성간염또는간경변_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-6-4CY','Y'                                    ,'')) "만성간염또는간경변_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-6-5CY','Y'                                    ,'')) "만성간염또는간경변_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-6-6CY','Y'                                    ,'')) "만성간염또는간경변_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-6-7CY','Y'                                    ,'')) "만성간염또는간경변_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-6-8CY','Y'                                    ,'')) "만성간염또는간경변_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-1CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-2CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-3CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-4CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-5CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-6CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-7CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-8CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-8-1CY','Y'                                    ,'')) "위암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-8-2CY','Y'                                    ,'')) "위암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-8-3CY','Y'                                    ,'')) "위암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-8-4CY','Y'                                    ,'')) "위암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-8-5CY','Y'                                    ,'')) "위암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-8-6CY','Y'                                    ,'')) "위암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-8-7CY','Y'                                    ,'')) "위암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-8-8CY','Y'                                    ,'')) "위암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-9-1CY','Y'                                    ,'')) "폐암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-9-2CY','Y'                                    ,'')) "폐암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-9-3CY','Y'                                    ,'')) "폐암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-9-4CY','Y'                                    ,'')) "폐암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-9-5CY','Y'                                    ,'')) "폐암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-9-6CY','Y'                                    ,'')) "폐암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-9-7CY','Y'                                    ,'')) "폐암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-9-8CY','Y'                                    ,'')) "폐암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-1CY','Y'                                    ,'')) "간암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-2CY','Y'                                    ,'')) "간암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-3CY','Y'                                    ,'')) "간암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-4CY','Y'                                    ,'')) "간암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-5CY','Y'                                    ,'')) "간암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-6CY','Y'                                    ,'')) "간암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-7CY','Y'                                    ,'')) "간암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-8CY','Y'                                    ,'')) "간암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-11-1CY','Y'                                    ,'')) "대장암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-11-2CY','Y'                                    ,'')) "대장암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-11-3CY','Y'                                    ,'')) "대장암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-11-4CY','Y'                                    ,'')) "대장암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-11-5CY','Y'                                    ,'')) "대장암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-11-6CY','Y'                                    ,'')) "대장암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-11-7CY','Y'                                    ,'')) "대장암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-11-8CY','Y'                                    ,'')) "대장암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-12-1CY','Y'                                    ,'')) "유방암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-12-2CY','Y'                                    ,'')) "유방암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-12-3CY','Y'                                    ,'')) "유방암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-12-4CY','Y'                                    ,'')) "유방암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-12-5CY','Y'                                    ,'')) "유방암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-12-6CY','Y'                                    ,'')) "유방암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-12-7CY','Y'                                    ,'')) "유방암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-12-8CY','Y'                                    ,'')) "유방암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-13-1CY','Y'                                    ,'')) "자궁암/자궁경부암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-13-2CY','Y'                                    ,'')) "자궁암/자궁경부암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-13-3CY','Y'                                    ,'')) "자궁암/자궁경부암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-13-4CY','Y'                                    ,'')) "자궁암/자궁경부암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-13-5CY','Y'                                    ,'')) "자궁암/자궁경부암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-13-6CY','Y'                                    ,'')) "자궁암/자궁경부암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-13-7CY','Y'                                    ,'')) "자궁암/자궁경부암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-13-8CY','Y'                                    ,'')) "자궁암/자궁경부암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-1CY','Y'                                    ,'')) "갑상선암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-2CY','Y'                                    ,'')) "갑상선암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-3CY','Y'                                    ,'')) "갑상선암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-4CY','Y'                                    ,'')) "갑상선암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-5CY','Y'                                    ,'')) "갑상선암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-6CY','Y'                                    ,'')) "갑상선암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-7CY','Y'                                    ,'')) "갑상선암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-8CY','Y'                                    ,'')) "갑상선암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-1CY','Y'                                    ,'')) "방광암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-2CY','Y'                                    ,'')) "방광암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-3CY','Y'                                    ,'')) "방광암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-4CY','Y'                                    ,'')) "방광암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-5CY','Y'                                    ,'')) "방광암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-6CY','Y'                                    ,'')) "방광암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-7CY','Y'                                    ,'')) "방광암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-8CY','Y'                                    ,'')) "방광암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-1CY','Y'                                    ,'')) "식도암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-2CY','Y'                                    ,'')) "식도암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-3CY','Y'                                    ,'')) "식도암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-4CY','Y'                                    ,'')) "식도암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-5CY','Y'                                    ,'')) "식도암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-6CY','Y'                                    ,'')) "식도암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-7CY','Y'                                    ,'')) "식도암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-8CY','Y'                                    ,'')) "식도암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-1CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-2CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-3CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-4CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-5CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-6CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-7CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-8CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-1CY','Y'                                    ,'')) "난소암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-2CY','Y'                                    ,'')) "난소암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-3CY','Y'                                    ,'')) "난소암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-4CY','Y'                                    ,'')) "난소암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-5CY','Y'                                    ,'')) "난소암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-6CY','Y'                                    ,'')) "난소암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-7CY','Y'                                    ,'')) "난소암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-8CY','Y'                                    ,'')) "난소암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-1CY','Y'                                    ,'')) "전립선암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-2CY','Y'                                    ,'')) "전립선암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-3CY','Y'                                    ,'')) "전립선암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-4CY','Y'                                    ,'')) "전립선암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-5CY','Y'                                    ,'')) "전립선암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-6CY','Y'                                    ,'')) "전립선암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-7CY','Y'                                    ,'')) "전립선암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-8CY','Y'                                    ,'')) "전립선암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-1CY','Y'                                    ,'')) "췌장암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-2CY','Y'                                    ,'')) "췌장암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-3CY','Y'                                    ,'')) "췌장암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-4CY','Y'                                    ,'')) "췌장암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-5CY','Y'                                    ,'')) "췌장암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-6CY','Y'                                    ,'')) "췌장암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-7CY','Y'                                    ,'')) "췌장암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-8CY','Y'                                    ,'')) "췌장암_외조모"
  FROM (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A, SMPKGMST B
         WHERE A.ORDDATE BETWEEN TO_DATE(:d1,'YYYYMMDD') AND TO_DATE(:d2,'YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
     , SMQUESAT F, SMQUESMT G
 WHERE A.PATNO = F.PATNO
   AND A.ORDDATE = F.ORDDATE
   AND F.QCODE1 IN (-- 결혼여부
                    '1014'
                    -- 교육
                   ,'1015'
                   -- 음주관련
                   ,'1021'
                   ,'1036'
                   ,'3-0-1'
                   ,'3-0-2'
                   ,'3-1'
                   ,'3-2-1'
                   ,'3-2-2'
                   ,'3-2-3'
                   ,'3-2-4'
                   ,'3-2-5'
                   ,'3-2-6'
                   -- 흡연관련
                   ,'1019'
                   ,'1035'
                   ,'2-0-1'
                   ,'2-0-2'
                   ,'2-0-3'
                   ,'2-1'
                   ,'2-2'
                   ,'2-3-1'
                   ,'2-3-2'
                   ,'2-3-3'
                   ,'2-3-4'
                   -- 약물부작용
                   ,'1025'
                   ,'4-0-1'
                   ,'4-0-2'
                   ,'4-0-3'
                   ,'4-1-1'
                   ,'4-1-2'
                   ,'4-1-3'
                   ,'4-1-4'
                   ,'4-1-5'
                   -- 운동여부
                   ,'1017'
                   ,'5-0-1'
                   ,'5-0-2'
                   ,'5-0-3'
                   ,'5-0-4'
                   ,'5-1-1'
                   ,'5-1-2'
                   ,'5-1-3'
                   ,'5-1-4'
                   ,'5-2-1'
                   ,'5-2-2'
                   ,'5-2-3'
                   ,'5-2-4'
                   ,'5-2-5'
                   -- 스트레스
                   ,'24-1-1'
                   ,'24-1-2'
                   ,'24-1-3'
                   ,'24-1-4'
                   ,'24-2-1'
                   ,'24-2-2'
                   ,'24-2-3'
                   ,'24-2-4'
                   ,'24-3-1'
                   ,'24-3-2'
                   ,'24-3-3'
                   ,'24-3-4'
                   ,'24-4-1'
                   ,'24-4-2'
                   ,'24-4-3'
                   ,'24-4-4'
                   ,'24-5-1'
                   ,'24-5-2'
                   ,'24-5-3'
                   ,'24-5-4'
                   ,'24-6-1'
                   ,'24-6-2'
                   ,'24-6-3'
                   ,'24-6-4'
                   ,'24-7-1'
                   ,'24-7-2'
                   ,'24-7-3'
                   ,'24-7-4'
                   ,'24-8-1'
                   ,'24-8-2'
                   ,'24-8-3'
                   ,'24-8-4'
                   ,'24-9-1'
                   ,'24-9-2'
                   ,'24-9-3'
                   ,'24-9-4'
                   ,'24-10-1'
                   ,'24-10-2'
                   ,'24-10-3'
                   ,'24-10-4'
                   ,'24-11-1'
                   ,'24-11-2'
                   ,'24-11-3'
                   ,'24-11-4'
                   ,'24-12-1'
                   ,'24-12-2'
                   ,'24-12-3'
                   ,'24-12-4'
                   ,'24-13-1'
                   ,'24-13-2'
                   ,'24-13-3'
                   ,'24-13-4'
                   ,'24-14-1'
                   ,'24-14-2'
                   ,'24-14-3'
                   ,'24-14-4'
                   ,'24-15-1'
                   ,'24-15-2'
                   ,'24-15-3'
                   ,'24-15-4'
                   ,'24-16-1'
                   ,'24-16-2'
                   ,'24-16-3'
                   ,'24-16-4'
                   ,'24-17-1'
                   ,'24-17-2'
                   ,'24-17-3'
                   ,'24-17-4'
                   ,'24-18-1'
                   ,'24-18-2'
                   ,'24-18-3'
                   ,'24-18-4'
                   ,'24-19-1'
                   ,'24-19-2'
                   ,'24-19-3'
                   ,'24-19-4'
                   ,'24-19-5'
                   ,'24-20-1'
                   ,'24-20-2'
                   ,'24-20-3'
                   ,'24-20-4'
                   ,'24-20-5'
                   -- 초경
                   ,'5002'
                   ,'20-0-1'
                   ,'20-0-2'
                   ,'20-0-3'
                   ,'20-0-4'
                   ,'20-0-5'
                   ,'20-0-6'
                   ,'20-0-7'
                   ,'20-0-8'
                   ,'20-0-9'
                   ,'20-0-10'
                   -- 폐경, 여성호르몬치료
                   ,'5007'
                   ,'21-0-1'
                   ,'21-0-2'
                   ,'21-0-3'
                   ,'21-0-4'
                   ,'21-2-1'
                   ,'21-2-2'
                   ,'21-2-3'
                   ,'21-2-4'
                   ,'21-2-5'
                   ,'22-1-1'
                   ,'22-1-2'
                   ,'22-1-3'
                   ,'22-1-4'
                   ,'22-1-5'
                   ,'22-2-1'
                   ,'22-2-2'
                   -- 출산, 유산, 조산
                   ,'5011'
                   ,'23-1-1'
                   ,'23-1-2'
                   ,'23-1-3'
                   ,'23-1-4'
                   ,'23-1-5'
                   ,'23-1-6'
                   ,'23-1-7'
                   ,'23-1-8'
                   ,'23-1-9'
                   ,'23-1-10'
                   ,'23-3-3'
                   ,'23-3-4'
                   ,'23-3-5'
                   ,'23-3-6'
                   ,'23-3-7'
                   ,'23-3-8'
                   ,'23-3-9'
                   ,'23-3-10'
                   ,'23-3-11'
                   ,'23-3-12'
                   ,'23-3-13'
                   ,'23-3-14'
                   ,'23-3-15'
                   ,'23-3-16'
                   ,'23-3-17'
                   ,'23-3-18'
                   ,'23-3-19'
                   ,'23-3-20'
                   ,'23-3-21'
                   ,'23-3-22'
                   ,'23-4-3'
                   ,'23-4-4'
                   ,'23-4-5'
                   ,'23-4-6'
                   ,'23-4-7'
                   ,'23-4-8'
                   ,'23-4-9'
                   ,'23-4-10'
                   ,'23-4-11'
                   ,'23-4-12'
                   -- 전립선, 남성의학
                   ,'19-1-0'
                   ,'19-1-1'
                   ,'19-1-2'
                   ,'19-1-3'
                   ,'19-1-4'
                   ,'19-1-5'
                   ,'19-2-0'
                   ,'19-2-1'
                   ,'19-2-2'
                   ,'19-2-3'
                   ,'19-2-4'
                   ,'19-2-5'
                   ,'19-3-0'
                   ,'19-3-1'
                   ,'19-3-2'
                   ,'19-3-3'
                   ,'19-3-4'
                   ,'19-3-5'
                   ,'19-4-0'
                   ,'19-4-1'
                   ,'19-4-2'
                   ,'19-4-3'
                   ,'19-4-4'
                   ,'19-4-5'
                   ,'19-5-0'
                   ,'19-5-1'
                   ,'19-5-2'
                   ,'19-5-3'
                   ,'19-5-4'
                   ,'19-5-5'
                   ,'19-6-0'
                   ,'19-6-1'
                   ,'19-6-2'
                   ,'19-6-3'
                   ,'19-6-4'
                   ,'19-6-5'
                   ,'19-7-0'
                   ,'19-7-1'
                   ,'19-7-2'
                   ,'19-7-3'
                   ,'19-7-4'
                   ,'19-7-5'
                   ,'19-8-0'
                   ,'19-8-1'
                   ,'19-8-2'
                   ,'19-8-3'
                   ,'19-8-4'
                   ,'19-8-5'
                   ,'19-8-6'
                   -- 계통별, 소화기
                   ,'10-0-2'
                   ,'10-0-5'
                   ,'3002'
                   ,'10-0-4'
                   -- 계통별, 호흡기
                   ,'11-0-1'
                   ,'11-0-2'
                   ,'11-0-3'
                   ,'11-0-4'
                   ,'11-0-5'
                   ,'3004'
                   -- 계통별, 신장/요로/비뇨기
                   ,'12-0-2'
                   ,'12-0-3'
                   ,'12-0-8'
                   ,'12-0-10'
                   ,'3006'
                   ,'3005'
                   -- 계통별, 치과
                   ,'17-0-1'
                   ,'17-0-2'
                   ,'17-0-3'
                   ,'17-0-5'
                   ,'17-0-6'
                   ,'3009'
                   -- 계통별, 심장/혈관
                   ,'13-0-1'
                   ,'13-0-2'
                   ,'13-0-3'
                   ,'3003'
                   -- 계통별, 신경/정신
                   ,'15-0-1'
                   ,'15-0-2'
                   ,'15-0-3'
                   ,'15-0-5'
                   ,'15-0-6'
                   ,'15-0-7'
                   ,'15-0-8'
                   ,'15-0-9'
                   ,'3007'
                   ,'3001'
                   -- 계통별, 기타
                   ,'18-0-1'
                   ,'18-0-2'
                   ,'18-0-3'
                   ,'18-0-5'
                   ,'18-0-7'
                   ,'18-0-8'
                   ,'18-0-9'
                   ,'18-0-13'
                   ,'3008'
                   ,'3001'
                   -- 과거질환
                   ,'9001'
                   ,'6-1-1-1'
                   ,'6-1-1-2'
                   ,'6-1-1-3'
                   ,'6-1-2-1'
                   ,'6-1-2-2'
                   ,'6-1-2-3'
                   ,'6-1-3-1'
                   ,'6-1-3-2'
                   ,'6-1-3-3'
                   ,'6-1-4-1'
                   ,'6-1-4-2'
                   ,'6-1-4-3'
                   ,'6-1-4-4'
                   ,'6-1-4-5'
                   ,'6-1-5-1'
                   ,'6-1-5-2'
                   ,'6-1-5-3'
                   ,'6-1-5-4'
                   ,'6-1-5-5'
                   ,'6-1-6-1'
                   ,'6-1-6-2'
                   ,'6-1-6-3'
                   ,'6-1-6-4'
                   ,'6-1-6-5'
                   ,'6-1-7-1'
                   ,'6-1-7-2'
                   ,'6-1-7-3'
                   ,'6-1-8-1'
                   ,'6-1-8-2'
                   ,'6-1-8-3'
                   ,'6-1-9-1'
                   ,'6-1-9-2'
                   ,'6-1-9-3'
                   ,'6-1-10-1'
                   ,'6-1-10-2'
                   ,'6-1-10-3'
                   ,'6-1-11-1'
                   ,'6-1-11-2'
                   ,'6-1-11-3'
                   ,'6-1-11-4'
                   ,'6-1-11-5'
                   ,'6-1-12-1'
                   ,'6-1-12-2'
                   ,'6-1-12-3'
                   ,'6-1-13-1'
                   ,'6-1-13-2'
                   ,'6-1-13-3'
                   ,'6-1-13-4'
                   ,'6-1-13-5'
                   ,'6-1-14-1'
                   ,'6-1-14-2'
                   ,'6-1-14-3'
                   ,'6-1-15-1'
                   ,'6-1-15-2'
                   ,'6-1-15-3'
                   ,'6-1-16-1'
                   ,'6-1-16-2'
                   ,'6-1-16-3'
                   ,'6-1-16-4'
                   ,'6-1-16-5'
                   ,'6-1-17-1'
                   ,'6-1-17-2'
                   ,'6-1-17-3'
                   ,'6-1-17-4'
                   ,'6-1-17-5'
                   ,'6-1-18-1'
                   ,'6-1-18-2'
                   ,'6-1-18-3'
                   ,'6-1-18-4'
                   ,'6-1-18-5'
                   ,'6-1-19-1'
                   ,'6-1-19-2'
                   ,'6-1-19-3'
                   ,'6-1-19-4'
                   ,'6-1-19-5'
                   ,'6-1-20-1'
                   ,'6-1-20-2'
                   ,'6-1-20-3'
                   ,'6-1-20-4'
                   ,'6-1-20-5'
                   ,'6-1-21-1'
                   ,'6-1-21-2'
                   ,'6-1-21-3'
                   ,'6-1-21-4'
                   ,'6-1-21-5'
                   ,'6-1-22-1'
                   ,'6-1-22-2'
                   ,'6-1-22-3'
                   ,'6-1-22-4'
                   ,'6-1-22-5'
                   ,'6-1-23-1'
                   ,'6-1-23-2'
                   ,'6-1-23-3'
                   ,'6-1-23-4'
                   ,'6-1-23-5'
                   ,'6-1-24-1'
                   ,'6-1-24-2'
                   ,'6-1-24-3'
                   ,'6-1-24-4'
                   ,'6-1-24-5'
                   ,'6-1-25-1'
                   ,'6-1-25-2'
                   ,'6-1-25-3'
                   ,'6-1-25-4'
                   ,'6-1-25-5'
                   ,'6-1-26-1'
                   ,'6-1-26-2'
                   ,'6-1-26-3'
                   ,'6-1-26-4'
                   ,'6-1-26-5'
                   ,'6-1-27-1'
                   ,'6-1-27-2'
                   ,'6-1-27-3'
                   ,'6-1-27-4'
                   ,'6-1-27-5'
                   ,'6-1-28-1'
                   ,'6-1-28-2'
                   ,'6-1-28-3'
                   ,'6-1-28-4'
                   ,'6-1-28-5'
                   -- 약복용력
                   ,'9002'
                   ,'7-1-1-1'
                   ,'7-1-1-2'
                   ,'7-1-2-1'
                   ,'7-1-2-2'
                   ,'7-1-3-1'
                   ,'7-1-3-2'
                   ,'7-1-4-1'
                   ,'7-1-4-2'
                   ,'7-1-5-1'
                   ,'7-1-5-2'
                   ,'7-1-6-1'
                   ,'7-1-6-2'
                   ,'7-1-7-1'
                   ,'7-1-7-2'
                   ,'7-1-8-1'
                   ,'7-1-8-2'
                   ,'7-1-9-1'
                   ,'7-1-9-2'
                   ,'7-1-10-1'
                   ,'7-1-10-2'
                   ,'7-1-11-1'
                   ,'7-1-11-2'
                   ,'7-1-12-1'
                   ,'7-1-12-2'
                   ,'7-1-13-1'
                   ,'7-1-13-2'
                   ,'7-1-14-1'
                   ,'7-1-14-2'
                   ,'7-1-15-1'
                   ,'7-1-15-2'
                   ,'7-1-16-1'
                   ,'7-1-16-2'
                   ,'7-1-17-1'
                   ,'7-1-17-2'
                   ,'7-1-18-1'
                   ,'7-1-18-2'
                   ,'7-1-19-1'
                   ,'7-1-19-2'
                   ,'7-1-20-1'
                   ,'7-1-20-2'
                   ,'7-1-21-1'
                   ,'7-1-21-2'
                   -- 암질병력
                   ,'8-1-1-1'
                   ,'8-1-1-2'
                   ,'8-1-1-3'
                   ,'8-1-1-4'
                   ,'8-1-1-5'
                   ,'8-1-2-1'
                   ,'8-1-2-2'
                   ,'8-1-2-3'
                   ,'8-1-2-4'
                   ,'8-1-2-5'
                   ,'8-1-3-1'
                   ,'8-1-3-2'
                   ,'8-1-3-3'
                   ,'8-1-3-4'
                   ,'8-1-3-5'
                   ,'8-1-4-1'
                   ,'8-1-4-2'
                   ,'8-1-4-3'
                   ,'8-1-4-4'
                   ,'8-1-4-5'
                   ,'8-1-5-1'
                   ,'8-1-5-2'
                   ,'8-1-5-3'
                   ,'8-1-5-4'
                   ,'8-1-5-5'
                   ,'8-1-6-1'
                   ,'8-1-6-2'
                   ,'8-1-6-3'
                   ,'8-1-6-4'
                   ,'8-1-6-5'
                   ,'8-1-7-1'
                   ,'8-1-7-2'
                   ,'8-1-7-3'
                   ,'8-1-7-4'
                   ,'8-1-7-5'
                   ,'8-1-8-1'
                   ,'8-1-8-2'
                   ,'8-1-8-3'
                   ,'8-1-8-4'
                   ,'8-1-8-5'
                   ,'8-1-9-1'
                   ,'8-1-9-2'
                   ,'8-1-9-3'
                   ,'8-1-9-4'
                   ,'8-1-9-5'
                   ,'8-1-10-1'
                   ,'8-1-10-2'
                   ,'8-1-10-3'
                   ,'8-1-10-4'
                   ,'8-1-10-5'
                   ,'8-1-11-1'
                   ,'8-1-11-2'
                   ,'8-1-11-3'
                   ,'8-1-11-4'
                   ,'8-1-11-5'
                   ,'8-1-12-1'
                   ,'8-1-12-2'
                   ,'8-1-12-3'
                   ,'8-1-12-4'
                   ,'8-1-12-5'
                   ,'8-1-13-1'
                   ,'8-1-13-2'
                   ,'8-1-13-3'
                   ,'8-1-13-4'
                   ,'8-1-13-5'
                   ,'8-1-14-1'
                   ,'8-1-14-2'
                   ,'8-1-14-3'
                   ,'8-1-14-4'
                   ,'8-1-14-5'
                   -- 가족력
                   ,'9003'
                   ,'9-1-1-1'
                   ,'9-1-1-2'
                   ,'9-1-1-3'
                   ,'9-1-1-4'
                   ,'9-1-1-5'
                   ,'9-1-1-6'
                   ,'9-1-1-7'
                   ,'9-1-1-8'
                   ,'9-1-2-1'
                   ,'9-1-2-2'
                   ,'9-1-2-3'
                   ,'9-1-2-4'
                   ,'9-1-2-5'
                   ,'9-1-2-6'
                   ,'9-1-2-7'
                   ,'9-1-2-8'
                   ,'9-1-3-1'
                   ,'9-1-3-2'
                   ,'9-1-3-3'
                   ,'9-1-3-4'
                   ,'9-1-3-5'
                   ,'9-1-3-6'
                   ,'9-1-3-7'
                   ,'9-1-3-8'
                   ,'9-1-4-1'
                   ,'9-1-4-2'
                   ,'9-1-4-3'
                   ,'9-1-4-4'
                   ,'9-1-4-5'
                   ,'9-1-4-6'
                   ,'9-1-4-7'
                   ,'9-1-4-8'
                   ,'9-1-5-1'
                   ,'9-1-5-2'
                   ,'9-1-5-3'
                   ,'9-1-5-4'
                   ,'9-1-5-5'
                   ,'9-1-5-6'
                   ,'9-1-5-7'
                   ,'9-1-5-8'
                   ,'9-1-6-1'
                   ,'9-1-6-2'
                   ,'9-1-6-3'
                   ,'9-1-6-4'
                   ,'9-1-6-5'
                   ,'9-1-6-6'
                   ,'9-1-6-7'
                   ,'9-1-6-8'
                   ,'9-1-7-1'
                   ,'9-1-7-2'
                   ,'9-1-7-3'
                   ,'9-1-7-4'
                   ,'9-1-7-5'
                   ,'9-1-7-6'
                   ,'9-1-7-7'
                   ,'9-1-7-8'
                   ,'9-1-8-1'
                   ,'9-1-8-2'
                   ,'9-1-8-3'
                   ,'9-1-8-4'
                   ,'9-1-8-5'
                   ,'9-1-8-6'
                   ,'9-1-8-7'
                   ,'9-1-8-8'
                   ,'9-1-9-1'
                   ,'9-1-9-2'
                   ,'9-1-9-3'
                   ,'9-1-9-4'
                   ,'9-1-9-5'
                   ,'9-1-9-6'
                   ,'9-1-9-7'
                   ,'9-1-9-8'
                   ,'9-1-10-1'
                   ,'9-1-10-2'
                   ,'9-1-10-3'
                   ,'9-1-10-4'
                   ,'9-1-10-5'
                   ,'9-1-10-6'
                   ,'9-1-10-7'
                   ,'9-1-10-8'
                   ,'9-1-11-1'
                   ,'9-1-11-2'
                   ,'9-1-11-3'
                   ,'9-1-11-4'
                   ,'9-1-11-5'
                   ,'9-1-11-6'
                   ,'9-1-11-7'
                   ,'9-1-11-8'
                   ,'9-1-12-1'
                   ,'9-1-12-2'
                   ,'9-1-12-3'
                   ,'9-1-12-4'
                   ,'9-1-12-5'
                   ,'9-1-12-6'
                   ,'9-1-12-7'
                   ,'9-1-12-8'
                   ,'9-1-13-1'
                   ,'9-1-13-2'
                   ,'9-1-13-3'
                   ,'9-1-13-4'
                   ,'9-1-13-5'
                   ,'9-1-13-6'
                   ,'9-1-13-7'
                   ,'9-1-13-8'
                   ,'9-1-14-1'
                   ,'9-1-14-2'
                   ,'9-1-14-3'
                   ,'9-1-14-4'
                   ,'9-1-14-5'
                   ,'9-1-14-6'
                   ,'9-1-14-7'
                   ,'9-1-14-8'
                   ,'9-1-15-1'
                   ,'9-1-15-2'
                   ,'9-1-15-3'
                   ,'9-1-15-4'
                   ,'9-1-15-5'
                   ,'9-1-15-6'
                   ,'9-1-15-7'
                   ,'9-1-15-8'
                   ,'9-1-16-1'
                   ,'9-1-16-2'
                   ,'9-1-16-3'
                   ,'9-1-16-4'
                   ,'9-1-16-5'
                   ,'9-1-16-6'
                   ,'9-1-16-7'
                   ,'9-1-16-8'
                   ,'9-1-17-1'
                   ,'9-1-17-2'
                   ,'9-1-17-3'
                   ,'9-1-17-4'
                   ,'9-1-17-5'
                   ,'9-1-17-6'
                   ,'9-1-17-7'
                   ,'9-1-17-8'
                   ,'9-1-18-1'
                   ,'9-1-18-2'
                   ,'9-1-18-3'
                   ,'9-1-18-4'
                   ,'9-1-18-5'
                   ,'9-1-18-6'
                   ,'9-1-18-7'
                   ,'9-1-18-8'
                   ,'9-1-19-1'
                   ,'9-1-19-2'
                   ,'9-1-19-3'
                   ,'9-1-19-4'
                   ,'9-1-19-5'
                   ,'9-1-19-6'
                   ,'9-1-19-7'
                   ,'9-1-19-8'
                   ,'9-1-20-1'
                   ,'9-1-20-2'
                   ,'9-1-20-3'
                   ,'9-1-20-4'
                   ,'9-1-20-5'
                   ,'9-1-20-6'
                   ,'9-1-20-7'
                   ,'9-1-20-8'
                   )
   AND F.QCODE1 = G.QCODE
 GROUP BY A.PATNO, A.ORDDATE

-- 의학문진
SELECT /* INDEX(F SMQUESAT_PK) */
       A.PATNO, A.ORDDATE
--     , CASE WHEN LENGTH(SUBSTR(F.PATNO,1,5)||((789+SUBSTR(F.PATNO,6))||SUBSTR(F.PATNO,6))) = '11'
--            THEN '0'||SUBSTR(F.PATNO,1,5)||((789+SUBSTR(F.PATNO,6))||SUBSTR(F.PATNO,6))
--       ELSE SUBSTR(F.PATNO,1,5)||((789+SUBSTR(F.PATNO,6))||SUBSTR(F.PATNO,6)) END PATNO2
     , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1014C010Y','1'
                                                                    ,'1014C011Y','2'
                                                                    ,'1014C012Y','3'
                                                                    ,'1014C013Y','4'
                                                                    ,'1014C014Y','5','')) "Marriage"
     , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1015C015Y',F.QCODENM
                                                                    ,'1015C016Y',F.QCODENM
                                                                    ,'1015C017Y',F.QCODENM
                                                                    ,'1015C018Y',F.QCODENM
                                                                    ,'1015C019Y',F.QCODENM
                                                                    ,'1015C020Y',F.QCODENM,'')) "Education"
       , DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021C008Y','Y','0'))||  -- 과거
                MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211024C008Y','Y'
                                                                             ,'1036C008Y','Y'
                                                                             ,'10211024A005Y','S'
                                                                             ,'1036C236Y','S'
                                                                             ,'1021C027Y','N'
                                                                             ,'1036C027Y','N'
                                                                             ,'0')) -- 현재
                                                                             ,'0S','PAST'
                                                                             ,'0N','NONE'
                                                                             ,'YN','오류'
                                                                             ,'0Y','CURRENT'
                                                                             ,'YY','CURRENT'
                                                                             ,'Y0','PAST'
                                                                             ,'YS','PAST'
                                                                             ,'')                                       DRINKYN        -- 구문진_음주여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'3-0-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-0-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             NEW_DRINKYN    -- 신문진_음주여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T005',F.ACODE1
                                                                      ,''))                                             DRINK_STARTYEAR-- 음주시작연령
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1021T006',F.ACODE1
                                                                      ,'3-1T',F.ACODE1
                                                                      ,''))                                             DRINK_YEAR     -- 음주기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10211022C028Y',F.QCODENM
                                                                      ,'10211022C029Y',F.QCODENM
                                                                      ,'10211022C030Y',F.QCODENM
                                                                      ,'10211022C031Y',F.QCODENM
                                                                      ,'10211022C032Y',F.QCODENM
                                                                      ,'10211022C033Y',F.QCODENM -- 정밀
                                                                      ,'10361022C028Y',F.QCODENM
                                                                      ,'10361022C029Y',F.QCODENM
                                                                      ,'10361022C030Y',F.QCODENM
                                                                      ,'10361022C031Y',F.QCODENM
                                                                      ,'10361022C032Y',F.QCODENM
                                                                      ,'10361022C033Y',F.QCODENM -- 재진
                                                                      ,'3-2-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-5CY',SUBSTR(F.QCODENM,3)
                                                                      ,'3-2-6CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             DRINK_NUM      -- 음주횟수
      , DECODE(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019C008Y','Y','0'))||  -- 과거
               MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10191020C008Y','Y'
                                                                            ,'1035C008Y','Y'
                                                                            ,'2-0-3CY','Y'
                                                                            ,'10191020A005Y','S'
                                                                            ,'1035C236Y','S'
                                                                            ,'2-0-2CY','S'
                                                                            ,'1019C026Y','N'
                                                                            ,'1035C026Y','N'
                                                                            ,'2-0-1CY','N'
                                                                            ,'0')) -- 현재
                                                                            ,'0S','PAST'--'1'
                                                                            ,'0N','NONE'--'0'
                                                                            ,'YN','오류'--''
                                                                            ,'0Y','CURRENT'--'2'
                                                                            ,'YY','CURRENT'--'2'
                                                                            ,'Y0','PAST'--'1'
                                                                            ,'YS','PAST'--'1'
                                                                            ,'')                                        SMOKEYN        -- 흡연여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T003',F.ACODE1
                                                                      ,'2-2T',F.ACODE1
                                                                      ,''))                                             SMOKE_YEAR     -- 흡연기간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T002',F.ACODE1
                                                                      ,'2-1T',F.ACODE1
                                                                      ,''))                                             SMOKE_START_YEAR     -- 흡연시작나이
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1019T004',F.ACODE1||'개비'
                                                                      ,'1035T004',F.ACODE1||'개비'
                                                                      ,'1035T004Y',F.ACODE1||'개비'
                                                                      ,'2-3-1CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-2CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-3CY',SUBSTR(F.QCODENM,3)
                                                                      ,'2-3-4CY',SUBSTR(F.QCODENM,3)
                                                                      ,''))                                             SMOKE_AMT      -- 흡연량
      , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'4-0-1CY'   ,SUBSTR(F.QCODENM,3)--'1'
                                                 ,'1025C008Y' ,F.QCODENM--'1'
                                                 ,'4-0-2CY'   ,SUBSTR(F.QCODENM,3)--'0'
                                                 ,'1025C009Y' ,F.QCODENM--'0'
                                                 ,'4-0-3CY'   ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   "adverse_drug_event"
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-1CY'   ,SUBSTR(F.QCODENM,3)--'1'
                                                           ,'10251026C043Y',F.QCODENM--'1'
                                                                                            ,''))                  "adverse_drug_aspirinNSAID" --'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-2CY'   ,SUBSTR(F.QCODENM,3)
                                                           ,'10251026C039Y',F.QCODENM--'1'
                                                           ,'10251026C040Y',F.QCODENM--'1'
                                                                                            ,''))                  "adverse_drug_antibiotics"--'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-3CY'   ,SUBSTR(F.QCODENM,3)--'1'
                                                           ,'10251026C041Y',F.QCODENM--'1'
                                                                                            ,''))                  "adverse_drug_contrastagent"--'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-4CY'   ,SUBSTR(F.QCODENM,3)
                                                           ,'10251026C042Y',F.QCODENM--'1'
                                                                                            ,''))                  "adverse_drug_local"--'1'
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'4-1-5CY'   ,SUBSTR(F.QCODENM,3)
                                                           ,'10251026C044Y',F.QCODENM--'1'
                                                                                            ,''))                  "adverse_drug_etc"--'1'
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017C008Y',F.QCODENM
                                                                      ,'1017C009Y',F.QCODENM,''))                       EXEC_YN        -- 구문진_운동여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171018C029Y',F.QCODENM--'0'
                                                                      ,'10171018C030Y',F.QCODENM--'2'
                                                                      ,'10171018C031Y',F.QCODENM--'3'
                                                                      ,'10171018C032Y',F.QCODENM--'4'
                                                                      ,'10171018C033Y',F.QCODENM--'4'
                                                                      ,''))                                             EXEC_AMT       -- 구문진_운동횟수
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C217Y',F.QCODENM,''))     EXEC_TYP01       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C218Y',F.QCODENM,''))     EXEC_TYP02       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C219Y',F.QCODENM,''))     EXEC_TYP03       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C220Y',F.QCODENM,''))     EXEC_TYP04       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C221Y',F.QCODENM,''))     EXEC_TYP05       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C222Y',F.QCODENM,''))     EXEC_TYP06       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C223Y',F.QCODENM,''))     EXEC_TYP07       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041A011Y',F.QCODENM,''))     EXEC_TYP08       -- 구문진_운동종류
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171041C250Y',F.QCODENM,''))     EXEC_TYP09       -- 구문진_운동종류
       , DECODE(SUBSTR(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE2,''))||'hr'||-- EXEC_HOUR
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE1,''))||'mn'|| -- EXEC_MIN
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171042C227Y',F.QCODENM
                                                                                    ,'10171042C228Y',F.QCODENM
                                                                                    ,'10171042C229Y',F.QCODENM
                                                                                    ,'10171042C225Y',F.QCODENM
                                                                                    ,'10171042C226Y',F.QCODENM
                                                                                    ,'')),1,4)
               ,'hrmn'
               ,SUBSTR(MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE2,''))||'hr'||-- EXEC_HOUR
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE1,''))||'mn'|| -- EXEC_MIN
                       MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'10171042C227Y',F.QCODENM
                                                                                    ,'10171042C228Y',F.QCODENM
                                                                                    ,'10171042C229Y',F.QCODENM
                                                                                    ,'10171042C225Y',F.QCODENM
                                                                                    ,'10171042C226Y',F.QCODENM
                                                                                    ,'')),5)
               ,MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE2,''))||'hr'||-- EXEC_HOUR
                MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'1017T201',F.ACODE1,''))||'mn')           EXEC_TIME      -- 구문진_운동시간
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-0-1CY',SUBSTR(F.QCODENM,3,14)--'3'
                                                                      ,'5-0-2CY',SUBSTR(F.QCODENM,3,16)--'2'
                                                                      ,'5-0-3CY',SUBSTR(F.QCODENM,3,12)--'1'
                                                                      ,'5-0-4CY',SUBSTR(F.QCODENM,3,18)--'0'
                                                                      ,''))                                             NEW_EXEC_YN    -- 신문진_운동여부
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-1-1CY',SUBSTR(F.QCODENM,3)--'0' -- 신문진 운동횟수구분 '없다'
                                                                      ,'5-1-2CY','주'||SUBSTR(F.QCODENM,3)--'2' -- 신문진 운동횟수구분
                                                                      ,'5-1-3CY','주'||SUBSTR(F.QCODENM,3)--'3'
                                                                      ,'5-1-4CY','주'||SUBSTR(F.QCODENM,3)--'4'
                                                                      ,''))                                             NEW_EXEC_AMT   -- 신문진_운동횟수
       , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'5-2-1CY',SUBSTR(F.QCODENM,3)--'0' -- 신문진 운동횟수구분 '없다'
                                                                      ,'5-2-2CY','하루'||SUBSTR(F.QCODENM,3)--'1' -- 신문진 운동횟수구분
                                                                      ,'5-2-3CY','하루'||SUBSTR(F.QCODENM,3)--'2'
                                                                      ,'5-2-4CY','하루'||SUBSTR(F.QCODENM,3)--'3'
                                                                      ,'5-2-5CY','하루'||SUBSTR(F.QCODENM,3)--'5'
                                                                      ,''))                                             NEW_EXEC_TIME  -- 신문진_운동시간
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-1-1CY',G.FOODBASEQTY
--                                                  ,'24-1-2CY',G.FOODBASEQTY
--                                                  ,'24-1-3CY',G.FOODBASEQTY
--                                                  ,'24-1-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_01
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-2-1CY',G.FOODBASEQTY
--                                                  ,'24-2-2CY',G.FOODBASEQTY
--                                                  ,'24-2-3CY',G.FOODBASEQTY
--                                                  ,'24-2-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_02
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-3-1CY',G.FOODBASEQTY
--                                                  ,'24-3-2CY',G.FOODBASEQTY
--                                                  ,'24-3-3CY',G.FOODBASEQTY
--                                                  ,'24-3-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_03
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-4-1CY',G.FOODBASEQTY
--                                                  ,'24-4-2CY',G.FOODBASEQTY
--                                                  ,'24-4-3CY',G.FOODBASEQTY
--                                                  ,'24-4-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_04
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-5-1CY',G.FOODBASEQTY
--                                                  ,'24-5-2CY',G.FOODBASEQTY
--                                                  ,'24-5-3CY',G.FOODBASEQTY
--                                                  ,'24-5-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_05
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-6-1CY',G.FOODBASEQTY
--                                                  ,'24-6-2CY',G.FOODBASEQTY
--                                                  ,'24-6-3CY',G.FOODBASEQTY
--                                                  ,'24-6-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_06
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-7-1CY',G.FOODBASEQTY
--                                                  ,'24-7-2CY',G.FOODBASEQTY
--                                                  ,'24-7-3CY',G.FOODBASEQTY
--                                                  ,'24-7-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_07
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-8-1CY',G.FOODBASEQTY
--                                                  ,'24-8-2CY',G.FOODBASEQTY
--                                                  ,'24-8-3CY',G.FOODBASEQTY
--                                                  ,'24-8-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_08
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-9-1CY',G.FOODBASEQTY
--                                                  ,'24-9-2CY',G.FOODBASEQTY
--                                                  ,'24-9-3CY',G.FOODBASEQTY
--                                                  ,'24-9-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_09
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-10-1CY',G.FOODBASEQTY
--                                                  ,'24-10-2CY',G.FOODBASEQTY
--                                                  ,'24-10-3CY',G.FOODBASEQTY
--                                                  ,'24-10-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_10
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-11-1CY',G.FOODBASEQTY
--                                                  ,'24-11-2CY',G.FOODBASEQTY
--                                                  ,'24-11-3CY',G.FOODBASEQTY
--                                                  ,'24-11-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_11
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-12-1CY',G.FOODBASEQTY
--                                                  ,'24-12-2CY',G.FOODBASEQTY
--                                                  ,'24-12-3CY',G.FOODBASEQTY
--                                                  ,'24-12-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_12
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-13-1CY',G.FOODBASEQTY
--                                                  ,'24-13-2CY',G.FOODBASEQTY
--                                                  ,'24-13-3CY',G.FOODBASEQTY
--                                                  ,'24-13-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_13
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-14-1CY',G.FOODBASEQTY
--                                                  ,'24-14-2CY',G.FOODBASEQTY
--                                                  ,'24-14-3CY',G.FOODBASEQTY
--                                                  ,'24-14-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_14
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-15-1CY',G.FOODBASEQTY
--                                                  ,'24-15-2CY',G.FOODBASEQTY
--                                                  ,'24-15-3CY',G.FOODBASEQTY
--                                                  ,'24-15-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_15
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-16-1CY',G.FOODBASEQTY
--                                                  ,'24-16-2CY',G.FOODBASEQTY
--                                                  ,'24-16-3CY',G.FOODBASEQTY
--                                                  ,'24-16-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_16
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-17-1CY',G.FOODBASEQTY
--                                                  ,'24-17-2CY',G.FOODBASEQTY
--                                                  ,'24-17-3CY',G.FOODBASEQTY
--                                                  ,'24-17-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_17
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-18-1CY',G.FOODBASEQTY
--                                                  ,'24-18-2CY',G.FOODBASEQTY
--                                                  ,'24-18-3CY',G.FOODBASEQTY
--                                                  ,'24-18-4CY',G.FOODBASEQTY
--                                                  ,''))                                                                 PWI_SF_18
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-1-1CY',G.FOODBASEQTY
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
                                                  ,''))                                                                 stress_totalSCORE--PWI_SF_18
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-20-1CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-2CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-3CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-4CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-20-5CY',SUBSTR(F.QCODENM,3)
                                                  ,''))                                                                 stress_home
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'24-19-1CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-2CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-3CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-4CY',SUBSTR(F.QCODENM,3)
                                                  ,'24-19-5CY',SUBSTR(F.QCODENM,3)
                                                  ,''))                                                                 stress_social
      , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5002A007Y',F.ACODE1
                                                 ,'20-0-1CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-2CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-3CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-4CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-5CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-6CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-7CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-8CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-9CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'20-0-10CY' ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   MENS_START
      , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'5007C008Y' ,F.QCODENM --'1'
                                                 ,'5007C009Y' ,F.QCODENM --'2'
                                                 ,'5007C201Y' ,F.QCODENM --'4'
                                                 ,'5007C202Y' ,F.QCODENM --'3'
                                                 ,'21-0-1CY'  ,SUBSTR(F.QCODENM,3)--'1'
                                                 ,'21-0-2CY'  ,SUBSTR(F.QCODENM,3)--'2'
                                                 ,'21-0-3CY'  ,SUBSTR(F.QCODENM,3)--'3'
                                                 ,'21-0-4CY'  ,SUBSTR(F.QCODENM,3)--'4'
                                                 ,''))                                                   MENOPAUSEYN
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075008C203Y',F.QCODENM--'1'
                                                           ,'50075008C204Y',F.QCODENM--'2,3'
                                                           ,'50075008C205Y',F.QCODENM--'2,3'
                                                           ,'50075008C206Y',F.QCODENM--'4'
                                                           ,'50075008C038Y',F.QCODENM--'4'
                                                           ,'21-2-1CY'  ,SUBSTR(F.QCODENM,3)--'1'
                                                           ,'21-2-2CY'  ,SUBSTR(F.QCODENM,3)--'2'
                                                           ,'21-2-3CY'  ,SUBSTR(F.QCODENM,3)--'3'
                                                           ,'21-2-4CY'  ,SUBSTR(F.QCODENM,3)--'4'
                                                           ,'21-2-5CY'  ,SUBSTR(F.QCODENM,3)--'4'
                                                           ,''))                                                   MENOPAUSE_CAUSE
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075009C008Y','Y'
                                                           ,'50075009C009Y','N'
                                                           ,''))                                                   FHORMONECARE_YN
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50075009T202',DECODE(F.ACODE2||'년','년','',F.ACODE2||'년')||DECODE(F.ACODE1||'개월','개월','',F.ACODE1||'개월')
            /*   구,신문진 결과가 달라 매치할 수 없음    */,'50075009T202Y',DECODE(F.ACODE2||'년','년','',F.ACODE2||'년')||DECODE(F.ACODE1||'개월','개월','',F.ACODE1||'개월')
                                                           ,'22-1-1CY'  ,SUBSTR(F.QCODENM,3)--'1'
                                                           ,'22-1-2CY'  ,SUBSTR(F.QCODENM,3)--'2'
                                                           ,'22-1-3CY'  ,SUBSTR(F.QCODENM,3)--'3'
                                                           ,'22-1-4CY'  ,SUBSTR(F.QCODENM,3)--'4'
                                                           ,'22-1-5CY'  ,SUBSTR(F.QCODENM,3)--'5'
                                                           ,''))                                                   FHORMONECARE_YEAR
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.QCODE3||F.ANSCODE||F.CHECKYN,'500750095010C008Y',F.QCODENM
                                                                     ,'500750095010A005Y',F.QCODENM
                                                                     ,'500750095010C236Y',F.QCODENM
                                                                     ,'22-2-1CY'  ,SUBSTR(F.QCODENM,3)
                                                                     ,'22-2-2CY'  ,SUBSTR(F.QCODENM,3)
                                                                     ,''))                                                   FHORMONECARE_ING
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115012C208Y',F.QCODENM--'0'
                                                 ,'50115012A002Y',F.ACODE1
                                                 ,'23-1-1CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-2CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-3CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-4CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-5CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-6CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-7CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-8CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-9CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-1-10CY' ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   DELIVERY_NUM
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115014A004Y',F.ACODE1
                                                 ,'50115014A004',F.ACODE1
                                                 ,'23-3-3CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-4CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-5CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-6CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-7CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-8CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-9CY'  ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-10CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-11CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-12CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,''))                                                   SPONTANEOUS_ABORTION_NUM
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115014A004Y',F.ACODE2
                                                 ,'50115014A004',F.ACODE2
                                                 ,'23-3-13CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-14CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-15CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-16CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-17CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-18CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-19CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-20CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-21CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,'23-3-22CY' ,SUBSTR(F.QCODENM,INSTR(F.QCODENM,':')+1)
                                                 ,''))                                                   INDUCED_ABROTION_NUM
      , MAX(DECODE(F.QCODE1||F.QCODE2||F.ANSCODE||F.CHECKYN,'50115013A003Y',F.ACODE1
                                                 ,'50115013A003',F.ACODE1
                                                 ,'23-4-3CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-4CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-5CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-6CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-7CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-8CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-9CY'  ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-10CY' ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-11CY' ,SUBSTR(F.QCODENM,3)
                                                 ,'23-4-12CY' ,SUBSTR(F.QCODENM,3)
                                                 ,''))                                                   PRETERM_BIRTH_NUM
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-1-0CY','0'
--                                                  ,'19-1-1CY','1'
--                                                  ,'19-1-2CY','2'
--                                                  ,'19-1-3CY','3'
--                                                  ,'19-1-4CY','4'
--                                                  ,'19-1-5CY','5'
--                                                  ,''))                "IPSS_01"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-2-0CY','0'
--                                                  ,'19-2-1CY','1'
--                                                  ,'19-2-2CY','2'
--                                                  ,'19-2-3CY','3'
--                                                  ,'19-2-4CY','4'
--                                                  ,'19-2-5CY','5'
--                                                  ,''))                "IPSS_02"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-3-0CY','0'
--                                                  ,'19-3-1CY','1'
--                                                  ,'19-3-2CY','2'
--                                                  ,'19-3-3CY','3'
--                                                  ,'19-3-4CY','4'
--                                                  ,'19-3-5CY','5'
--                                                  ,''))                "IPSS_03"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-4-0CY','0'
--                                                  ,'19-4-1CY','1'
--                                                  ,'19-4-2CY','2'
--                                                  ,'19-4-3CY','3'
--                                                  ,'19-4-4CY','4'
--                                                  ,'19-4-5CY','5'
--                                                  ,''))                "IPSS_04"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-5-0CY','0'
--                                                  ,'19-5-1CY','1'
--                                                  ,'19-5-2CY','2'
--                                                  ,'19-5-3CY','3'
--                                                  ,'19-5-4CY','4'
--                                                  ,'19-5-5CY','5'
--                                                  ,''))                "IPSS_05"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-6-0CY','0'
--                                                  ,'19-6-1CY','1'
--                                                  ,'19-6-2CY','2'
--                                                  ,'19-6-3CY','3'
--                                                  ,'19-6-4CY','4'
--                                                  ,'19-6-5CY','5'
--                                                  ,''))                "IPSS_06"
--       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-7-0CY','0'
--                                                  ,'19-7-1CY','1'
--                                                  ,'19-7-2CY','2'
--                                                  ,'19-7-3CY','3'
--                                                  ,'19-7-4CY','4'
--                                                  ,'19-7-5CY','5'
--                                                  ,''))                "IPSS_07"
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-1-0CY','0'
                                                  ,'19-1-1CY','1'
                                                  ,'19-1-2CY','2'
                                                  ,'19-1-3CY','3'
                                                  ,'19-1-4CY','4'
                                                  ,'19-1-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-2-0CY','0'
                                                  ,'19-2-1CY','1'
                                                  ,'19-2-2CY','2'
                                                  ,'19-2-3CY','3'
                                                  ,'19-2-4CY','4'
                                                  ,'19-2-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-3-0CY','0'
                                                  ,'19-3-1CY','1'
                                                  ,'19-3-2CY','2'
                                                  ,'19-3-3CY','3'
                                                  ,'19-3-4CY','4'
                                                  ,'19-3-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-4-0CY','0'
                                                  ,'19-4-1CY','1'
                                                  ,'19-4-2CY','2'
                                                  ,'19-4-3CY','3'
                                                  ,'19-4-4CY','4'
                                                  ,'19-4-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-5-0CY','0'
                                                  ,'19-5-1CY','1'
                                                  ,'19-5-2CY','2'
                                                  ,'19-5-3CY','3'
                                                  ,'19-5-4CY','4'
                                                  ,'19-5-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-6-0CY','0'
                                                  ,'19-6-1CY','1'
                                                  ,'19-6-2CY','2'
                                                  ,'19-6-3CY','3'
                                                  ,'19-6-4CY','4'
                                                  ,'19-6-5CY','5'
                                                  ,''))
       + MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-7-0CY','0'
                                                  ,'19-7-1CY','1'
                                                  ,'19-7-2CY','2'
                                                  ,'19-7-3CY','3'
                                                  ,'19-7-4CY','4'
                                                  ,'19-7-5CY','5'
                                                  ,''))                "IPSS_score"
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-8-0CY','0'
                                                  ,'19-8-1CY','1'
                                                  ,'19-8-2CY','2'
                                                  ,'19-8-3CY','3'
                                                  ,'19-8-4CY','4'
                                                  ,'19-8-5CY','5'
                                                  ,'19-8-6CY','6'
                                                  ,''))                  "Prostate_satisfactioninlife"
       , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'19-7-0CY','0'
                                                  ,'19-7-1CY','1'
                                                  ,'19-7-2CY','2'
                                                  ,'19-7-3CY','3'
                                                  ,'19-7-4CY','4'
                                                  ,'19-7-5CY','5'
                                                  ,''))                  "nocturia"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'10-0-2CY','1','')) "GI_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'10-0-5CY','1'
                                                ,'3002C072Y','1'
                                                ,'3002C073Y','1'
                                                ,'3002C072','1'
                                                ,'3002C073','1'
                                                ,''))                "GI_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'10-0-4CY','1','')) "GI_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-1CY','1'
                                                ,'3004C112Y','1'
                                                ,''))                "Respiratory_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-2CY','1'
                                                ,'3004C113Y','1'
                                                ,''))                "Respiratory_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-3CY','1'
                                                ,'3004C114Y','1'
                                                ,''))                "Respiratory_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-4CY','1'
                                                ,''))                "Respiratory_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'11-0-5CY','1'
                                                ,'3004C117Y','1'
                                                ,''))                "Respiratory_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-2CY','1'
                                                ,'3006C125Y','1'
                                                ,''))                "GU_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-3CY','1'
                                                ,'3006C126Y','1'
                                                ,''))                "GU_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-8CY','1'
                                                ,'3006C129Y','1'
                                                ,''))                "GU_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'12-0-10CY','1'
                                                ,'3005C124Y','1'
                                                ,''))                "GU_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-1CY','1'
                                                ,''))                "TOOTH_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-2CY','1'
                                                ,'3009C145Y','1'
                                                ,''))                "TOOTH_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-3CY','1'
                                                ,'3009C147Y','1'
                                                ,''))                "TOOTH_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-6CY','1'
                                                ,'3009C149Y','1'
                                                ,''))                "TOOTH_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'17-0-5CY','1'
                                                ,''))                "TOOTH_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'13-0-1CY','1'
                                                ,'3003C107Y','1'
                                                ,''))                "CHEST_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'13-0-2CY','1'
                                                ,'3003C108Y','1'
                                                ,''))                "CHEST_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'13-0-3CY','1'
                                                ,'3003C109Y','1'
                                                ,''))                "CHEST_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-1CY','1'
                                                ,'3007C131Y','1'
                                                ,''))                "NEURO_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-2CY','1'
                                                ,'3001C061Y','1'
                                                ,''))                "NEURO_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-3CY','1'
                                                ,'3007C132Y','1'
                                                ,''))                "NEURO_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-5CY','1'
                                                ,'3007C134Y','1'
                                                ,''))                "NEURO_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-8CY','1'
                                                ,''))                "NEURO_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-7CY','1'
                                                ,'3007C131Y','1'
                                                ,''))                "NEURO_06"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-6CY','1'
                                                ,'3007C135Y','1'
                                                ,''))                "NEURO_07"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'15-0-9CY','1'
                                                ,''))                "NEURO_08"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-1CY','1'
                                                ,'3001C057Y','1'
                                                ,''))                "Etc_01"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-2CY','1'
                                                ,'3001C058Y','1'
                                                ,''))                "Etc_02"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-3CY','1'
                                                ,''))                "Etc_03"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-5CY','1'
                                                ,''))                "Etc_04"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-7CY','1'
                                                ,'3008C138Y','1'
                                                ,''))                "Etc_05"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-8CY','1'
                                                ,''))                "Etc_06"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-9CY','1'
                                                ,'3008C139Y','1'
                                                ,''))                "Etc_07"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'18-0-13CY','1'
                                                ,'3008C143Y','1'
                                                ,''))                "Etc_08"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A101Y','Y',''))   "Hx_천식/알레르기"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A106Y','Y',''))   "Hx_협심증/심근경색"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A108Y','Y',''))   "Hx_위염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A109Y','Y',''))   "Hx_장염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A111Y','Y',''))   "Hx_치질"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A112Y','Y',''))   "Hx_급성간염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A113Y','Y',''))   "Hx_만성간염/간경화"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A115Y','Y',''))   "Hx_담석/담낭염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A116Y','Y',''))   "Hx_신장질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A117Y','Y',''))   "Hx_방광질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A118Y','Y',''))   "Hx_갑상선질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A120Y','Y',''))   "Hx_자궁근종"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A121Y','Y',''))   "Hx_자궁경부염증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A122Y','Y',''))   "Hx_허리디스크"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A102Y','Y'
                                                ,'6-1-1-1CY','Y'
                                                ,'6-1-1-2CY','Y'
                                                ,'6-1-1-3CY','Y'
                                                ,'6-1-1-4CY','Y'
                                                ,'6-1-1-5CY','Y'
                                                                ,''))   "Hx_고혈압"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A105Y','Y'
                                                ,'6-1-2-1CY','Y'
                                                ,'6-1-2-2CY','Y'
                                                ,'6-1-2-3CY','Y'
                                                ,'6-1-2-4CY','Y'
                                                ,'6-1-2-5CY','Y'
                                                                ,''))   "Hx_당뇨병"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A103Y','Y'
                                                ,'6-1-3-1CY','Y'
                                                ,'6-1-3-2CY','Y'
                                                ,'6-1-3-3CY','Y'
                                                ,'6-1-3-4CY','Y'
                                                ,'6-1-3-5CY','Y'
                                                                ,''))   "Hx_고지혈증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-4-1CY','Y'
                                                ,'6-1-4-2CY','Y'
                                                ,'6-1-4-3CY','Y'
                                                ,'6-1-4-4CY','Y'
                                                ,'6-1-4-5CY','Y'
                                                                ,''))   "Hx_협심증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-5-1CY','Y'
                                                ,'6-1-5-2CY','Y'
                                                ,'6-1-5-3CY','Y'
                                                ,'6-1-5-4CY','Y'
                                                ,'6-1-5-5CY','Y'
                                                                ,''))   "Hx_심근경색"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A104Y','Y'
                                                ,'6-1-6-1CY','Y'
                                                ,'6-1-6-2CY','Y'
                                                ,'6-1-6-3CY','Y'
                                                ,'6-1-6-4CY','Y'
                                                ,'6-1-6-5CY','Y'
                                                                ,''))   "Hx_뇌졸중/중풍"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-7-1CY','Y'
                                                ,'6-1-7-2CY','Y'
                                                ,'6-1-7-3CY','Y'
                                                ,'6-1-7-4CY','Y'
                                                ,'6-1-7-5CY','Y'
                                                                ,''))   "Hx_B형간염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-8-1CY','Y'
                                                ,'6-1-8-2CY','Y'
                                                ,'6-1-8-3CY','Y'
                                                ,'6-1-8-4CY','Y'
                                                ,'6-1-8-5CY','Y'
                                                                ,''))   "Hx_C형간염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-9-1CY','Y'
                                                ,'6-1-9-2CY','Y'
                                                ,'6-1-9-3CY','Y'
                                                ,'6-1-9-4CY','Y'
                                                ,'6-1-9-5CY','Y'
                                                                ,''))   "Hx_간경변"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A114Y','Y'
                                                ,'6-1-10-1CY','Y'
                                                ,'6-1-10-2CY','Y'
                                                ,'6-1-10-3CY','Y'
                                                ,'6-1-10-4CY','Y'
                                                ,'6-1-10-5CY','Y'
                                                                ,''))   "Hx_지방간"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A107Y','Y'
                                                ,'6-1-11-1CY','Y'
                                                ,'6-1-11-2CY','Y'
                                                ,'6-1-11-3CY','Y'
                                                ,'6-1-11-4CY','Y'
                                                ,'6-1-11-5CY','Y'
                                                                 ,''))   "Hx_위,십이지장궤양"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-12-1CY','Y'
                                                ,'6-1-12-2CY','Y'
                                                ,'6-1-12-3CY','Y'
                                                ,'6-1-12-4CY','Y'
                                                ,'6-1-12-5CY','Y'
                                                                 ,''))   "Hx_헬리코박터균"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A110Y','Y'
                                                ,'6-1-13-1CY','Y'
                                                ,'6-1-13-2CY','Y'
                                                ,'6-1-13-3CY','Y'
                                                ,'6-1-13-4CY','Y'
                                                ,'6-1-13-5CY','Y'
                                                                 ,''))   "Hx_대장폴립(용종)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-14-1CY','Y'
                                                ,'6-1-14-2CY','Y'
                                                ,'6-1-14-3CY','Y'
                                                ,'6-1-14-4CY','Y'
                                                ,'6-1-14-5CY','Y'
                                                                 ,''))   "Hx_만성폐쇄성폐질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-15-1CY','Y'
                                                ,'6-1-15-2CY','Y'
                                                ,'6-1-15-3CY','Y'
                                                ,'6-1-15-4CY','Y'
                                                ,'6-1-15-5CY','Y'
                                                                 ,''))   "Hx_천식"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A100Y','Y'
                                                ,'6-1-16-1CY','Y'
                                                ,'6-1-16-2CY','Y'
                                                ,'6-1-16-3CY','Y'
                                                ,'6-1-16-4CY','Y'
                                                ,'6-1-16-5CY','Y'
                                                                 ,''))   "Hx_결핵"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9001A119Y','Y'
                                                ,'6-1-17-1CY','Y'
                                                ,'6-1-17-2CY','Y'
                                                ,'6-1-17-3CY','Y'
                                                ,'6-1-17-4CY','Y'
                                                ,'6-1-17-5CY','Y'
                                                                 ,''))   "Hx_유방양성종양"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-18-1CY','Y'
                                                ,'6-1-18-2CY','Y'
                                                ,'6-1-18-3CY','Y'
                                                ,'6-1-18-4CY','Y'
                                                ,'6-1-18-5CY','Y'
                                                                 ,''))   "Hx_갑상선기능저하증및항진증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-19-1CY','Y'
                                                ,'6-1-19-2CY','Y'
                                                ,'6-1-19-3CY','Y'
                                                ,'6-1-19-4CY','Y'
                                                ,'6-1-19-5CY','Y'
                                                                ,''))   "Hx_갑상선결절및낭종"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-20-1CY','Y'
                                                ,'6-1-20-2CY','Y'
                                                ,'6-1-20-3CY','Y'
                                                ,'6-1-20-4CY','Y'
                                                ,'6-1-20-5CY','Y'
                                                                 ,''))   "Hx_신장및방광질환"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-21-1CY','Y'
                                                ,'6-1-21-2CY','Y'
                                                ,'6-1-21-3CY','Y'
                                                ,'6-1-21-4CY','Y'
                                                ,'6-1-21-5CY','Y'
                                                                 ,''))   "Hx_신장요로결석"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-22-1CY','Y'
                                                ,'6-1-22-2CY','Y'
                                                ,'6-1-22-3CY','Y'
                                                ,'6-1-22-4CY','Y'
                                                ,'6-1-22-5CY','Y'
                                                                 ,''))   "Hx_혈뇨"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-23-1CY','Y'
                                                ,'6-1-23-2CY','Y'
                                                ,'6-1-23-3CY','Y'
                                                ,'6-1-23-4CY','Y'
                                                ,'6-1-23-5CY','Y'
                                                                 ,''))   "Hx_백내장"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-24-1CY','Y'
                                                ,'6-1-24-2CY','Y'
                                                ,'6-1-24-3CY','Y'
                                                ,'6-1-24-4CY','Y'
                                                ,'6-1-24-5CY','Y'
                                                                 ,''))   "Hx_녹내장"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-25-1CY','Y'
                                                ,'6-1-25-2CY','Y'
                                                ,'6-1-25-3CY','Y'
                                                ,'6-1-25-4CY','Y'
                                                ,'6-1-25-5CY','Y'
                                                                 ,''))   "Hx_디스크(허리/목)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-27-1CY','Y'
                                                ,'6-1-27-2CY','Y'
                                                ,'6-1-27-3CY','Y'
                                                ,'6-1-27-4CY','Y'
                                                ,'6-1-27-5CY','Y'
                                                                 ,''))   "Hx_전립선비대증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'6-1-28-1CY','Y'
                                                ,'6-1-28-2CY','Y'
                                                ,'6-1-28-3CY','Y'
                                                ,'6-1-28-4CY','Y'
                                                ,'6-1-28-5CY','Y'
                                                                ,''))   "Hx_관절염"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A154Y','Y','')) "PH_종합비타민"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A155Y','Y','')) "PH_비타민A"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A156Y','Y','')) "PH_비타민B"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A157Y','Y','')) "PH_비타민C"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A158Y','Y','')) "PH_비타민E"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A159Y','Y','')) "PH_베타카로테인"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A163Y','Y','')) "PH_개소주,흑염소"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A152Y','Y'
                                                ,'7-1-1-1CY','Y'
                                                ,'7-1-1-2CY','Y'
                                                                ,'')) "PH_혈압"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A153Y','Y'
                                                ,'7-1-2-1CY','Y'
                                                ,'7-1-2-2CY','Y'
                                                                ,'')) "PH_당뇨"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-3-1CY','Y'
                                                ,'7-1-3-2CY','Y'
                                                                ,'')) "PH_고지혈증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A150Y','Y'
                                                ,'7-1-4-1CY','Y'
                                                ,'7-1-4-2CY','Y'
                                                                ,'')) "PH_아스피린"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-5-1CY','Y'
                                                ,'7-1-5-2CY','Y'
                                                                ,'')) "PH_와파린"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-6-1CY','Y'
                                                ,'7-1-6-2CY','Y'
                                                                ,'')) "PH_기타혈전방지제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-7-1CY','Y'
                                                ,'7-1-7-2CY','Y'
                                                                ,'')) "PH_부정맥"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-8-1CY','Y'
                                                ,'7-1-8-2CY','Y'
                                                                ,'')) "PH_위장(조화제,제산제)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-9-1CY','Y'
                                                ,'7-1-9-2CY','Y'
                                                                ,'')) "PH_간장(간보호제)"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-10-1CY','Y'
                                                ,'7-1-10-2CY','Y'
                                                                ,'')) "PH_변비"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A151Y','Y'
                                                ,'7-1-11-1CY','Y'
                                                ,'7-1-11-2CY','Y'
                                                                ,'')) "PH_소염진통제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-12-1CY','Y'
                                                ,'7-1-12-2CY','Y'
                                                                ,'')) "PH_갑상선치료"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-13-1CY','Y'
                                                ,'7-1-13-2CY','Y'
                                                                ,'')) "PH_골다공증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-14-1CY','Y'
                                                ,'7-1-14-2CY','Y'
                                                                ,'')) "PH_여성호르몬"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-15-1CY','Y'
                                                ,'7-1-15-2CY','Y'
                                                                ,'')) "PH_전립선비대증"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A160Y','Y'
                                                ,'7-1-16-1CY','Y'
                                                ,'7-1-16-2CY','Y'
                                                                ,'')) "PH_칼슘"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A161Y','Y'
                                                ,'7-1-17-1CY','Y'
                                                ,'7-1-17-2CY','Y'
                                                                ,'')) "PH_철분"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A162Y','Y'
                                                ,'7-1-18-1CY','Y'
                                                ,'7-1-18-2CY','Y'
                                                                ,'')) "PH_수면제,항우울증약"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-19-1CY','Y'
                                                ,'7-1-19-2CY','Y'
                                                                ,'')) "PH_호흡기"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN
                                                ,'7-1-20-1CY','Y'
                                                ,'7-1-20-2CY','Y'
                                                                ,'')) "PH_영양제및보조식품"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9002A164Y','Y'
                                                ,'7-1-21-1CY','Y'
                                                ,'7-1-21-2CY','Y'
                                                                ,'')) "PH_한약,보약"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-1CY','Y'
                                                ,'8-1-1-2CY','Y'
                                                ,'8-1-1-3CY','Y'
                                                ,'8-1-1-4CY','Y'
                                                                ,''))       "위암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-1-5T',F.ACODE1,''))  "위암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-1CY','Y'
                                                ,'8-1-2-2CY','Y'
                                                ,'8-1-2-3CY','Y'
                                                ,'8-1-2-4CY','Y'
                                                                ,''))      "폐암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-2-5T',F.ACODE1,''))  "폐암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-1CY','Y'
                                                ,'8-1-3-2CY','Y'
                                                ,'8-1-3-3CY','Y'
                                                ,'8-1-3-4CY','Y'
                                                                ,''))      "간암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-3-5T',F.ACODE1,''))  "간암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-1CY','Y'
                                                ,'8-1-4-2CY','Y'
                                                ,'8-1-4-3CY','Y'
                                                ,'8-1-4-4CY','Y'
                                                                ,''))      "대장암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-4-5T',F.ACODE1,''))  "대장암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-1CY','Y'
                                                ,'8-1-5-2CY','Y'
                                                ,'8-1-5-3CY','Y'
                                                ,'8-1-5-4CY','Y'
                                                                ,''))      "유방암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-5-5T',F.ACODE1,''))  "유방암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-1CY','Y'
                                                ,'8-1-6-2CY','Y'
                                                ,'8-1-6-3CY','Y'
                                                ,'8-1-6-4CY','Y'
                                                                ,''))      "자궁경부암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-6-5T',F.ACODE1,''))  "자궁경부암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-1CY','Y'
                                                ,'8-1-7-2CY','Y'
                                                ,'8-1-7-3CY','Y'
                                                ,'8-1-7-4CY','Y'
                                                                ,''))      "갑상선암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-7-5T',F.ACODE1,''))  "갑상선암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-1CY','Y'
                                                ,'8-1-8-2CY','Y'
                                                ,'8-1-8-3CY','Y'
                                                ,'8-1-8-4CY','Y'
                                                                ,''))      "방광암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-8-5T',F.ACODE1,''))  "방광암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-1CY','Y'
                                                ,'8-1-9-2CY','Y'
                                                ,'8-1-9-3CY','Y'
                                                ,'8-1-9-4CY','Y'
                                                                ,''))      "식도암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-9-5T',F.ACODE1,''))  "식도암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-1CY','Y'
                                                ,'8-1-10-2CY','Y'
                                                ,'8-1-10-3CY','Y'
                                                ,'8-1-10-4CY','Y'
                                                                ,''))       "담낭암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-10-5T',F.ACODE1,''))  "담낭암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-1CY','Y'
                                                ,'8-1-11-2CY','Y'
                                                ,'8-1-11-3CY','Y'
                                                ,'8-1-11-4CY','Y'
                                                                ,''))       "난소암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-11-5T',F.ACODE1,''))  "난소암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-1CY','Y'
                                                ,'8-1-12-2CY','Y'
                                                ,'8-1-12-3CY','Y'
                                                ,'8-1-12-4CY','Y'
                                                                ,''))       "전립선암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-12-5T',F.ACODE1,''))  "전립선암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-1CY','Y'
                                                ,'8-1-13-2CY','Y'
                                                ,'8-1-13-3CY','Y'
                                                ,'8-1-13-4CY','Y'
                                                                ,''))       "췌장암"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'8-1-13-5T',F.ACODE1,''))  "췌장암_진단나이"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "결핵_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "결핵_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "결핵_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "결핵_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "결핵_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "결핵_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "결핵_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A100Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "결핵_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "심근경색_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "심근경색_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "심근경색_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "심근경색_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "심근경색_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "심근경색_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "심근경색_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A129Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "심근경색_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "협심증_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "협심증_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "협심증_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "협심증_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "협심증_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "협심증_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "협심증_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A130Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "협심증_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "심장기형_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "심장기형_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "심장기형_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "심장기형_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "심장기형_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "심장기형_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "심장기형_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A131Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "심장기형_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "언청이_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "언청이_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "언청이_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "언청이_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "언청이_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "언청이_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "언청이_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A132Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "언청이_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "기타선청기형_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "기타선청기형_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "기타선청기형_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "기타선청기형_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "기타선청기형_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "기타선청기형_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "기타선청기형_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A133Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "기타선청기형_외조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "간질환_부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "간질환_모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "간질환_형제"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "간질환_자녀"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "간질환_친조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "간질환_친조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "간질환_외조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A137Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "간질환_외조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y',''),'')) "편두통_부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y',''),'')) "편두통_모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y',''),'')) "편두통_형제"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y',''),'')) "편두통_자녀"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y',''),'')) "편두통_친조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y',''),'')) "편두통_친조모"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y',''),'')) "편두통_외조부"
--(정규건진 설문에는 없음!!)     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A138Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y',''),'')) "편두통_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-1-1CY','Y'                                    ,'')) "고혈압_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-1-2CY','Y'                                    ,'')) "고혈압_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-1-3CY','Y'                                    ,'')) "고혈압_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-1-4CY','Y'                                    ,'')) "고혈압_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-1-5CY','Y'                                    ,'')) "고혈압_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-1-6CY','Y'                                    ,'')) "고혈압_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-1-7CY','Y'                                    ,'')) "고혈압_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A102Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-1-8CY','Y'                                    ,'')) "고혈압_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-2-1CY','Y'                                    ,'')) "당뇨병_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-2-2CY','Y'                                    ,'')) "당뇨병_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-2-3CY','Y'                                    ,'')) "당뇨병_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-2-4CY','Y'                                    ,'')) "당뇨병_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-2-5CY','Y'                                    ,'')) "당뇨병_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-2-6CY','Y'                                    ,'')) "당뇨병_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-2-7CY','Y'                                    ,'')) "당뇨병_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A105Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-2-8CY','Y'                                    ,'')) "당뇨병_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-1CY','Y'                                    ,'')) "심근경색/협심증_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-2CY','Y'                                    ,'')) "심근경색/협심증_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-3CY','Y'                                    ,'')) "심근경색/협심증_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-4CY','Y'                                    ,'')) "심근경색/협심증_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-5CY','Y'                                    ,'')) "심근경색/협심증_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-6CY','Y'                                    ,'')) "심근경색/협심증_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-7CY','Y'                                    ,'')) "심근경색/협심증_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-3-8CY','Y'                                    ,'')) "심근경색/협심증_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-4-1CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-4-2CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-4-3CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-4-4CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-4-5CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-4-6CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-4-7CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A104Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-4-8CY','Y'                                    ,'')) "뇌졸중(뇌경색,뇌출혈)_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-5-1CY','Y'                                    ,'')) "치매_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-5-2CY','Y'                                    ,'')) "치매_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-5-3CY','Y'                                    ,'')) "치매_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-5-4CY','Y'                                    ,'')) "치매_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-5-5CY','Y'                                    ,'')) "치매_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-5-6CY','Y'                                    ,'')) "치매_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-5-7CY','Y'                                    ,'')) "치매_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A128Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-5-8CY','Y'                                    ,'')) "치매_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-6-1CY','Y'                                    ,'')) "만성간염또는간경변_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-6-2CY','Y'                                    ,'')) "만성간염또는간경변_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-6-3CY','Y'                                    ,'')) "만성간염또는간경변_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-6-4CY','Y'                                    ,'')) "만성간염또는간경변_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-6-5CY','Y'                                    ,'')) "만성간염또는간경변_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-6-6CY','Y'                                    ,'')) "만성간염또는간경변_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-6-7CY','Y'                                    ,'')) "만성간염또는간경변_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A113Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-6-8CY','Y'                                    ,'')) "만성간염또는간경변_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-1CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-2CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-3CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-4CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-5CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-6CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-7CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-7-8CY','Y'                                    ,'')) "천식또는만성폐쇄성질환_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-8-1CY','Y'                                    ,'')) "위암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-8-2CY','Y'                                    ,'')) "위암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-8-3CY','Y'                                    ,'')) "위암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-8-4CY','Y'                                    ,'')) "위암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-8-5CY','Y'                                    ,'')) "위암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-8-6CY','Y'                                    ,'')) "위암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-8-7CY','Y'                                    ,'')) "위암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A123Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-8-8CY','Y'                                    ,'')) "위암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-9-1CY','Y'                                    ,'')) "폐암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-9-2CY','Y'                                    ,'')) "폐암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-9-3CY','Y'                                    ,'')) "폐암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-9-4CY','Y'                                    ,'')) "폐암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-9-5CY','Y'                                    ,'')) "폐암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-9-6CY','Y'                                    ,'')) "폐암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-9-7CY','Y'                                    ,'')) "폐암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A135Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-9-8CY','Y'                                    ,'')) "폐암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-1CY','Y'                                    ,'')) "간암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-2CY','Y'                                    ,'')) "간암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-3CY','Y'                                    ,'')) "간암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-4CY','Y'                                    ,'')) "간암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-5CY','Y'                                    ,'')) "간암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-6CY','Y'                                    ,'')) "간암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-7CY','Y'                                    ,'')) "간암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A136Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')-- 소화기 설문지에만 존재
                                                ,'9-1-10-8CY','Y'                                    ,'')) "간암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-11-1CY','Y'                                    ,'')) "대장암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-11-2CY','Y'                                    ,'')) "대장암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-11-3CY','Y'                                    ,'')) "대장암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-11-4CY','Y'                                    ,'')) "대장암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-11-5CY','Y'                                    ,'')) "대장암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-11-6CY','Y'                                    ,'')) "대장암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-11-7CY','Y'                                    ,'')) "대장암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A124Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-11-8CY','Y'                                    ,'')) "대장암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-12-1CY','Y'                                    ,'')) "유방암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-12-2CY','Y'                                    ,'')) "유방암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-12-3CY','Y'                                    ,'')) "유방암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-12-4CY','Y'                                    ,'')) "유방암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-12-5CY','Y'                                    ,'')) "유방암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-12-6CY','Y'                                    ,'')) "유방암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-12-7CY','Y'                                    ,'')) "유방암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A134Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-12-8CY','Y'                                    ,'')) "유방암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,1,1),'1','Y','')
                                                ,'9-1-13-1CY','Y'                                    ,'')) "자궁암/자궁경부암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,2,1),'1','Y','')
                                                ,'9-1-13-2CY','Y'                                    ,'')) "자궁암/자궁경부암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,3,1),'1','Y','')
                                                ,'9-1-13-3CY','Y'                                    ,'')) "자궁암/자궁경부암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,4,1),'1','Y','')
                                                ,'9-1-13-4CY','Y'                                    ,'')) "자궁암/자궁경부암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,5,1),'1','Y','')
                                                ,'9-1-13-5CY','Y'                                    ,'')) "자궁암/자궁경부암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,6,1),'1','Y','')
                                                ,'9-1-13-6CY','Y'                                    ,'')) "자궁암/자궁경부암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,7,1),'1','Y','')
                                                ,'9-1-13-7CY','Y'                                    ,'')) "자궁암/자궁경부암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9003A127Y',DECODE(SUBSTR(F.ACODE1,8,1),'1','Y','')
                                                ,'9-1-13-8CY','Y'                                    ,'')) "자궁암/자궁경부암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-1CY','Y'                                    ,'')) "갑상선암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-2CY','Y'                                    ,'')) "갑상선암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-3CY','Y'                                    ,'')) "갑상선암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-4CY','Y'                                    ,'')) "갑상선암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-5CY','Y'                                    ,'')) "갑상선암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-6CY','Y'                                    ,'')) "갑상선암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-7CY','Y'                                    ,'')) "갑상선암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-14-8CY','Y'                                    ,'')) "갑상선암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-1CY','Y'                                    ,'')) "방광암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-2CY','Y'                                    ,'')) "방광암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-3CY','Y'                                    ,'')) "방광암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-4CY','Y'                                    ,'')) "방광암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-5CY','Y'                                    ,'')) "방광암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-6CY','Y'                                    ,'')) "방광암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-7CY','Y'                                    ,'')) "방광암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-15-8CY','Y'                                    ,'')) "방광암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-1CY','Y'                                    ,'')) "식도암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-2CY','Y'                                    ,'')) "식도암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-3CY','Y'                                    ,'')) "식도암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-4CY','Y'                                    ,'')) "식도암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-5CY','Y'                                    ,'')) "식도암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-6CY','Y'                                    ,'')) "식도암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-7CY','Y'                                    ,'')) "식도암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-16-8CY','Y'                                    ,'')) "식도암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-1CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-2CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-3CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-4CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-5CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-6CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-7CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-17-8CY','Y'                                    ,'')) "담낭(쓸개)암또는담도암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-1CY','Y'                                    ,'')) "난소암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-2CY','Y'                                    ,'')) "난소암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-3CY','Y'                                    ,'')) "난소암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-4CY','Y'                                    ,'')) "난소암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-5CY','Y'                                    ,'')) "난소암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-6CY','Y'                                    ,'')) "난소암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-7CY','Y'                                    ,'')) "난소암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-18-8CY','Y'                                    ,'')) "난소암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-1CY','Y'                                    ,'')) "전립선암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-2CY','Y'                                    ,'')) "전립선암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-3CY','Y'                                    ,'')) "전립선암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-4CY','Y'                                    ,'')) "전립선암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-5CY','Y'                                    ,'')) "전립선암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-6CY','Y'                                    ,'')) "전립선암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-7CY','Y'                                    ,'')) "전립선암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-19-8CY','Y'                                    ,'')) "전립선암_외조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-1CY','Y'                                    ,'')) "췌장암_부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-2CY','Y'                                    ,'')) "췌장암_모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-3CY','Y'                                    ,'')) "췌장암_형제"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-4CY','Y'                                    ,'')) "췌장암_자녀"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-5CY','Y'                                    ,'')) "췌장암_친조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-6CY','Y'                                    ,'')) "췌장암_친조모"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-7CY','Y'                                    ,'')) "췌장암_외조부"
     , MAX(DECODE(F.QCODE1||F.ANSCODE||F.CHECKYN,'9-1-20-8CY','Y'                                    ,'')) "췌장암_외조모"
  FROM (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A, SMPKGMST B
         WHERE A.ORDDATE BETWEEN TO_DATE(:d1,'YYYYMMDD') AND TO_DATE(:d2,'YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
     , SMQUESAT F, SMQUESMT G
 WHERE A.PATNO = F.PATNO
   AND A.ORDDATE = F.ORDDATE
   AND F.QCODE1 IN (-- 결혼여부
                    '1014'
                    -- 교육
                   ,'1015'
                   -- 음주관련
                   ,'1021'
                   ,'1036'
                   ,'3-0-1'
                   ,'3-0-2'
                   ,'3-1'
                   ,'3-2-1'
                   ,'3-2-2'
                   ,'3-2-3'
                   ,'3-2-4'
                   ,'3-2-5'
                   ,'3-2-6'
                   -- 흡연관련
                   ,'1019'
                   ,'1035'
                   ,'2-0-1'
                   ,'2-0-2'
                   ,'2-0-3'
                   ,'2-1'
                   ,'2-2'
                   ,'2-3-1'
                   ,'2-3-2'
                   ,'2-3-3'
                   ,'2-3-4'
                   -- 약물부작용
                   ,'1025'
                   ,'4-0-1'
                   ,'4-0-2'
                   ,'4-0-3'
                   ,'4-1-1'
                   ,'4-1-2'
                   ,'4-1-3'
                   ,'4-1-4'
                   ,'4-1-5'
                   -- 운동여부
                   ,'1017'
                   ,'5-0-1'
                   ,'5-0-2'
                   ,'5-0-3'
                   ,'5-0-4'
                   ,'5-1-1'
                   ,'5-1-2'
                   ,'5-1-3'
                   ,'5-1-4'
                   ,'5-2-1'
                   ,'5-2-2'
                   ,'5-2-3'
                   ,'5-2-4'
                   ,'5-2-5'
                   -- 스트레스
                   ,'24-1-1'
                   ,'24-1-2'
                   ,'24-1-3'
                   ,'24-1-4'
                   ,'24-2-1'
                   ,'24-2-2'
                   ,'24-2-3'
                   ,'24-2-4'
                   ,'24-3-1'
                   ,'24-3-2'
                   ,'24-3-3'
                   ,'24-3-4'
                   ,'24-4-1'
                   ,'24-4-2'
                   ,'24-4-3'
                   ,'24-4-4'
                   ,'24-5-1'
                   ,'24-5-2'
                   ,'24-5-3'
                   ,'24-5-4'
                   ,'24-6-1'
                   ,'24-6-2'
                   ,'24-6-3'
                   ,'24-6-4'
                   ,'24-7-1'
                   ,'24-7-2'
                   ,'24-7-3'
                   ,'24-7-4'
                   ,'24-8-1'
                   ,'24-8-2'
                   ,'24-8-3'
                   ,'24-8-4'
                   ,'24-9-1'
                   ,'24-9-2'
                   ,'24-9-3'
                   ,'24-9-4'
                   ,'24-10-1'
                   ,'24-10-2'
                   ,'24-10-3'
                   ,'24-10-4'
                   ,'24-11-1'
                   ,'24-11-2'
                   ,'24-11-3'
                   ,'24-11-4'
                   ,'24-12-1'
                   ,'24-12-2'
                   ,'24-12-3'
                   ,'24-12-4'
                   ,'24-13-1'
                   ,'24-13-2'
                   ,'24-13-3'
                   ,'24-13-4'
                   ,'24-14-1'
                   ,'24-14-2'
                   ,'24-14-3'
                   ,'24-14-4'
                   ,'24-15-1'
                   ,'24-15-2'
                   ,'24-15-3'
                   ,'24-15-4'
                   ,'24-16-1'
                   ,'24-16-2'
                   ,'24-16-3'
                   ,'24-16-4'
                   ,'24-17-1'
                   ,'24-17-2'
                   ,'24-17-3'
                   ,'24-17-4'
                   ,'24-18-1'
                   ,'24-18-2'
                   ,'24-18-3'
                   ,'24-18-4'
                   ,'24-19-1'
                   ,'24-19-2'
                   ,'24-19-3'
                   ,'24-19-4'
                   ,'24-19-5'
                   ,'24-20-1'
                   ,'24-20-2'
                   ,'24-20-3'
                   ,'24-20-4'
                   ,'24-20-5'
                   -- 초경
                   ,'5002'
                   ,'20-0-1'
                   ,'20-0-2'
                   ,'20-0-3'
                   ,'20-0-4'
                   ,'20-0-5'
                   ,'20-0-6'
                   ,'20-0-7'
                   ,'20-0-8'
                   ,'20-0-9'
                   ,'20-0-10'
                   -- 폐경, 여성호르몬치료
                   ,'5007'
                   ,'21-0-1'
                   ,'21-0-2'
                   ,'21-0-3'
                   ,'21-0-4'
                   ,'21-2-1'
                   ,'21-2-2'
                   ,'21-2-3'
                   ,'21-2-4'
                   ,'21-2-5'
                   ,'22-1-1'
                   ,'22-1-2'
                   ,'22-1-3'
                   ,'22-1-4'
                   ,'22-1-5'
                   ,'22-2-1'
                   ,'22-2-2'
                   -- 출산, 유산, 조산
                   ,'5011'
                   ,'23-1-1'
                   ,'23-1-2'
                   ,'23-1-3'
                   ,'23-1-4'
                   ,'23-1-5'
                   ,'23-1-6'
                   ,'23-1-7'
                   ,'23-1-8'
                   ,'23-1-9'
                   ,'23-1-10'
                   ,'23-3-3'
                   ,'23-3-4'
                   ,'23-3-5'
                   ,'23-3-6'
                   ,'23-3-7'
                   ,'23-3-8'
                   ,'23-3-9'
                   ,'23-3-10'
                   ,'23-3-11'
                   ,'23-3-12'
                   ,'23-3-13'
                   ,'23-3-14'
                   ,'23-3-15'
                   ,'23-3-16'
                   ,'23-3-17'
                   ,'23-3-18'
                   ,'23-3-19'
                   ,'23-3-20'
                   ,'23-3-21'
                   ,'23-3-22'
                   ,'23-4-3'
                   ,'23-4-4'
                   ,'23-4-5'
                   ,'23-4-6'
                   ,'23-4-7'
                   ,'23-4-8'
                   ,'23-4-9'
                   ,'23-4-10'
                   ,'23-4-11'
                   ,'23-4-12'
                   -- 전립선, 남성의학
                   ,'19-1-0'
                   ,'19-1-1'
                   ,'19-1-2'
                   ,'19-1-3'
                   ,'19-1-4'
                   ,'19-1-5'
                   ,'19-2-0'
                   ,'19-2-1'
                   ,'19-2-2'
                   ,'19-2-3'
                   ,'19-2-4'
                   ,'19-2-5'
                   ,'19-3-0'
                   ,'19-3-1'
                   ,'19-3-2'
                   ,'19-3-3'
                   ,'19-3-4'
                   ,'19-3-5'
                   ,'19-4-0'
                   ,'19-4-1'
                   ,'19-4-2'
                   ,'19-4-3'
                   ,'19-4-4'
                   ,'19-4-5'
                   ,'19-5-0'
                   ,'19-5-1'
                   ,'19-5-2'
                   ,'19-5-3'
                   ,'19-5-4'
                   ,'19-5-5'
                   ,'19-6-0'
                   ,'19-6-1'
                   ,'19-6-2'
                   ,'19-6-3'
                   ,'19-6-4'
                   ,'19-6-5'
                   ,'19-7-0'
                   ,'19-7-1'
                   ,'19-7-2'
                   ,'19-7-3'
                   ,'19-7-4'
                   ,'19-7-5'
                   ,'19-8-0'
                   ,'19-8-1'
                   ,'19-8-2'
                   ,'19-8-3'
                   ,'19-8-4'
                   ,'19-8-5'
                   ,'19-8-6'
                   -- 계통별, 소화기
                   ,'10-0-2'
                   ,'10-0-5'
                   ,'3002'
                   ,'10-0-4'
                   -- 계통별, 호흡기
                   ,'11-0-1'
                   ,'11-0-2'
                   ,'11-0-3'
                   ,'11-0-4'
                   ,'11-0-5'
                   ,'3004'
                   -- 계통별, 신장/요로/비뇨기
                   ,'12-0-2'
                   ,'12-0-3'
                   ,'12-0-8'
                   ,'12-0-10'
                   ,'3006'
                   ,'3005'
                   -- 계통별, 치과
                   ,'17-0-1'
                   ,'17-0-2'
                   ,'17-0-3'
                   ,'17-0-5'
                   ,'17-0-6'
                   ,'3009'
                   -- 계통별, 심장/혈관
                   ,'13-0-1'
                   ,'13-0-2'
                   ,'13-0-3'
                   ,'3003'
                   -- 계통별, 신경/정신
                   ,'15-0-1'
                   ,'15-0-2'
                   ,'15-0-3'
                   ,'15-0-5'
                   ,'15-0-6'
                   ,'15-0-7'
                   ,'15-0-8'
                   ,'15-0-9'
                   ,'3007'
                   ,'3001'
                   -- 계통별, 기타
                   ,'18-0-1'
                   ,'18-0-2'
                   ,'18-0-3'
                   ,'18-0-5'
                   ,'18-0-7'
                   ,'18-0-8'
                   ,'18-0-9'
                   ,'18-0-13'
                   ,'3008'
                   ,'3001'
                   -- 과거질환
                   ,'9001'
                   ,'6-1-1-1'
                   ,'6-1-1-2'
                   ,'6-1-1-3'
                   ,'6-1-2-1'
                   ,'6-1-2-2'
                   ,'6-1-2-3'
                   ,'6-1-3-1'
                   ,'6-1-3-2'
                   ,'6-1-3-3'
                   ,'6-1-4-1'
                   ,'6-1-4-2'
                   ,'6-1-4-3'
                   ,'6-1-4-4'
                   ,'6-1-4-5'
                   ,'6-1-5-1'
                   ,'6-1-5-2'
                   ,'6-1-5-3'
                   ,'6-1-5-4'
                   ,'6-1-5-5'
                   ,'6-1-6-1'
                   ,'6-1-6-2'
                   ,'6-1-6-3'
                   ,'6-1-6-4'
                   ,'6-1-6-5'
                   ,'6-1-7-1'
                   ,'6-1-7-2'
                   ,'6-1-7-3'
                   ,'6-1-8-1'
                   ,'6-1-8-2'
                   ,'6-1-8-3'
                   ,'6-1-9-1'
                   ,'6-1-9-2'
                   ,'6-1-9-3'
                   ,'6-1-10-1'
                   ,'6-1-10-2'
                   ,'6-1-10-3'
                   ,'6-1-11-1'
                   ,'6-1-11-2'
                   ,'6-1-11-3'
                   ,'6-1-11-4'
                   ,'6-1-11-5'
                   ,'6-1-12-1'
                   ,'6-1-12-2'
                   ,'6-1-12-3'
                   ,'6-1-13-1'
                   ,'6-1-13-2'
                   ,'6-1-13-3'
                   ,'6-1-13-4'
                   ,'6-1-13-5'
                   ,'6-1-14-1'
                   ,'6-1-14-2'
                   ,'6-1-14-3'
                   ,'6-1-15-1'
                   ,'6-1-15-2'
                   ,'6-1-15-3'
                   ,'6-1-16-1'
                   ,'6-1-16-2'
                   ,'6-1-16-3'
                   ,'6-1-16-4'
                   ,'6-1-16-5'
                   ,'6-1-17-1'
                   ,'6-1-17-2'
                   ,'6-1-17-3'
                   ,'6-1-17-4'
                   ,'6-1-17-5'
                   ,'6-1-18-1'
                   ,'6-1-18-2'
                   ,'6-1-18-3'
                   ,'6-1-18-4'
                   ,'6-1-18-5'
                   ,'6-1-19-1'
                   ,'6-1-19-2'
                   ,'6-1-19-3'
                   ,'6-1-19-4'
                   ,'6-1-19-5'
                   ,'6-1-20-1'
                   ,'6-1-20-2'
                   ,'6-1-20-3'
                   ,'6-1-20-4'
                   ,'6-1-20-5'
                   ,'6-1-21-1'
                   ,'6-1-21-2'
                   ,'6-1-21-3'
                   ,'6-1-21-4'
                   ,'6-1-21-5'
                   ,'6-1-22-1'
                   ,'6-1-22-2'
                   ,'6-1-22-3'
                   ,'6-1-22-4'
                   ,'6-1-22-5'
                   ,'6-1-23-1'
                   ,'6-1-23-2'
                   ,'6-1-23-3'
                   ,'6-1-23-4'
                   ,'6-1-23-5'
                   ,'6-1-24-1'
                   ,'6-1-24-2'
                   ,'6-1-24-3'
                   ,'6-1-24-4'
                   ,'6-1-24-5'
                   ,'6-1-25-1'
                   ,'6-1-25-2'
                   ,'6-1-25-3'
                   ,'6-1-25-4'
                   ,'6-1-25-5'
                   ,'6-1-26-1'
                   ,'6-1-26-2'
                   ,'6-1-26-3'
                   ,'6-1-26-4'
                   ,'6-1-26-5'
                   ,'6-1-27-1'
                   ,'6-1-27-2'
                   ,'6-1-27-3'
                   ,'6-1-27-4'
                   ,'6-1-27-5'
                   ,'6-1-28-1'
                   ,'6-1-28-2'
                   ,'6-1-28-3'
                   ,'6-1-28-4'
                   ,'6-1-28-5'
                   -- 약복용력
                   ,'9002'
                   ,'7-1-1-1'
                   ,'7-1-1-2'
                   ,'7-1-2-1'
                   ,'7-1-2-2'
                   ,'7-1-3-1'
                   ,'7-1-3-2'
                   ,'7-1-4-1'
                   ,'7-1-4-2'
                   ,'7-1-5-1'
                   ,'7-1-5-2'
                   ,'7-1-6-1'
                   ,'7-1-6-2'
                   ,'7-1-7-1'
                   ,'7-1-7-2'
                   ,'7-1-8-1'
                   ,'7-1-8-2'
                   ,'7-1-9-1'
                   ,'7-1-9-2'
                   ,'7-1-10-1'
                   ,'7-1-10-2'
                   ,'7-1-11-1'
                   ,'7-1-11-2'
                   ,'7-1-12-1'
                   ,'7-1-12-2'
                   ,'7-1-13-1'
                   ,'7-1-13-2'
                   ,'7-1-14-1'
                   ,'7-1-14-2'
                   ,'7-1-15-1'
                   ,'7-1-15-2'
                   ,'7-1-16-1'
                   ,'7-1-16-2'
                   ,'7-1-17-1'
                   ,'7-1-17-2'
                   ,'7-1-18-1'
                   ,'7-1-18-2'
                   ,'7-1-19-1'
                   ,'7-1-19-2'
                   ,'7-1-20-1'
                   ,'7-1-20-2'
                   ,'7-1-21-1'
                   ,'7-1-21-2'
                   -- 암질병력
                   ,'8-1-1-1'
                   ,'8-1-1-2'
                   ,'8-1-1-3'
                   ,'8-1-1-4'
                   ,'8-1-1-5'
                   ,'8-1-2-1'
                   ,'8-1-2-2'
                   ,'8-1-2-3'
                   ,'8-1-2-4'
                   ,'8-1-2-5'
                   ,'8-1-3-1'
                   ,'8-1-3-2'
                   ,'8-1-3-3'
                   ,'8-1-3-4'
                   ,'8-1-3-5'
                   ,'8-1-4-1'
                   ,'8-1-4-2'
                   ,'8-1-4-3'
                   ,'8-1-4-4'
                   ,'8-1-4-5'
                   ,'8-1-5-1'
                   ,'8-1-5-2'
                   ,'8-1-5-3'
                   ,'8-1-5-4'
                   ,'8-1-5-5'
                   ,'8-1-6-1'
                   ,'8-1-6-2'
                   ,'8-1-6-3'
                   ,'8-1-6-4'
                   ,'8-1-6-5'
                   ,'8-1-7-1'
                   ,'8-1-7-2'
                   ,'8-1-7-3'
                   ,'8-1-7-4'
                   ,'8-1-7-5'
                   ,'8-1-8-1'
                   ,'8-1-8-2'
                   ,'8-1-8-3'
                   ,'8-1-8-4'
                   ,'8-1-8-5'
                   ,'8-1-9-1'
                   ,'8-1-9-2'
                   ,'8-1-9-3'
                   ,'8-1-9-4'
                   ,'8-1-9-5'
                   ,'8-1-10-1'
                   ,'8-1-10-2'
                   ,'8-1-10-3'
                   ,'8-1-10-4'
                   ,'8-1-10-5'
                   ,'8-1-11-1'
                   ,'8-1-11-2'
                   ,'8-1-11-3'
                   ,'8-1-11-4'
                   ,'8-1-11-5'
                   ,'8-1-12-1'
                   ,'8-1-12-2'
                   ,'8-1-12-3'
                   ,'8-1-12-4'
                   ,'8-1-12-5'
                   ,'8-1-13-1'
                   ,'8-1-13-2'
                   ,'8-1-13-3'
                   ,'8-1-13-4'
                   ,'8-1-13-5'
                   ,'8-1-14-1'
                   ,'8-1-14-2'
                   ,'8-1-14-3'
                   ,'8-1-14-4'
                   ,'8-1-14-5'
                   -- 가족력
                   ,'9003'
                   ,'9-1-1-1'
                   ,'9-1-1-2'
                   ,'9-1-1-3'
                   ,'9-1-1-4'
                   ,'9-1-1-5'
                   ,'9-1-1-6'
                   ,'9-1-1-7'
                   ,'9-1-1-8'
                   ,'9-1-2-1'
                   ,'9-1-2-2'
                   ,'9-1-2-3'
                   ,'9-1-2-4'
                   ,'9-1-2-5'
                   ,'9-1-2-6'
                   ,'9-1-2-7'
                   ,'9-1-2-8'
                   ,'9-1-3-1'
                   ,'9-1-3-2'
                   ,'9-1-3-3'
                   ,'9-1-3-4'
                   ,'9-1-3-5'
                   ,'9-1-3-6'
                   ,'9-1-3-7'
                   ,'9-1-3-8'
                   ,'9-1-4-1'
                   ,'9-1-4-2'
                   ,'9-1-4-3'
                   ,'9-1-4-4'
                   ,'9-1-4-5'
                   ,'9-1-4-6'
                   ,'9-1-4-7'
                   ,'9-1-4-8'
                   ,'9-1-5-1'
                   ,'9-1-5-2'
                   ,'9-1-5-3'
                   ,'9-1-5-4'
                   ,'9-1-5-5'
                   ,'9-1-5-6'
                   ,'9-1-5-7'
                   ,'9-1-5-8'
                   ,'9-1-6-1'
                   ,'9-1-6-2'
                   ,'9-1-6-3'
                   ,'9-1-6-4'
                   ,'9-1-6-5'
                   ,'9-1-6-6'
                   ,'9-1-6-7'
                   ,'9-1-6-8'
                   ,'9-1-7-1'
                   ,'9-1-7-2'
                   ,'9-1-7-3'
                   ,'9-1-7-4'
                   ,'9-1-7-5'
                   ,'9-1-7-6'
                   ,'9-1-7-7'
                   ,'9-1-7-8'
                   ,'9-1-8-1'
                   ,'9-1-8-2'
                   ,'9-1-8-3'
                   ,'9-1-8-4'
                   ,'9-1-8-5'
                   ,'9-1-8-6'
                   ,'9-1-8-7'
                   ,'9-1-8-8'
                   ,'9-1-9-1'
                   ,'9-1-9-2'
                   ,'9-1-9-3'
                   ,'9-1-9-4'
                   ,'9-1-9-5'
                   ,'9-1-9-6'
                   ,'9-1-9-7'
                   ,'9-1-9-8'
                   ,'9-1-10-1'
                   ,'9-1-10-2'
                   ,'9-1-10-3'
                   ,'9-1-10-4'
                   ,'9-1-10-5'
                   ,'9-1-10-6'
                   ,'9-1-10-7'
                   ,'9-1-10-8'
                   ,'9-1-11-1'
                   ,'9-1-11-2'
                   ,'9-1-11-3'
                   ,'9-1-11-4'
                   ,'9-1-11-5'
                   ,'9-1-11-6'
                   ,'9-1-11-7'
                   ,'9-1-11-8'
                   ,'9-1-12-1'
                   ,'9-1-12-2'
                   ,'9-1-12-3'
                   ,'9-1-12-4'
                   ,'9-1-12-5'
                   ,'9-1-12-6'
                   ,'9-1-12-7'
                   ,'9-1-12-8'
                   ,'9-1-13-1'
                   ,'9-1-13-2'
                   ,'9-1-13-3'
                   ,'9-1-13-4'
                   ,'9-1-13-5'
                   ,'9-1-13-6'
                   ,'9-1-13-7'
                   ,'9-1-13-8'
                   ,'9-1-14-1'
                   ,'9-1-14-2'
                   ,'9-1-14-3'
                   ,'9-1-14-4'
                   ,'9-1-14-5'
                   ,'9-1-14-6'
                   ,'9-1-14-7'
                   ,'9-1-14-8'
                   ,'9-1-15-1'
                   ,'9-1-15-2'
                   ,'9-1-15-3'
                   ,'9-1-15-4'
                   ,'9-1-15-5'
                   ,'9-1-15-6'
                   ,'9-1-15-7'
                   ,'9-1-15-8'
                   ,'9-1-16-1'
                   ,'9-1-16-2'
                   ,'9-1-16-3'
                   ,'9-1-16-4'
                   ,'9-1-16-5'
                   ,'9-1-16-6'
                   ,'9-1-16-7'
                   ,'9-1-16-8'
                   ,'9-1-17-1'
                   ,'9-1-17-2'
                   ,'9-1-17-3'
                   ,'9-1-17-4'
                   ,'9-1-17-5'
                   ,'9-1-17-6'
                   ,'9-1-17-7'
                   ,'9-1-17-8'
                   ,'9-1-18-1'
                   ,'9-1-18-2'
                   ,'9-1-18-3'
                   ,'9-1-18-4'
                   ,'9-1-18-5'
                   ,'9-1-18-6'
                   ,'9-1-18-7'
                   ,'9-1-18-8'
                   ,'9-1-19-1'
                   ,'9-1-19-2'
                   ,'9-1-19-3'
                   ,'9-1-19-4'
                   ,'9-1-19-5'
                   ,'9-1-19-6'
                   ,'9-1-19-7'
                   ,'9-1-19-8'
                   ,'9-1-20-1'
                   ,'9-1-20-2'
                   ,'9-1-20-3'
                   ,'9-1-20-4'
                   ,'9-1-20-5'
                   ,'9-1-20-6'
                   ,'9-1-20-7'
                   ,'9-1-20-8'
                   )
   AND F.QCODE1 = G.QCODE
 GROUP BY A.PATNO, A.ORDDATE

-- 영양분석설문
SELECT H.PATNO, H.ORDDATE
--     , CASE WHEN LENGTH(SUBSTR(H.PATNO,1,5)||((789+SUBSTR(H.PATNO,6))||SUBSTR(H.PATNO,6))) = '11'
--            THEN '0'||SUBSTR(H.PATNO,1,5)||((789+SUBSTR(H.PATNO,6))||SUBSTR(H.PATNO,6))
--       ELSE SUBSTR(H.PATNO,1,5)||((789+SUBSTR(H.PATNO,6))||SUBSTR(H.PATNO,6)) END PATNO2
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH32N005',I.QCODENM
                                     ,'QH32N010',I.QCODENM
                                     ,'QH32N011',I.QCODENM
                                     ,'QH32N012',I.QCODENM
                                     ,'QH32N013',I.QCODENM
                                     ,'QH32N014',I.QCODENM
                                     ,'QH32N015',I.QCODENM
                                     ,'QH32N016',I.QCODENM
                                     ,''))                      SOJUNUM
      , MAX(DECODE(H.QCODE1||H.ACODE2,'QH32N149',J.QCODENM
                                     ,'QH32N144',J.QCODENM
                                     ,'QH32N145',J.QCODENM
                                     ,'QH32N146',J.QCODENM
                                     ,'QH32N147',J.QCODENM
                                     ,'QH32N148',J.QCODENM
                                     ,''))                      SOJUAMT
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH33N005',I.QCODENM
                                     ,'QH33N010',I.QCODENM
                                     ,'QH33N011',I.QCODENM
                                     ,'QH33N012',I.QCODENM
                                     ,'QH33N013',I.QCODENM
                                     ,'QH33N014',I.QCODENM
                                     ,'QH33N015',I.QCODENM
                                     ,'QH33N016',I.QCODENM
                                     ,''))                      BEERNUM
      , MAX(DECODE(H.QCODE1||H.ACODE2,'QH33N143',J.QCODENM
                                     ,'QH33N144',J.QCODENM
                                     ,'QH33N145',J.QCODENM
                                     ,'QH33N146',J.QCODENM
                                     ,'QH33N147',J.QCODENM
                                     ,'QH33N148',J.QCODENM
                                     ,''))                      BEERAMT
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH34N005',I.QCODENM
                                     ,'QH34N010',I.QCODENM
                                     ,'QH34N011',I.QCODENM
                                     ,'QH34N012',I.QCODENM
                                     ,'QH34N013',I.QCODENM
                                     ,'QH34N014',I.QCODENM
                                     ,'QH34N015',I.QCODENM
                                     ,'QH34N016',I.QCODENM
                                     ,''))                      YANGJUNUM
      , MAX(DECODE(H.QCODE1||H.ACODE2,'QH34N150',J.QCODENM
                                     ,'QH34N144',J.QCODENM
                                     ,'QH34N145',J.QCODENM
                                     ,'QH34N146',J.QCODENM
                                     ,'QH34N147',J.QCODENM
                                     ,'QH34N148',J.QCODENM
                                     ,''))                      YANGJUAMT
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH35N005',I.QCODENM
                                     ,'QH35N010',I.QCODENM
                                     ,'QH35N011',I.QCODENM
                                     ,'QH35N012',I.QCODENM
                                     ,'QH35N013',I.QCODENM
                                     ,'QH35N014',I.QCODENM
                                     ,'QH35N015',I.QCODENM
                                     ,'QH35N016',I.QCODENM
                                     ,''))                      CHUNGJUNUM
      , MAX(DECODE(H.QCODE1||H.ACODE2,'QH35N151',J.QCODENM
                                     ,'QH35N144',J.QCODENM
                                     ,'QH35N145',J.QCODENM
                                     ,'QH35N146',J.QCODENM
                                     ,'QH35N147',J.QCODENM
                                     ,'QH35N148',J.QCODENM
                                     ,''))                      CHUNGJUAMT
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH36N005',I.QCODENM
                                     ,'QH36N010',I.QCODENM
                                     ,'QH36N011',I.QCODENM
                                     ,'QH36N012',I.QCODENM
                                     ,'QH36N013',I.QCODENM
                                     ,'QH36N014',I.QCODENM
                                     ,'QH36N015',I.QCODENM
                                     ,'QH36N016',I.QCODENM
                                     ,''))                      WINENUM
      , MAX(DECODE(H.QCODE1||H.ACODE2,'QH36N152',J.QCODENM
                                     ,'QH36N144',J.QCODENM
                                     ,'QH36N145',J.QCODENM
                                     ,'QH36N146',J.QCODENM
                                     ,'QH36N147',J.QCODENM
                                     ,'QH36N153',J.QCODENM
                                     ,''))                      WINEAMT
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH37N005',I.QCODENM
                                     ,'QH37N050',I.QCODENM
                                     ,'QH37N051',I.QCODENM
                                     ,'QH37N052',I.QCODENM
                                     ,'QH37N053',I.QCODENM
                                     ,'QH37N054',I.QCODENM
                                     ,'QH37N059',I.QCODENM
                                     ,''))                      GREENTEANUM
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QS01N005',I.QCODENM
                                     ,'QS01N050',I.QCODENM
                                     ,'QS01N051',I.QCODENM
                                     ,'QS01N052',I.QCODENM
                                     ,'QS01N053',I.QCODENM
                                     ,'QS01N054',I.QCODENM
                                     ,'QS01N055',I.QCODENM
                                     ,'QS01N056',I.QCODENM
                                     ,'QS01N057',I.QCODENM
                                     ,''))                      COFFEENUM
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QN02N058',I.QCODENM
                                     ,'QN02N060',I.QCODENM
                                     ,'QN02N061',I.QCODENM
                                     ,'QN02N062',I.QCODENM
                                     ,'QN02N063',I.QCODENM
                                     ,''))                      COFFEE_SUGARNUM
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QN03N058',I.QCODENM
                                     ,'QN03N060',I.QCODENM
                                     ,'QN03N061',I.QCODENM
                                     ,'QN03N062',I.QCODENM
                                     ,'QN03N063',I.QCODENM
                                     ,''))                      COFFEE_CREAMNUM
      , MAX(DECODE(H.QCODE1||H.ACODE1,'QH40N005',I.QCODENM
                                     ,'QH40N154',I.QCODENM
                                     ,'QH40N155',I.QCODENM
                                     ,'QH40N156',I.QCODENM
                                     ,'QH40N157',I.QCODENM
                                     ,'QH40N158',I.QCODENM
                                     ,'QH40N159',I.QCODENM
                                     ,''))                      WATERNUM
  FROM (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A, SMPKGMST B
         WHERE-- a.patno = ''
         --AND
               A.ORDDATE BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) A
     , SMQUESAT H, SMQUESMT I, SMQUESMT J, SMQUESMT K
 WHERE A.PATNO = H.PATNO
   AND A.ORDDATE = H.ORDDATE
   AND H.QPKG IN ('FXXD','FOOD')
   AND SUBSTR(H.QCODE1||H.ACODE1,-4) = I.QCODE
   AND SUBSTR(H.QCODE1||H.ACODE2,-4) = J.QCODE
   AND SUBSTR(H.QCODE1||H.ACODE3,-4) = K.QCODE
 GROUP BY H.PATNO, H.ORDDATE;

-- 건강보조식품...
SELECT C.PATNO, C.ORDDATE
--     , CASE WHEN LENGTH(SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))) = '11'
--            THEN '0'||SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6))
--       ELSE SUBSTR(A.PATNO,1,5)||((789+SUBSTR(A.PATNO,6))||SUBSTR(A.PATNO,6)) END PATNO2
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12601',B.QCODENM,'')) HEALTH_SUPPLEMENT01
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12602',B.QCODENM,'')) HEALTH_SUPPLEMENT02
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12603',B.QCODENM,'')) HEALTH_SUPPLEMENT03
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12604',B.QCODENM,'')) HEALTH_SUPPLEMENT04
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12605',B.QCODENM,'')) HEALTH_SUPPLEMENT05
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12606',B.QCODENM,'')) HEALTH_SUPPLEMENT06
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12607',B.QCODENM,'')) HEALTH_SUPPLEMENT07
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12608',B.QCODENM,'')) HEALTH_SUPPLEMENT08
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12609',B.QCODENM,'')) HEALTH_SUPPLEMENT09
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12610',B.QCODENM,'')) HEALTH_SUPPLEMENT10
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12611',B.QCODENM,'')) HEALTH_SUPPLEMENT11
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12621',B.QCODENM,'')) HEALTH_SUPPLEMENT12
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12622',B.QCODENM,'')) HEALTH_SUPPLEMENT13
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12623',B.QCODENM,'')) HEALTH_SUPPLEMENT14
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12624',B.QCODENM,'')) HEALTH_SUPPLEMENT15
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12625',B.QCODENM,'')) HEALTH_SUPPLEMENT16
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12626',B.QCODENM,'')) HEALTH_SUPPLEMENT17
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12627',B.QCODENM,'')) HEALTH_SUPPLEMENT18
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12628',B.QCODENM,'')) HEALTH_SUPPLEMENT19
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12629',B.QCODENM,'')) HEALTH_SUPPLEMENT20
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12630',B.QCODENM,'')) HEALTH_SUPPLEMENT21
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12631',B.QCODENM,'')) HEALTH_SUPPLEMENT22
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12632',B.QCODENM,'')) HEALTH_SUPPLEMENT23
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12633',B.QCODENM,'')) HEALTH_SUPPLEMENT24
     , MAX(DECODE(A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE,'N2C12634',B.QCODENM,'')) HEALTH_SUPPLEMENT25
  FROM
       (
        SELECT A.PATNO, A.ORDDATE
          FROM SMRSV00T A, SMPKGMST B
         WHERE-- a.patno = ''
         --AND
               A.ORDDATE BETWEEN TO_DATE('20100101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
           AND A.CANCELTIME IS NULL
           AND A.PKGCODE = B.PKGCODE
           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
       ) C
     , SMFOODST A, SMQUESMT B
 WHERE C.PATNO = A.PATNO
   AND C.ORDDATE = A.ORDDATE
   AND A.QPKG||A.QTYP||A.QSEQ||A.ANSCODE = B.QCODE
 GROUP BY C.PATNO, C.ORDDATE

-- 상병코드찾기
SELECT DISTINCT DIAGCODE
  FROM MRDIAGCT C
 WHERE (C.DIAGCODE LIKE 'J45.%'
       OR
        C.DIAGCODE LIKE 'J44.%'
       OR
        C.DIAGCODE LIKE 'L20.%'
       OR
        C.DIAGCODE LIKE 'H10.1'
       OR
        C.DIAGCODE LIKE 'J30.1%'
       OR
        C.DIAGCODE LIKE 'J30.2%'
       OR
        C.DIAGCODE LIKE 'J30.3%'
       OR
        C.DIAGCODE LIKE 'J30.4%'
       OR
        C.DIAGCODE LIKE 'I60.%8%'
       OR
        C.DIAGCODE LIKE 'I61.%'
       OR
        C.DIAGCODE LIKE 'I63.%'
       OR
        C.DIAGCODE LIKE 'I67.1'
       OR
        C.DIAGCODE LIKE 'I20.0'
       OR
        C.DIAGCODE LIKE 'I20.1'
       OR
        C.DIAGCODE LIKE 'I20.8'
       OR
        C.DIAGCODE LIKE 'I20.9'
       OR
        C.DIAGCODE LIKE 'I21.0'
       OR
        C.DIAGCODE LIKE 'I21.1'
       OR
        C.DIAGCODE LIKE 'I21.2'
       OR
        C.DIAGCODE LIKE 'I21.3'
       OR
        C.DIAGCODE LIKE 'I21.9'
       OR
        C.DIAGCODE LIKE 'I24.9'
       OR
        C.DIAGCODE LIKE 'G47.30'
       OR
        C.DIAGCODE LIKE 'G47.31'
       OR
        C.DIAGCODE LIKE 'G47.4'
       OR
        C.DIAGCODE LIKE 'G47.8'
       OR
        C.DIAGCODE LIKE 'G47.9'
       OR
        C.DIAGCODE LIKE 'M80.%'
       OR
        C.DIAGCODE LIKE 'M81.%'
       OR
        C.DIAGCODE LIKE 'M82.%'
       )

-- 수면다원검사결과
SELECT A.PATNO, a.fstdate, A.ORDDATE, A.ORDCODE
     , B.RSLTTEXT
  FROM (
        SELECT A.*, B.ORDCODE, B.ORDSEQNO
          FROM (
                SELECT A.PATNO, a.fstdate, MIN(B.ORDDATE) ORDDATE
                  FROM (
                        SELECT A.PATNO, min(orddate) fstdate
                          FROM SMRSV00T A, SMPKGMST B
                         WHERE-- a.patno = ''
                           --AND
                               A.ORDDATE BETWEEN TO_DATE('19950101','YYYYMMDD') AND TO_DATE('20140531','YYYYMMDD')
                           AND A.CANCELTIME IS NULL
                           AND A.PKGCODE = B.PKGCODE
                           AND SUBSTR(B.PKGTYP,1,1) IN ('0','1','2','3','4')
                         group by a.patno
                       ) A
                     , MMEXMORT B
                 WHERE A.PATNO = B.PATNO
                   AND B.ORDCODE IN ('BS1331', 'BS1351', 'BS1341', 'BS1302', 'BS1301A', 'BS1301','BS1300', 'BS1341', 'BS1351')
                   AND B.PROCSTAT > 'C'
                 GROUP BY A.PATNO, a.fstdate
               ) A
             , MMEXMORT B
         WHERE A.PATNO = B.PATNO
           AND A.ORDDATE = B.ORDDATE
           AND B.ORDCODE IN ('BS1331', 'BS1351', 'BS1341', 'BS1302', 'BS1301A', 'BS1301','BS1300', 'BS1341', 'BS1351')
           AND B.PROCSTAT > 'C'
       ) A
     , STRESULT B
 WHERE A.PATNO = B.PATNO
   AND A.ORDDATE = B.ORDDATE
--   AND A.ORDCODE = B.ORDCODE
   AND A.ORDSEQNO = B.ORDSEQNO
   AND NVL(B.MODIFYYN,'N') != 'Y'
-- GROUP BY A.PATNO, A.ORDDATE, A.ORDCODE
