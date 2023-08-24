-- DOCTOR
-- 진료과 흉부외과(CS), 일반외과(GS)
-- 고용일자 내림차순, 이름 오름차순
SELECT  DR_NAME, 
        DR_ID, 
        MCDP_CD, 
        TO_CHAR(HIRE_YMD, 'YYYY-MM-DD') AS HIRE_YMD
  FROM  DOCTOR
 WHERE  MCDP_CD IN ('CS', 'GS')
 ORDER BY HIRE_YMD DESC, DR_NAME