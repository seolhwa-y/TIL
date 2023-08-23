/* 2023-08-23 */

-- [입문] 001 테이블에서 특정 열(COLUMN) 선택하기
 
-- 테이블 특정 칼럼 조회
SELECT EMPNO
       ,ENAME
       ,SAL
FROM   EMP;
 
-- 권장
SELECT empno
       ,ename
       ,sal
  FROM emp;



-- [입문] 002 테이블에서 모든 열(COLUMN) 출력하기

-- 테이블 전체 조회
SELECT *
  FROM EMP;
  
-- 테이블 전체 조회2
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  
-- 특정 칼럼 추가조회
SELECT EMP.DEPTNO AS 추가칼럼, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  


-- [입문] 003 칼럼 별칭을 사용하여 출력되는 칼럼명 변경하기

-- 사원번호, 사원이름, Salary 표기
SELECT EMPNO AS 사원번호,
       ENAME AS 사원이름,
       SAL AS "Salary" -- 대소문자를 구분하고 싶을 때 "문자" 
  FROM EMP;
  
-- 별칭이 유용한 경우 (수식 사용)
SELECT EMPNO, ENAME, SAL * (12 + 3000)
  FROM EMP;
SELECT EMPNO, ENAME, SAL * (12 + 3000) AS 월급
  FROM EMP;
  
-- 별칭이 유용한 경우 (ORDER BY)
SELECT EMPNO, ENAME, SAL * (12 + 3000) AS 월급
  FROM EMP
 ORDER BY 월급 DESC;
 


-- [입문] 004 연결 연산자 사용하기(||)

-- 이름과 월급 합쳐서 출력
SELECT ENAME || SAL
  FROM EMP;
  
-- 연결 연산자 사용시 유용해지는 경우
SELECT ENAME || '의 월급은 ' || SAL || '원 입니다.' AS 월급정보
  FROM EMP;
 


-- [입문] 005 중복된 데이터를 제거해서 출력하기(DISRINCT)

-- 중복된 직업 제거 (DISTINCT = UNIQUE)
SELECT DISTINCT JOB
  FROM EMP;
  
SELECT UNIQUE JOB
  FROM EMP;
 


-- [입문] 006 데이터를 정렬해서 출력하기(ORDER BY)

-- 월급이 낮은 사원부터 출력
SELECT ENAME, SAL
  FROM EMP
 ORDER BY SAL ASC; -- ASC는 기본 옵션이라 안적어도 된다. ( ASC : 오름차순, DESC : 내림차순 ) 
SELECT ENAME, SAL AS 월급
  FROM EMP
 ORDER BY 월급;
 
-- 정렬 방법이 여러개인 경우
SELECT ENAME, DEPTNO AS 부서번호, SAL AS 월급
  FROM EMP
 ORDER BY 부서번호, 월급 DESC; -- 부서번호를 먼저 오름차순으로 정렬 후 월급을 내림차순으로 정렬
 
-- ORDER BY에 칼럼이 아닌 숫자로 정렬
SELECT EMPNO AS 사원번호, ENAME, DEPTNO AS 부서번호, SAL AS 월급
  FROM EMP
 ORDER BY 3, 1, 4 DESC; -- SELECT에 적은 칼럼 순서 번호
  


-- [입문] 007 WHERE절 배우기 1 (숫자 데이터 검색)

-- 월급 3000인 사원 출력
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE SAL = 3000;

-- 월급이 3000 이상인 사원 출력
SELECT ENAME AS 사원이름, SAL AS 월급, JOB AS 직업
  FROM EMP
 WHERE SAL >= 3000;

SELECT ENAME AS 사원이름, SAL AS 월급, JOB AS 직업
  FROM EMP
 WHERE 월급 >= 3000; -- [오류 발생] WHERE절에는 ALIAS가 안먹힌다. 실행순서를 알아야 한다. FROM - WHERE - SELECT



-- [입문] 008 WHERE정 배우기 2 (문자와 날짜 검색)

-- 이름이 SCOTT인 사람
SELECT ENAME, SAL, JOB, HIREDATE, DEPTNO
  FROM EMP
 WHERE ENAME = 'SCOTT';

-- 입사일이 81년 11월 17일인 사람
SELECT ENAME, SAL, JOB, HIREDATE, DEPTNO
  FROM EMP
 WHERE HIREDATE = '81/11/17'; -- 날짜는 세션에 지정된 날짜 형식에 맞춰서 작성해야 한다.
 
-- 세션의 날짜 형식 확인 방법
SELECT *
  FROM NLS_SESSION_PARAMETERS
 WHERE PARAMETER = 'NLS_DATE_FORMAT';
 
-- 세션의 날짜형식 변경 방법
ALTER SESSION 
SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
 
-- 변경된 날짜 형식으로 다시 조회
SELECT ENAME, SAL, JOB, HIREDATE, DEPTNO
  FROM EMP
 WHERE HIREDATE = '1981-11-17';
  
-- 날짜 형식 중 YY와 RR : YY = 2012 / RR = 1912 로 인식한다. RR은 현재 세기 이전으로 인식 
  
  

-- [입문] 009 산술연산자 배우기 ( * , / , + , - )
  
-- 연봉이 36000 이상인 사람
SELECT ENAME, SAL * 12 AS 연봉
  FROM EMP
 WHERE SAL * 12 >= 36000; -- 산술연산자에는 우선순위가 있으므로 곱하기부터 실행한다. 만약 더하기 먼저 해야하면 괄호를 써라.
  
-- 부서번호가 10번인 사람들의 월급 + 커미션
SELECT ENAME, SAL, COMM, SAL + COMM
  FROM EMP
 WHERE DEPTNO = 10; -- COMM에는 값이 없어서 NULL이다. SAL에 데이터가 있어도 NULL과 합쳐도 NULL
 
-- NULL 대체
SELECT ENAME, SAL, COMM, SAL + NVL(COMM, 0)
  FROM EMP
 WHERE DEPTNO = 10;
 
 

-- [입문] 010 비교연산자 배우기 ( > , < , >= , <= , = , != , <> , ^= )

-- 월급 1200 이하인 사원들
SELECT ENAME, SAL, JOB, DEPTNO
  FROM EMP
 WHERE SAL <= 1200;



-- [입문] 011 비교연산자 배우기 (BETWEEN AND)

-- 월급 1000 ~ 3000 사이 사람들
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL BETWEEN 1000 AND 3000;
 
-- 다른 방법
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL >= 1000 AND SAL <= 3000;
  
-- "BETWEEN 하한값 AND 상한값" 아니면 조회가 안된다
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL BETWEEN 3000 AND 1000;
 
-- 입사날짜 1982년
SELECT ENAME, HIREDATE
  FROM EMP
 WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';
 
 

-- [입문] 012 비교연산자 배우기 (LIKE)

-- 이름 첫글자가 'S'로 시작하는 사람들
SELECT ENAME, SAL
  FROM EMP
 WHERE ENAME LIKE 'S%'; --  % : 와일드카드 그 뒤에 철자가 몇개여도 상관없다.
 
-- 이름 두번째 철자가 'M'인 사람
SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '_M%'; -- _ : 언더바는 한자리여야 한다.

-- 와일드 카드(%) 활용
SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '%T';

SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '%A%';



-- [입문] 013 비교연산자 배우기 (IS NULL)

-- 커미션이 NULL인 사람들
SELECT ENAME, COMM
  FROM EMP
 WHERE COMM IS NULL; -- NULL은 비교연산자로 비교할 수 없다.
  


-- [입문] 014 비교연산자 배우기 (IN)

-- 직업이 SALESMAN, ANALYST, MANAGER인 사람들
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- IN을 안 쓴 경우
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB = 'SALESMAN' AND JOB = 'ANALYST' AND JOB = 'MANAGER';
 
-- 직업이 SALESMAN, ANALYST, MANAGER 아닌 사람들
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- NOT IN을 안 쓴 경우
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB != 'SALESMAN' AND JOB != 'ANALYST' AND JOB != 'MANAGER';
  


-- [입문] 015 논리연산자 배우기 (AND, OR, NOT) 

-- 직업이 'SALESMAN'이고 월급 1200 이상인 사람들(TRUE)
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB = 'SALESMAN' AND SAL >= 1200;
 
-- 직업이 'SJDFLK'이고 월급 1200 이상인 사람들(FALSE)
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB = 'SJDFLK' AND SAL >= 1200;
 
/* 논리연산자 ( AND, OR, NOT )

    [AND]   TRUE    FALSE   NULL
    TRUE    TRUE    FALSE   NULL
    FALSE   FALSE   FALSE   FALSE
    NULL    NULL    FALSE   NULL
    
    [OR]    TRUE    FALSE   NULL
    TRUE    TRUE    TRUE    TRUE
    FALSE   TRUE    FALSE   NULL
    NULL    TRUE    NULL    NULL

    [NOT]   TRUE    FALSE   NULL
    TRUE    FALSE   TRUE    NULL

*/