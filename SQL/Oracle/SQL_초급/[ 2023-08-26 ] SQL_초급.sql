/* 2023-08-26 */

-- [초급] 016 대소문자 변환 함수 배우기 (UPPER, LOWER, INITCAP)

-- 대문자, 소문자, 첫글자만 대문자 나머지는 소문자
SELECT UPPER(ENAME), 
        LOWER(ENAME), 
        INITCAP(ENAME)
  FROM EMP;
  
-- 이름 = 'scott' 찾기
SELECT ENAME, SAL
  FROM EMP
 WHERE LOWER(ENAME) = 'scott';



-- [초급] 017 문자에서 특정 철자 추출하기 (SUBSTR)

-- SMITH이란 글자에서 SMI만 뽑기
SELECT SUBSTR('SMITH', 1, 3)
  FROM DUAL;

-- SMITH이란 글자에서 TH만 뽑기
SELECT SUBSTR('SMITH', 4, 2), SUBSTR('SMITH', -2, 2)
  FROM DUAL;



-- [초급] 018 문자열의 길이를 출력하기 (LENGTH)

-- 이름을 출력하고, 철자 갯수 및 바이트 수 표기
SELECT ENAME, 
        LENGTH(ENAME), 
        LENGTHB(ENAME)
  FROM EMP;
  
SELECT '문자열 길이 및 바이트 수',
        LENGTH('문자열 길이 및 바이트 수') AS LENGTH,
        LENGTHB('문자열 길이 및 바이트 수') AS LENGTHB
  FROM DUAL;      



-- [초급] 019 문자에서 특정 철자의 위치 출력하기 (INSTR)

-- SMITH라는 글자에서 'M'은 어디에 위치했는가
SELECT INSTR('SMITH', 'M')
  FROM DUAL;
  
-- 응용 :: JSAldkAJD@naver.com에서 naver.com만 출력하기
SELECT 'JSAldkAJD@naver.com', 
        SUBSTR('JSAldkAJD@naver.com', INSTR('JSAldkAJD@naver.com', '@') + 1)
  FROM DUAL;
  
-- 응용 :: JSAldkAJD@naver.com에서 naver만 출력하기
SELECT 'JSAldkAJD@naver.com', 
        RTRIM(SUBSTR('JSAldkAJD@naver.com', INSTR('JSAldkAJD@naver.com', '@') + 1), '.com') 
  FROM DUAL;
  
  
  
-- [초급] 020 특정 철자를 다른 철자로 변경하기 (REPLACE)

-- 월급 출력시 0을 *로 대체
SELECT ENAME, 
    SAL, 
    REPLACE(SAL, 0, '*') AS REPLACE
  FROM EMP;

-- 0 ~ 3까지를 *로 출력 :: REGEXP_REPLACE :: 정규식 함수
SELECT ENAME, 
        SAL, 
        REGEXP_REPLACE(SAL, '[0-3]', '*') AS REGEXP_REPLACE
  FROM EMP;

-- 예제
DROP TABLE TEST_ENAME;

CREATE TABLE TEST_ENAME
(ENAME   VARCHAR2(10));

INSERT INTO TEST_ENAME VALUES('김인호');
INSERT INTO TEST_ENAME VALUES('안상수');
INSERT INTO TEST_ENAME VALUES('최영희');
COMMIT;

-- 전광판 이름 출력
SELECT REPLACE(ENAME, SUBSTR(ENAME, 2, 1), '*') AS 전광판이름
  FROM TEST_ENAME;



-- [초급] 021 특정 철자를 N개 만큼 채우기 (LPAD, RPAD)

-- 이름, 월급 10자리로 하고 남은 자리는 '*' 대체
SELECT ENAME, LPAD(SAL, 10, '*'), RPAD(SAL, 10, '*')
  FROM EMP;

-- 월급을 100으로 ■ 출력
SELECT ENAME, SAL, RPAD('■', ROUND(SAL / 100), '■')
  FROM EMP;



-- [초급] 022 특정 철자 잘라내기 (TRIM, RTRIM, LTRIM)

-- SMITH, MITH, SMIT, MIT
SELECT 'SMITH', 
        LTRIM('SMITH', 'S') AS LTRIM, 
        RTRIM('SMITH', 'H') AS RTRIM, 
        TRIM('S' FROM 'SMITHS') AS TRIM
  FROM DUAL;
  
-- INSERT : JACK 오른쪽 공백
INSERT INTO EMP(EMPNO, ENAME, SAL, JOB, DEPTNO)
VALUES(8291, 'JACK    ', 3000, 'SALESMAN', 30);
COMMIT;

SELECT * FROM EMP WHERE ENAME = 'JACK'; -- 검색되는 레코드 없음.
SELECT * FROM EMP WHERE ENAME = 'JACK    '; -- 검색됨.
SELECT * FROM EMP WHERE ENAME LIKE '%JACK%'; -- 검색됨.

-- JACK 공백 제거 후 월급 출력
SELECT ENAME, SAL
  FROM EMP
 WHERE TRIM(ENAME) = 'JACK'; -- 그냥 칼러만 적으면 공백이 제거가 된다.

-- JACK 데이터 삭제
DELETE FROM EMP
 WHERE TRIM(ENAME) = 'JACK';
COMMIT;



-- [초급] 023 반올림해서 출력하기 (ROUND)

-- 876.567 반올림
SELECT '876.567', 
        ROUND(876.567, 1), 
        ROUND(876.567, 0), 
        ROUND(876.567, -1), 
        ROUND(876.567, -2)
  FROM DUAL;



-- [초급] 024 숫자를 버리고 출력하기 (TRUNC)

-- 876.567 숫자 버리기
SELECT '876.567', 
        TRUNC(876.567, 1), 
        TRUNC(876.567, 0), 
        TRUNC(876.567, -1), 
        TRUNC(876.567, -2)
  FROM DUAL;



-- [초급] 025 나눈 나머지 값 출력하기 (MOD)

-- 10을 3으로 나눠서 나머지를 구해라
SELECT MOD(10, 3)
  FROM DUAL;

-- 사원번호가 홀수면 1, 짝수면 0
SELECT EMPNO, 
       MOD(EMPNO, 2)
  FROM EMP;

-- 사원번호가 짝수인 사람들
SELECT EMPNO, 
       ENAME
  FROM EMP
 WHERE MOD(EMPNO, 2) = 0;

-- 10을 3으로 나눠서 몫을 출력
SELECT FLOOR(10 / 3) AS 몫, MOD(10, 3) AS 나머지
  FROM DUAL;