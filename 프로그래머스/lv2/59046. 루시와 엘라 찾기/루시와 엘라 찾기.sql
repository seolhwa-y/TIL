-- ANIMAL_INS
-- 이름이 (Lucy, Ella, Pickle, Rogan, Sabrina, Mitty) 해당하는 동물
-- 동물ID 

SELECT  ANIMAL_ID, NAME, SEX_UPON_INTAKE
  FROM  ANIMAL_INS
 WHERE  NAME IN ('Lucy','Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
 ORDER BY ANIMAL_ID