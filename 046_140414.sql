SELECT  A.OPTION1 EXAMCODE, B.ORDNAME, A.OPTION2 RSLTCODE, A.OPTION3 RSLTNUM
      , DECODE(A.OPTION4,'1','동일'
                        ,'2','초과'
                        ,'3','미만'
                        ,'4','이상'
                        ,'5','이하'
                        ,'') QUALIFICATION, NVL(OPTION10,'N') ALLERTYN
  FROM CCCOMCDT A, MMORDRCT B
 WHERE A.GRPCODE = 'SM306'
--   AND A.OPTION7 = 'Z'
   AND A.OPTION9 = '29991231'
   AND A.OPTION1 = B.ORDCODE(+)
 ORDER BY 1, 2;
