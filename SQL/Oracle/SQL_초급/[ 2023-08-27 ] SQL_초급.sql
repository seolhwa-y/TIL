/* 2023-08-26 */

-- [초급] 026 날짜 간 개얼 수 출력하기 (MONTHS_BETWEEN)

-- 입사일부터 오늘까지 몇개월 근무했는가
SELECT ENAME,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH
  FROM EMP;
  
-- 2018.10.01  ~  2019.06.01 총일수 출력
SELECT TO_DATE('2019-06-01', 'YYYY-MM-DD') - TO_DATE('2018-10-01', 'YYYY-MM-DD') AS TOTAL_DAY
  FROM DUAL;

-- 2018.10.01  ~  2019.06.01 총주수 출력
SELECT ROUND((TO_DATE('2019-06-01', 'YYYY-MM-DD') - TO_DATE('2018-10-01', 'YYYY-MM-DD')) / 7) AS TOTAL_WEEKS
  FROM DUAL;
  
  

-- [초급] 027 개월 수 더한 날짜 출력하기 (ADD_MONTHS)

-- 2019.05.01에서 100달 뒤의 날짜
SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'YYYY-MM-DD'), 100) 
  FROM DUAL;

SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + INTERVAL '100' MONTH -- INTERVAL -- 
  FROM DUAL;

-- 2019.05.01에서 100일 뒤의 날짜
SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + 100 
  FROM DUAL;
  
-- 2019.05.01에서 1년 3개월 후 날짜
SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + INTERVAL '1-3' YEAR(1) TO MONTH
  FROM DUAL;
  
/* INTERVAL 표현식
 * INTERVAL '년/월/일/시간/분' YEAR/MONTH/DAY/HOUR/MIN(자리수)
 */
  
-- TO_YMINTERVAL :: 2019.05.01에서 3년 5개월 후 날짜 (YEAR MONTH INTERVAL)
SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + TO_YMINTERVAL('03-05') AS 날짜
  FROM DUAL;

  

-- [초급] 028 특정 날짜 뒤에 오는 요일 날짜 출력하기 (NEXT_DAY)

-- 2019.05.22 돌아오는 월요일
SELECT '2019-05-22', NEXT_DAY('2019-05-22', '월요일')
  FROM DUAL;

-- 오늘부터 돌아오는 화요일
SELECT SYSDATE, NEXT_DAY(SYSDATE, '화요일')
  FROM DUAL;

-- 2019.05.22 100달뒤 돌아오는 화요일
SELECT '2019-05-22', NEXT_DAY(ADD_MONTHS('2019-05-22', 100), '화요일')
  FROM DUAL;

-- 오늘부터 100달뒤 돌아오는 월요일
SELECT SYSDATE, NEXT_DAY(ADD_MONTHS(SYSDATE, 100), '월요일')
  FROM DUAL;



-- [초급] 029 특정 날짜가 있는 달의 마지막 날짜 출력하기 (LAST_DAY)

-- 2019.05.22 해당 달의 마지막 날짜
SELECT '2019-05-22', LAST_DAY('2019-05-22')
  FROM  DUAL;

-- 오늘부터 이번달 말일까지 몇 일 남았는가
SELECT SYSDATE, LAST_DAY(SYSDATE) - SYSDATE AS 남은일수
  FROM  DUAL;

-- 이름 = KING / 입사달 마지말 날짜
SELECT ENAME,
       HIREDATE,
       LAST_DAY(HIREDATE)
  FROM EMP
 WHERE ENAME = 'KING';