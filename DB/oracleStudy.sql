desc emp; --emp ���̺� ��������
select * from emp; --emp ���̺� ���뺸��

desc dept; --dept ���̺� ��������
select * from dept; --dept ���̺� ���뺸��

desc bonus; --bonus ���̺� ��������
select * from bonus; --bonus ���̺� ���뺸��

desc salgrade; --salgrade ���̺� ��������
select * from salgrade; --salgrade ���̺� ���뺸��

--���� F9/��ɾ� ���� �� Ctrl Enter
--�����͸� ������ SQL���� ����� �� �ٲ��� ��� ���࿡ ������ ���� �ʴ´�.
--SQL���� ����ϴ� �⺻ ������ ��, �ҹ��ڸ� �������� �ʰ� ��� ����
--���̺� �ȿ� ��� �ִ� ���� �Ǵ� ���ڿ� �����ʹ� ��ҹ��ڸ� ������.

--SELECT��
--(��� �����͸� �����ϴ� ��Ŀ� ����)
--1. selection �� ���� ��ȸ //Ȱ��: Ư�� ���� Ư�� �����͸� ���� ���� ���� ����
--2. projection �� ���� ��ȸ //Ȱ��: ���ϴ� �ʵ��� �����͸� ����
--selection & projection
--3. join //���̺�� ���� ��� ���� ������ �ٸ� '���'�� Ȱ���ϰų� ���� ���̺� ���� �� ��� ����(�߿�)
--�⺻������ ��µǴ� �������� ���� ������ �������� �ʴ´�. 

SELECT * FROM EMP;
SELECT EMPNO, ENAME, DEPTNO FROM EMP;


--DISTICT 
--Ȱ��: Ư�� �������� ������ Ȯ���ϰ� ���� ��
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT JOB,DEPTNO FROM EMP;
SELECT ALL JOB, DEPTNO FROM EMP; --SELECT������ �ߺ� ������ ���� ��� ALL�� �⺻���� ����Ѵ�. 

--alias
--Ȱ��: �� �̸��� �ܼ�ȭ, ���� �Ǵ� ������ ���� ����  
SELECT ENAME, SAL, SAL*12+COMM, COMM FROM EMP; 
--��, �����, ���ڸ� �� �̸����� ���� ����
--NULL������ ���� ��µ��� ����
SELECT SAL*12+COMM ANNSAL FROM EMP;
SELECT SAL*12+COMM "ANNSAL" FROM EMP;
SELECT SAL*12+COMM AS ANNSAL FROM EMP; 
SELECT SAL*12+COMM AS "ANNSAL" FROM EMP;
--�� ��° ��ȣ -> ��Ī �߰� ����, ū����ǥ ����
--�ڹٿ����� SELECT�� ��ü�� ū ����ǥ�� ��� ó���Ѵ�. ������ ���� ��Ȳ �߻� ���ɼ�

--ORDER BY
--SELECT���� �ۼ��� �� ����� �� �ִ� ���� �� �� ���� ������ �κп� ����.
--���� ������ ���� �켱���� ����
--���� �ɼ��� �������� ���� ��� �⺻������ ���������� ������
--VARCHAR2: ���ĺ���(���� ����)���� ���� 
--DATE: ���� ��¥, ���� ��¥�� ũ�⸦ �ο��Ͽ� ���� 
--����: ���ķ� ���� ���� ����ð��� ������ SQL���� ȿ���� ��������.
SELECT * FROM EMP ORDER BY SAL; --��������
SELECT * FROM EMP ORDER BY SAL DESC; --��������
SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;--����, �ø� ���� ���� ���

--92P
SELECT DISTINCT JOB FROM EMP;
SELECT EMPNO AS EMPLOYEE_NO,
       ENAME AS ENAME_NAME,
       MGR AS MANAGER,
       SAL AS SALARY, 
       COMM AS COMMISSION,
       DEPTNO AS DEPARTMENT_NO FROM EMP
       ORDER BY DEPTNO DESC, ENAME;

--WHERE��
--Ȱ��: SELECT������ ������ ��ȸ�� Ư�� ������ �������� ���ϴ� ���� ����ϴµ� ���
--���ǹ����� ���ڿ��� ���� ����ǥ�� �����ش�.
SELECT * FROM EMP WHERE DEPTNO = 30; --'='�� �񱳿����ڷ� ����
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN'; --AND�����ڷ� ���� ���� ���ǽ� ����ϱ�
SELECT * FROM EMP WHERE DEPTNO = 30 OR JOB = 'CLERK'; --OR�����ڷ� ���� ���� ��� ���� ����ϱ�

--������
--WHERE �� ���ǽĿ��� ���� ���� ��������� SELECT��, HAVING�������� ����
--������ ������ SQL������ �������� ������ ����Ŭ���� mod�Լ��� ���� ����
SELECT * FROM EMP WHERE SAL*12 = 36000; --���������
SELECT * FROM EMP WHERE SAL >= 3000; --�� ������
SELECT * FROM EMP WHERE ENAME >= 'F'; --���ڿ��� ���� ��(���� ù����)
SELECT * FROM EMP WHERE ENAME <= 'FORZ'; --���ڿ� ���� ��(�տ������� ���ʷ� ���Ѵ�.)
SELECT * FROM EMP WHERE SAL != 3000; --��� ������
SELECT * FROM EMP WHERE SAL <> 3000;
SELECT * FROM EMP WHERE SAL ^= 3000; --�ǹ� Ȱ�뵵 ����� ����
SELECT * FROM EMP WHERE NOT SAL = 3000; --�� ���� ������
--IN, BETWEEN, IS NULL �����ڿ� ���������� ���
--������ ���� ���� ���ǽ� ���� ��� ������ ���� ���
--���, � �� �����ڿ� ���� ����ϴ� ���� ����

--IN ������
--Ȱ��: Ư�� ���� �ش��ϴ� ������ ���� �� ������ �� �ִ�. (OR�� Ȱ��)
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
SELECT * FROM EMP WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

--BETWEEN A AND B ������
--Ȱ��: ������ ���� ���� �����͸� ��ȸ�� ��
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <=3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

--LIKE �����ڿ� ���ϵ� ī��
--���ϵ� ī��: Ư�� ���� �Ǵ� ���ڿ��� ��ü�ϰų� ���ڿ� �������� ������ ǥ���ϴ� Ư�� ����
--Ȱ��: �Ϻ� ���ڿ��� ���Ե� ������ ��ȸ
-- '_' : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
-- '%' : ���̿� �������(���� ���� ��쵵 ����) ��� ���� �����͸� �ǹ�
SELECT * FROM EMP WHERE ENAME LIKE 'S%'; 
SELECT * FROM EMP WHERE ENAME LIKE '_L%';
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';
--ESCAPE��
--���ϵ� ī�� ���ڰ� �������� �Ϻ��� ���
--������ ���� �ٷ� �ڿ� �ִ� ��ȣ�� ���ϵ� ī�� ��ȣ�� �ƴ� �����Ϳ� ���Ե� ���ڷ� �ν��ض�
--�ǹ� Ȱ�뵵 ����
SELECT * FROM EMP WHERE SOME_COLLUM LIKE 'A\_A%' ESCAPE '\';

--NULL�� Ȱ��
--���� �������� ����(ex.������ ������ �� ���� ���� ���� ���� ��ȣ)
--�ش� ���� ����(ex. ��ȥ�� ���� ��ȥ�����)
--������ �� ���� ��(ex.�� ��й�ȣ ã�� ���� ���� ���� ���� ��ȣ)
--Ȯ����� ���� ��(ex. �̼����� ��� ����)

--IS NULL ������
--NULL�� ��������ڿ� �񱳿����ڿ��� ���� ����� NULL�̴�.
--Ȱ��: Ư�� �� �Ǵ� ������ ��� ���� NULL���� ���θ� Ȯ��
SELECT ENAME, SAL, SAL*23+COMM, COMM FROM EMP;
SELECT * FROM EMP WHERE COMM = NULL;
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE MGR IS NOT NULL;
--AND, OR �����ڿ��� ����
--TRUE, FALSE, NULL�� ����
SELECT * FROM EMP WHERE SAL > NULL AND COMM IS NULL;
SELECT * FROM EMP WHERE SAL >NULL OR COMM IS NULL;

--���� ������
--�� ���� SELECT���� ��� ���� ������ �� �� SELECT���� ����Ϸ��� �� ������ �� ���� �ڷ����� �������� ��ġ�ؾ� �Ѵ�. 
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 20;
--��� �� ������ �ٸ� ��
--SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10 
--UNION
--SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 20;
--��� ���� �ڷ����� �ٸ� ��
--SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
--UNION
--SELECT EMPNO, ENAME, DEPTNO, SAL FROM EMP WHERE DEPTNO = 20;

--��� �� ������ �ڷ����� ���� ��...����� �ȴ�.
--��µǴ� �� �̸��� ���� �ۼ��� SELECT���� �� �̸����� ǥ��ȴ�.
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL FROM EMP WHERE DEPTNO = 20;

--UNION: ������, �ߺ� ����
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;
--UNION ALL: ������, �ߺ��� ���
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;
--MINUS: ���� ���� ������
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;
--INTERSECT: ������
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;

--������ �켱����
--1. ���������
--2. ��� �� ������
--3. IS NULL, LIKE, IN
--4. BETWEEN A AND B
--5. �� ���� ������ NOT
--6. �� ������ AND
--7. �� ������ OR

--125P
--LIKE
SELECT * FROM EMP WHERE ENAME LIKE '%S'; 
--AND
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN';
--IN
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN (20, 30) AND SAL>2000;
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN (20, 30)
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE SAL > 2000;
--�� ���� NOT
SELECT * FROM EMP WHERE NOT(SAL>=2000 AND SAL <=3000);
--���� Ȱ��
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP WHERE ENAME LIKE '%E%' AND DEPTNO = 30
INTERSECT
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP WHERE SAL NOT BETWEEN 1000 AND 2000;

SELECT * FROM EMP WHERE COMM IS NULL AND  MGR IS NOT NULL 
INTERSECT
SELECT * FROM EMP WHERE JOB IN('MANAGER', 'CLERK')
INTERSECT 
SELECT * FROM EMP WHERE ENAME NOT LIKE '_L%';
