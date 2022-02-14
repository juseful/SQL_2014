SELECT A.CODE, A.OPTION1, B.ORDNAME, A.OPTION2, A.OPTION3--, A.OPTION4
      , DECODE(A.OPTION4,'1','동일'
                        ,'2','초과'
                        ,'3','미만'
                        ,'4','이상'
                        ,'5','이하'
                        ,'') QUALIFICATION
  FROM CCCOMCDT A, MMORDRCT B
 WHERE A.GRPCODE = 'SM306'
   AND A.OPTION7 = 'Z'
   AND A.OPTION9 = '29991231'
   AND A.OPTION1 = B.ORDCODE(+)
 ORDER BY 2,1;
