/* 2023-08-26 */

-- [�ʱ�] 016 ��ҹ��� ��ȯ �Լ� ���� (UPPER, LOWER, INITCAP)

-- �빮��, �ҹ���, ù���ڸ� �빮�� �������� �ҹ���
SELECT UPPER(ENAME), 
        LOWER(ENAME), 
        INITCAP(ENAME)
  FROM EMP;
  
-- �̸� = 'scott' ã��
SELECT ENAME, SAL
  FROM EMP
 WHERE LOWER(ENAME) = 'scott';



-- [�ʱ�] 017 ���ڿ��� Ư�� ö�� �����ϱ� (SUBSTR)

-- SMITH�̶� ���ڿ��� SMI�� �̱�
SELECT SUBSTR('SMITH', 1, 3)
  FROM DUAL;

-- SMITH�̶� ���ڿ��� TH�� �̱�
SELECT SUBSTR('SMITH', 4, 2), SUBSTR('SMITH', -2, 2)
  FROM DUAL;



-- [�ʱ�] 018 ���ڿ��� ���̸� ����ϱ� (LENGTH)

-- �̸��� ����ϰ�, ö�� ���� �� ����Ʈ �� ǥ��
SELECT ENAME, 
        LENGTH(ENAME), 
        LENGTHB(ENAME)
  FROM EMP;
  
SELECT '���ڿ� ���� �� ����Ʈ ��',
        LENGTH('���ڿ� ���� �� ����Ʈ ��') AS LENGTH,
        LENGTHB('���ڿ� ���� �� ����Ʈ ��') AS LENGTHB
  FROM DUAL;      



-- [�ʱ�] 019 ���ڿ��� Ư�� ö���� ��ġ ����ϱ� (INSTR)

-- SMITH��� ���ڿ��� 'M'�� ��� ��ġ�ߴ°�
SELECT INSTR('SMITH', 'M')
  FROM DUAL;
  
-- ���� :: JSAldkAJD@naver.com���� naver.com�� ����ϱ�
SELECT 'JSAldkAJD@naver.com', 
        SUBSTR('JSAldkAJD@naver.com', INSTR('JSAldkAJD@naver.com', '@') + 1)
  FROM DUAL;
  
-- ���� :: JSAldkAJD@naver.com���� naver�� ����ϱ�
SELECT 'JSAldkAJD@naver.com', 
        RTRIM(SUBSTR('JSAldkAJD@naver.com', INSTR('JSAldkAJD@naver.com', '@') + 1), '.com') 
  FROM DUAL;
  
  
  
-- [�ʱ�] 020 Ư�� ö�ڸ� �ٸ� ö�ڷ� �����ϱ� (REPLACE)

-- ���� ��½� 0�� *�� ��ü
SELECT ENAME, 
    SAL, 
    REPLACE(SAL, 0, '*') AS REPLACE
  FROM EMP;

-- 0 ~ 3������ *�� ��� :: REGEXP_REPLACE :: ���Խ� �Լ�
SELECT ENAME, 
        SAL, 
        REGEXP_REPLACE(SAL, '[0-3]', '*') AS REGEXP_REPLACE
  FROM EMP;

-- ����
DROP TABLE TEST_ENAME;

CREATE TABLE TEST_ENAME
(ENAME   VARCHAR2(10));

INSERT INTO TEST_ENAME VALUES('����ȣ');
INSERT INTO TEST_ENAME VALUES('�Ȼ��');
INSERT INTO TEST_ENAME VALUES('�ֿ���');
COMMIT;

-- ������ �̸� ���
SELECT REPLACE(ENAME, SUBSTR(ENAME, 2, 1), '*') AS �������̸�
  FROM TEST_ENAME;



-- [�ʱ�] 021 Ư�� ö�ڸ� N�� ��ŭ ä��� (LPAD, RPAD)

-- �̸�, ���� 10�ڸ��� �ϰ� ���� �ڸ��� '*' ��ü
SELECT ENAME, LPAD(SAL, 10, '*'), RPAD(SAL, 10, '*')
  FROM EMP;

-- ������ 100���� �� ���
SELECT ENAME, SAL, RPAD('��', ROUND(SAL / 100), '��')
  FROM EMP;



-- [�ʱ�] 022 Ư�� ö�� �߶󳻱� (TRIM, RTRIM, LTRIM)

-- SMITH, MITH, SMIT, MIT
SELECT 'SMITH', 
        LTRIM('SMITH', 'S') AS LTRIM, 
        RTRIM('SMITH', 'H') AS RTRIM, 
        TRIM('S' FROM 'SMITHS') AS TRIM
  FROM DUAL;
  
-- INSERT : JACK ������ ����
INSERT INTO EMP(EMPNO, ENAME, SAL, JOB, DEPTNO)
VALUES(8291, 'JACK    ', 3000, 'SALESMAN', 30);
COMMIT;

SELECT * FROM EMP WHERE ENAME = 'JACK'; -- �˻��Ǵ� ���ڵ� ����.
SELECT * FROM EMP WHERE ENAME = 'JACK    '; -- �˻���.
SELECT * FROM EMP WHERE ENAME LIKE '%JACK%'; -- �˻���.

-- JACK ���� ���� �� ���� ���
SELECT ENAME, SAL
  FROM EMP
 WHERE TRIM(ENAME) = 'JACK'; -- �׳� Į���� ������ ������ ���Ű� �ȴ�.

-- JACK ������ ����
DELETE FROM EMP
 WHERE TRIM(ENAME) = 'JACK';
COMMIT;



-- [�ʱ�] 023 �ݿø��ؼ� ����ϱ� (ROUND)

-- 876.567 �ݿø�
SELECT '876.567', 
        ROUND(876.567, 1), 
        ROUND(876.567, 0), 
        ROUND(876.567, -1), 
        ROUND(876.567, -2)
  FROM DUAL;



-- [�ʱ�] 024 ���ڸ� ������ ����ϱ� (TRUNC)

-- 876.567 ���� ������
SELECT '876.567', 
        TRUNC(876.567, 1), 
        TRUNC(876.567, 0), 
        TRUNC(876.567, -1), 
        TRUNC(876.567, -2)
  FROM DUAL;



-- [�ʱ�] 025 ���� ������ �� ����ϱ� (MOD)

-- 10�� 3���� ������ �������� ���ض�
SELECT MOD(10, 3)
  FROM DUAL;

-- �����ȣ�� Ȧ���� 1, ¦���� 0
SELECT EMPNO, 
       MOD(EMPNO, 2)
  FROM EMP;

-- �����ȣ�� ¦���� �����
SELECT EMPNO, 
       ENAME
  FROM EMP
 WHERE MOD(EMPNO, 2) = 0;

-- 10�� 3���� ������ ���� ���
SELECT FLOOR(10 / 3) AS ��, MOD(10, 3) AS ������
  FROM DUAL;