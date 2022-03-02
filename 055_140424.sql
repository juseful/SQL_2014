SELECT  A.OPTION1 EXAMCODE, B.ORDNAME, A.OPTION2 RSLTCODE
      , (
         SELECT X.RSLTCODENM
           FROM SMCDRSMT X
          WHERE A.OPTION1 = X.EXAMCODE
            AND A.OPTION2 = X.RSLTCODE
        ) RSLTCODENM
      , A.OPTION3--, A.OPTION4
      , DECODE(A.OPTION4,'1','동일'
                        ,'2','초과'
                        ,'3','미만'
                        ,'4','이상'
                        ,'5','이하'
                        ,'') QUALIFICATION
     , A.OPTION10 ALLERTYN
     , A.OPTION7 GUBUN
  FROM CCCOMCDT A, MMORDRCT B
 WHERE A.GRPCODE = 'SM306'
--   AND A.OPTION7 = 'Z'
   AND A.OPTION9 = '29991231'
   AND A.OPTION1 = B.ORDCODE(+)
 ORDER BY 1,3;
