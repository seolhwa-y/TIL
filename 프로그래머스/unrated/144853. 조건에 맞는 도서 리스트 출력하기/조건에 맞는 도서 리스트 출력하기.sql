-- BOOK 2021년에 출판된 인문 카테고리
-- 도서ID, 출판일
-- 출판일 오름차순

SELECT  BOOK_ID AS 도서ID,
        TO_CHAR(PUBLISHED_DATE, 'YYYY-MM-DD') AS 출판일
FROM    BOOK
WHERE   CATEGORY = '인문' 
AND     TO_CHAR(PUBLISHED_DATE, 'YYYY') = '2021'
ORDER BY PUBLISHED_DATE