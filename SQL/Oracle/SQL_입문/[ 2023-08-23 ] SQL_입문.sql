/* 2023-08-23 */

-- [�Թ�] 001 ���̺��� Ư�� ��(COLUMN) �����ϱ�
 
-- ���̺� Ư�� Į�� ��ȸ
SELECT EMPNO
       ,ENAME
       ,SAL
FROM   EMP;
 
-- ����
SELECT empno
       ,ename
       ,sal
  FROM emp;



-- [�Թ�] 002 ���̺��� ��� ��(COLUMN) ����ϱ�

-- ���̺� ��ü ��ȸ
SELECT *
  FROM EMP;
  
-- ���̺� ��ü ��ȸ2
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  
-- Ư�� Į�� �߰���ȸ
SELECT EMP.DEPTNO AS �߰�Į��, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  


-- [�Թ�] 003 Į�� ��Ī�� ����Ͽ� ��µǴ� Į���� �����ϱ�

-- �����ȣ, ����̸�, Salary ǥ��
SELECT EMPNO AS �����ȣ,
       ENAME AS ����̸�,
       SAL AS "Salary" -- ��ҹ��ڸ� �����ϰ� ���� �� "����" 
  FROM EMP;
  
-- ��Ī�� ������ ��� (���� ���)
SELECT EMPNO, ENAME, SAL * (12 + 3000)
  FROM EMP;
SELECT EMPNO, ENAME, SAL * (12 + 3000) AS ����
  FROM EMP;
  
-- ��Ī�� ������ ��� (ORDER BY)
SELECT EMPNO, ENAME, SAL * (12 + 3000) AS ����
  FROM EMP
 ORDER BY ���� DESC;
 


-- [�Թ�] 004 ���� ������ ����ϱ�(||)

-- �̸��� ���� ���ļ� ���
SELECT ENAME || SAL
  FROM EMP;
  
-- ���� ������ ���� ���������� ���
SELECT ENAME || '�� ������ ' || SAL || '�� �Դϴ�.' AS ��������
  FROM EMP;
 


-- [�Թ�] 005 �ߺ��� �����͸� �����ؼ� ����ϱ�(DISRINCT)

-- �ߺ��� ���� ���� (DISTINCT = UNIQUE)
SELECT DISTINCT JOB
  FROM EMP;
  
SELECT UNIQUE JOB
  FROM EMP;
 


-- [�Թ�] 006 �����͸� �����ؼ� ����ϱ�(ORDER BY)

-- ������ ���� ������� ���
SELECT ENAME, SAL
  FROM EMP
 ORDER BY SAL ASC; -- ASC�� �⺻ �ɼ��̶� ����� �ȴ�. ( ASC : ��������, DESC : �������� ) 
SELECT ENAME, SAL AS ����
  FROM EMP
 ORDER BY ����;
 
-- ���� ����� �������� ���
SELECT ENAME, DEPTNO AS �μ���ȣ, SAL AS ����
  FROM EMP
 ORDER BY �μ���ȣ, ���� DESC; -- �μ���ȣ�� ���� ������������ ���� �� ������ ������������ ����
 
-- ORDER BY�� Į���� �ƴ� ���ڷ� ����
SELECT EMPNO AS �����ȣ, ENAME, DEPTNO AS �μ���ȣ, SAL AS ����
  FROM EMP
 ORDER BY 3, 1, 4 DESC; -- SELECT�� ���� Į�� ���� ��ȣ
  


-- [�Թ�] 007 WHERE�� ���� 1 (���� ������ �˻�)

-- ���� 3000�� ��� ���
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE SAL = 3000;

-- ������ 3000 �̻��� ��� ���
SELECT ENAME AS ����̸�, SAL AS ����, JOB AS ����
  FROM EMP
 WHERE SAL >= 3000;

SELECT ENAME AS ����̸�, SAL AS ����, JOB AS ����
  FROM EMP
 WHERE ���� >= 3000; -- [���� �߻�] WHERE������ ALIAS�� �ȸ�����. ��������� �˾ƾ� �Ѵ�. FROM - WHERE - SELECT



-- [�Թ�] 008 WHERE�� ���� 2 (���ڿ� ��¥ �˻�)

-- �̸��� SCOTT�� ���
SELECT ENAME, SAL, JOB, HIREDATE, DEPTNO
  FROM EMP
 WHERE ENAME = 'SCOTT';

-- �Ի����� 81�� 11�� 17���� ���
SELECT ENAME, SAL, JOB, HIREDATE, DEPTNO
  FROM EMP
 WHERE HIREDATE = '81/11/17'; -- ��¥�� ���ǿ� ������ ��¥ ���Ŀ� ���缭 �ۼ��ؾ� �Ѵ�.
 
-- ������ ��¥ ���� Ȯ�� ���
SELECT *
  FROM NLS_SESSION_PARAMETERS
 WHERE PARAMETER = 'NLS_DATE_FORMAT';
 
-- ������ ��¥���� ���� ���
ALTER SESSION 
SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
 
-- ����� ��¥ �������� �ٽ� ��ȸ
SELECT ENAME, SAL, JOB, HIREDATE, DEPTNO
  FROM EMP
 WHERE HIREDATE = '1981-11-17';
  
-- ��¥ ���� �� YY�� RR : YY = 2012 / RR = 1912 �� �ν��Ѵ�. RR�� ���� ���� �������� �ν� 
  
  

-- [�Թ�] 009 ��������� ���� ( * , / , + , - )
  
-- ������ 36000 �̻��� ���
SELECT ENAME, SAL * 12 AS ����
  FROM EMP
 WHERE SAL * 12 >= 36000; -- ��������ڿ��� �켱������ �����Ƿ� ���ϱ���� �����Ѵ�. ���� ���ϱ� ���� �ؾ��ϸ� ��ȣ�� ���.
  
-- �μ���ȣ�� 10���� ������� ���� + Ŀ�̼�
SELECT ENAME, SAL, COMM, SAL + COMM
  FROM EMP
 WHERE DEPTNO = 10; -- COMM���� ���� ��� NULL�̴�. SAL�� �����Ͱ� �־ NULL�� ���ĵ� NULL
 
-- NULL ��ü
SELECT ENAME, SAL, COMM, SAL + NVL(COMM, 0)
  FROM EMP
 WHERE DEPTNO = 10;
 
 

-- [�Թ�] 010 �񱳿����� ���� ( > , < , >= , <= , = , != , <> , ^= )

-- ���� 1200 ������ �����
SELECT ENAME, SAL, JOB, DEPTNO
  FROM EMP
 WHERE SAL <= 1200;



-- [�Թ�] 011 �񱳿����� ���� (BETWEEN AND)

-- ���� 1000 ~ 3000 ���� �����
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL BETWEEN 1000 AND 3000;
 
-- �ٸ� ���
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL >= 1000 AND SAL <= 3000;
  
-- "BETWEEN ���Ѱ� AND ���Ѱ�" �ƴϸ� ��ȸ�� �ȵȴ�
SELECT ENAME, SAL
  FROM EMP
 WHERE SAL BETWEEN 3000 AND 1000;
 
-- �Ի糯¥ 1982��
SELECT ENAME, HIREDATE
  FROM EMP
 WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';
 
 

-- [�Թ�] 012 �񱳿����� ���� (LIKE)

-- �̸� ù���ڰ� 'S'�� �����ϴ� �����
SELECT ENAME, SAL
  FROM EMP
 WHERE ENAME LIKE 'S%'; --  % : ���ϵ�ī�� �� �ڿ� ö�ڰ� ����� �������.
 
-- �̸� �ι�° ö�ڰ� 'M'�� ���
SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '_M%'; -- _ : ����ٴ� ���ڸ����� �Ѵ�.

-- ���ϵ� ī��(%) Ȱ��
SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '%T';

SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '%A%';



-- [�Թ�] 013 �񱳿����� ���� (IS NULL)

-- Ŀ�̼��� NULL�� �����
SELECT ENAME, COMM
  FROM EMP
 WHERE COMM IS NULL; -- NULL�� �񱳿����ڷ� ���� �� ����.
  


-- [�Թ�] 014 �񱳿����� ���� (IN)

-- ������ SALESMAN, ANALYST, MANAGER�� �����
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- IN�� �� �� ���
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB = 'SALESMAN' AND JOB = 'ANALYST' AND JOB = 'MANAGER';
 
-- ������ SALESMAN, ANALYST, MANAGER �ƴ� �����
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- NOT IN�� �� �� ���
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB != 'SALESMAN' AND JOB != 'ANALYST' AND JOB != 'MANAGER';
  


-- [�Թ�] 015 �������� ���� (AND, OR, NOT) 

-- ������ 'SALESMAN'�̰� ���� 1200 �̻��� �����(TRUE)
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB = 'SALESMAN' AND SAL >= 1200;
 
-- ������ 'SJDFLK'�̰� ���� 1200 �̻��� �����(FALSE)
SELECT ENAME, SAL, JOB
  FROM EMP
 WHERE JOB = 'SJDFLK' AND SAL >= 1200;
 
/* �������� ( AND, OR, NOT )

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