-- ANIMAL_INS
-- 이름이 없는 동물, 동물ID 오름차순
SELECT  ANIMAL_ID
  FROM  ANIMAL_INS
 WHERE  NAME IS NULL
 ORDER BY ANIMAL_ID