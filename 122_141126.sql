SELECT B.ORDNAME, A.*
  FROM SMCDRSMT A, MMORDRCT B
 WHERE A.EXAMCODE = B.ORDCODE
 ORDER BY 2,3;
