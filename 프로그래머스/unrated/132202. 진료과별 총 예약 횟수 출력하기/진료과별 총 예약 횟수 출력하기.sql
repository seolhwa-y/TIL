-- APPOINTMENT  
-- 2022-05 예약한 환자수
-- 진료과 코드별 예약 환자수, 진료과 코드

SELECT MCDP_CD AS 진료과코드,
       COUNT(*) AS "5월예약건수"
  FROM APPOINTMENT
 WHERE TO_CHAR(APNT_YMD, 'YYYY-MM') = '2022-05'
 GROUP BY MCDP_CD
 ORDER BY "5월예약건수", 진료과코드