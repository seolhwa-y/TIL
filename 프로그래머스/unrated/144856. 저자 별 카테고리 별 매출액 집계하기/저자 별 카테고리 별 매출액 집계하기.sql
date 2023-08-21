-- BOOK / AUTHOR / BOOK_SALES
-- 2022-01 기준 저자/카테고리별 매출액(판매량 * 판매가), 저자ID, 저자명, 카테고리, 매출액 리스트 (저자ID 오름차순, 같다면 카테고리 내림차순)


SELECT  AU.AUTHOR_ID AS 저자ID,
        AU.AUTHOR_NAME AS 저자명,
        BO.CATEGORY AS 카테고리,
        SUM(BO.PRICE * BS.SALES) AS 매출액
FROM    BOOK BO INNER JOIN AUTHOR AU ON BO.AUTHOR_ID = AU.AUTHOR_ID
                INNER JOIN BOOK_SALES BS ON BO.BOOK_ID = BS.BOOK_ID            
WHERE   BS.SALES_DATE < TO_DATE('202202', 'YYYYMM')
GROUP BY AU.AUTHOR_ID, AU.AUTHOR_NAME, BO.CATEGORY
ORDER BY AU.AUTHOR_ID, BO.CATEGORY DESC

