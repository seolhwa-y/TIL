-- REST_INFO / REST_REVIEW 
-- 서울에 위치한 식당
-- 식당ID, 식당이름, 음식종류, 즐겨찾기수, 주소, 리뷰평균 점수(소수점 3자리)
-- 평균점수 내림차순, 즐겨찾기수 내림차순
SELECT  RI.REST_ID AS 식당ID,
        RI.REST_NAME AS 식당이름,
        RI.FOOD_TYPE AS 음식종류,
        RI.FAVORITES AS 즐겨찾기수,
        RI.ADDRESS AS 주소,
        ROUND(AVG(RR.REVIEW_SCORE), 2) AS 평균점수
FROM    REST_INFO RI RIGHT OUTER JOIN REST_REVIEW RR ON RI.REST_ID = RR.REST_ID
WHERE   RI.ADDRESS LIKE '서울%'
GROUP BY RI.REST_ID,
        RI.REST_NAME,
        RI.FOOD_TYPE,
        RI.FAVORITES,
        RI.ADDRESS
ORDER BY ROUND(AVG(RR.REVIEW_SCORE), 2) DESC, RI.FAVORITES DESC