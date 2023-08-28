/* 2023-08-26 */

-- [�ʱ�] 026 ��¥ �� ���� �� ����ϱ� (MONTHS_BETWEEN)

-- �Ի��Ϻ��� ���ñ��� ��� �ٹ��ߴ°�
SELECT ENAME,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH
  FROM EMP;
  
-- 2018.10.01  ~  2019.06.01 ���ϼ� ���
SELECT TO_DATE('2019-06-01', 'YYYY-MM-DD') - TO_DATE('2018-10-01', 'YYYY-MM-DD') AS TOTAL_DAY
  FROM DUAL;

-- 2018.10.01  ~  2019.06.01 ���ּ� ���
SELECT ROUND((TO_DATE('2019-06-01', 'YYYY-MM-DD') - TO_DATE('2018-10-01', 'YYYY-MM-DD')) / 7) AS TOTAL_WEEKS
  FROM DUAL;
  
  

-- [�ʱ�] 027 ���� �� ���� ��¥ ����ϱ� (ADD_MONTHS)

-- 2019.05.01���� 100�� ���� ��¥
SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'YYYY-MM-DD'), 100) 
  FROM DUAL;

SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + INTERVAL '100' MONTH -- INTERVAL -- 
  FROM DUAL;

-- 2019.05.01���� 100�� ���� ��¥
SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + 100 
  FROM DUAL;
  
-- 2019.05.01���� 1�� 3���� �� ��¥
SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + INTERVAL '1-3' YEAR(1) TO MONTH
  FROM DUAL;
  
/* INTERVAL ǥ����
 * INTERVAL '��/��/��/�ð�/��' YEAR/MONTH/DAY/HOUR/MIN(�ڸ���)
 */
  
-- TO_YMINTERVAL :: 2019.05.01���� 3�� 5���� �� ��¥ (YEAR MONTH INTERVAL)
SELECT TO_DATE('2019-05-01', 'YYYY-MM-DD') + TO_YMINTERVAL('03-05') AS ��¥
  FROM DUAL;

  

-- [�ʱ�] 028 Ư�� ��¥ �ڿ� ���� ���� ��¥ ����ϱ� (NEXT_DAY)

-- 2019.05.22 ���ƿ��� ������
SELECT '2019-05-22', NEXT_DAY('2019-05-22', '������')
  FROM DUAL;

-- ���ú��� ���ƿ��� ȭ����
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'ȭ����')
  FROM DUAL;

-- 2019.05.22 100�޵� ���ƿ��� ȭ����
SELECT '2019-05-22', NEXT_DAY(ADD_MONTHS('2019-05-22', 100), 'ȭ����')
  FROM DUAL;

-- ���ú��� 100�޵� ���ƿ��� ������
SELECT SYSDATE, NEXT_DAY(ADD_MONTHS(SYSDATE, 100), '������')
  FROM DUAL;



-- [�ʱ�] 029 Ư�� ��¥�� �ִ� ���� ������ ��¥ ����ϱ� (LAST_DAY)

-- 2019.05.22 �ش� ���� ������ ��¥
SELECT '2019-05-22', LAST_DAY('2019-05-22')
  FROM  DUAL;

-- ���ú��� �̹��� ���ϱ��� �� �� ���Ҵ°�
SELECT SYSDATE, LAST_DAY(SYSDATE) - SYSDATE AS �����ϼ�
  FROM  DUAL;

-- �̸� = KING / �Ի�� ������ ��¥
SELECT ENAME,
       HIREDATE,
       LAST_DAY(HIREDATE)
  FROM EMP
 WHERE ENAME = 'KING';