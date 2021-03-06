SELECT DISTINCT A.CODENAME, A.OPTION1, A.OPTION2
  FROM CCCOMCDT A
 WHERE GRPCODE = 'SMM35'
 ORDER BY 2

SELECT B.CODE, B.CODENAME, A.CODE, A.CODENAME, A.OPTION2 SEX, A.REMARK INFO
  FROM CCCOMCDT A, CCCOMCDT B
 WHERE A.GRPCODE = 'SMM641'
   AND B.GRPCODE = 'SMM64'
   AND A.OPTION1 = B.CODE;

SELECT A.OPTION1 ADDEXCD, B.ORDNAME, A.OPTION2 DELEXCD, C.ORDNAME
  FROM CCCOMCDT A, MMORDRCT B, MMORDRCT C
 WHERE A.GRPCODE = 'SMM642'
   AND A.OPTION1 = B.ORDCODE
   AND A.OPTION2 = C.ORDCODE;
