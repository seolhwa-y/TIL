-- FIRST_HALF /  ICECREAM_INFO 
-- 상반기 총주문량 3000 초과 주성분 과일
-- 총주문량 오름차순

SELECT A.FLAVOR AS 아이스크림맛
  FROM FIRST_HALF A INNER JOIN ICECREAM_INFO B ON A.FLAVOR = B.FLAVOR AND B.INGREDIENT_TYPE = 'fruit_based'
 WHERE A.TOTAL_ORDER > 3000 
 ORDER BY A.TOTAL_ORDER DESC
 
/*
SELECT FLAVOR AS 아이스크림맛, TOTAL_ORDER
  FROM FIRST_HALF A 
 WHERE TOTAL_ORDER > 3000
   AND EXISTS (
                SELECT 1
                  FROM ICECREAM_INFO B
                 WHERE A.FLAVOR = B.FLAVOR
                   AND B.INGREDIENT_TYPE = 'fruit_based'
              )
 ORDER BY TOTAL_ORDER DESC
*/
 