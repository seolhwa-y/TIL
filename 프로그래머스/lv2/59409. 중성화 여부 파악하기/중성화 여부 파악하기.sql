-- ANIMAL_INS
-- SEX_UPON_INTAKE : Neutered = X / Spayed = O
-- 동물ID, 이름, 중성화여부
-- 동물ID

SELECT ANIMAL_ID, 
       NAME, 
       CASE WHEN SEX_UPON_INTAKE LIKE '%Intact%'
            THEN 'X'
            ELSE 'O'
       END AS SEX_UPON_INTAKE
  FROM ANIMAL_INS
 ORDER BY ANIMAL_ID