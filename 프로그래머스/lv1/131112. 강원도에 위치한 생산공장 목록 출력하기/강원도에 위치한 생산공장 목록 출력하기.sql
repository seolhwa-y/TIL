-- 강원도에 위치한 공장 SELECT
-- 공장 ID 오름차순
-- 공장 ID, 공장이름, 주소
SELECT  FACTORY_ID AS 공장ID,
        FACTORY_NAME AS 공장이름,
        ADDRESS AS 주소
FROM    FOOD_FACTORY
WHERE   ADDRESS LIKE '%강원도%'
ORDER BY FACTORY_ID