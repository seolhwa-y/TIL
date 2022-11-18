# SQL

#### SQL 문법의 종류
* DDL :: 데이터 정의 언어
	* CREATE, ALTER, DROP
* DML :: 데이터 조작 언어
	* SELECT, INSERT, UPDATE DELETE
* DCL :: 데이터 제어 언어
	* GRANT, REVOKE

#### SQL의 언어적 특성
1. 대소문자를 가리지 않는다.
2. 반드시 세미콜론(;)으로 끝난다.
3. 고유의 값은 따옴표(’’)로 감싼다.
4. 객채를 나타낼 때는 백틱(``)으로 감싼다.
5. 주석은 도움말이다. 한줄 주석은 - -, 여러줄 주석은 /* */ 으로 표현한다.

#### SQL 문법 정리
* GRANT, REVOKE
  * DCL : 데이터 제어어


* CREATE TABLE, ALTER TABLE, DROP TABLE
  * DDL : 데이터 정의어

  * CREATE TABLE
    * KEY
        * PRIMARY KEY : 기본키를 지정
        * FOREIGN KEY : 외래키를 지정
        * UNIQUE : 대체키를 지정

    * INTEGER, NUMBER, DECIMAL
    * CHAR, VARCHAR
    * DATE

  * ALTER TABLE
    * ADD, MODIFY, DROP
      * 생성된 테이블의 속성과 제약조건을 변경할 때 사용한다.
      * 속성 : ADD, MODIFY, DROP
      * 제약조건 : ADD, DROP


* SELECT, INSERT, UPDATE, DELETE
  * DML : 데이터 조작어
  
  * SELECT
      ```sql
      SELECT      --칼럽명      5번째
      FROM        --테이블명    1번째
      WHERE       --테이블조건  2번째
      GROUP BY    --칼럼명      3번째
      HAVING      --그룹조건    4번째
      ORDER BY    --칼럼명      6번째
      ```

    1. SELECT
      추출한 데이터들을 조회한다.
    2. FROM
      가장 테이블을 먼저 확인한다.
    3. WHERE
      테이블에서 주어진 조건에 맞는 데이터를 추출한다.
    4. GROUP BY
      공통적인 데이터들끼리 묶어 그룹을 만든다.
    5. HAVING
      주어진 조건에 맞는 그룹들을 추출한다. 
    6. ORDER BY
      추출한 데이터를 정렬한다.
      오름차순 : ASC 
      내림차순 : DESC

  * ALL, DISTINCT
    * SELECT문에서 사용하는 키워드이다.
    * ALL : 중복을 허용한다.
    * DISTINCT : 중복을 허용하지 않는다.

  * WHERE절의 숙어
    * =, <>, <, <=, >, >=
      * 비교

    * BETWEEN
      * 범위

    * IN, NOT IN
      * 집합

    * LIKE
      * 부분적으로 일치하는 데이터를 검색한다.
      * +, %, [], [^], _
        * + : 문자열을 연결
        * % : 0개 이상의 문자열을 일치
        * [] : 1개의 문자와 일치
        * [^] : 1개의 문자와 불일치
        * _ : 특정위치의 문자와 일치

    * IS NULL, IS NOT NULL
      * NULL을 이용하여 검색한다.
      * IS NULL : 특정 속성이 NULL 값인지 비교
      * IS NOT NULL : 특정 속성이 NULL 값이 아닌지 비교

    * AND, OR, NOT
      * 복합조건


* 함수
  * 문자형 함수
    * LOWER
    * UPPER
    * SUBSTR / SUBSTRING
    * LENGTH
    * LEN
    * LTRIM
    * RTRIM
    * TRIM
    * ASCII

  * 숫자형 함수
    * ABS
    * MOD
    * ROUND
    * TRUNC
    * SIGN
    * CHR / CHAR
    * CEIL / CEILING
    * FLOOR
    * EXP
    * LOG
    * LN
    * POWER
    * SIN
    * COS
    * TAN

  * 날짜형 함수
    * SYSDATE / GETDATE
    * EXTRACT / DATEPART
    * TO_NUMBER(TO_CHAR(D, 'YYYY'|'MM'|'DD')) / YEAR|MONTH|DAY

  * 변환형 함수
    * TO_NUMBER
    * TO_CHAR
    * TO_DATE / CAST
    * CONVERT

  * NULL 관련 함수
    * NVL / ISNULL
    * NULLIF
    * COALESCE

  




* NULL VALUES
* TOP, LIMIT, ROWNUM
* WILDCARDS
* ALIASES
* JOINS
* UNION
* ANY
* SELECT INTO
* INSERT INTO SELECT
* CASE
* STORED PROCEDURES
* COMMENTS
* OPERATORS