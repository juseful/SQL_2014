SELECT B.ORDNAME, A.*
  FROM SMCDRSMT A, MMORDRCT B
 WHERE A.EXAMCODE IN ('RG923C','RG923D','RG927C','RS1190')
   AND A.EXAMCODE = B.ORDCODE
 ORDER BY 2,3
