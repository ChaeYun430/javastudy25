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
--3. join //���̺�� ���� ��� ���� ������ �ٸ� '���'�� Ȱ���ϰų� ���� ���̺� ���� �� ��� ����
--�⺻������ ��µǴ� �������� ���� ������ �������� �ʴ´�. 

--�ǹ������� * ��� �� ���� ��� �����ϴ� ����
--� ���� � ������ ��µ��� ��Ȯ�� �� �� ����. 
--Ư�� ���� CUD��ȭ�� ���� �� ��ȭ�� ���� ���α׷� ������ ���� ���� �� �ִ�. 

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


--<<<����Ŭ �Լ�>>>
--Ư���� ��� ���� ��� ���� �����͸� �Է��� �� �ִ� Ư�� ��ɾ�
--�Ű�����, �Է� �Ķ����, ����
--������ �Լ�; �� �྿ �Էµǰ� �� ��� ����� �ϳ��� ������ �Լ�
--������ �Լ�: ���� ���� �ԷµǾ� �ϳ��� ������ ����� ��ȯ�Ǵ� �Լ�

--��ҹ��� ��ȯ // UPPER, LOWER, INITCAP
--�Է� �����Ϳ� �� �̸��̳� �����͸� ���� �����ؾ� ��.
--Ȱ��: ���� �˻����� ��, �ҹ��� ���ο� ������� �˻� �ܾ�� ��ġ�� ���ڿ��� ������ ������ �˻� ����
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;
SELECT * FROM EMP WHERE UPPER(ENAME) = UPPER('SCOTT');
SELECT * FROM EMP WHERE UPPER(ENAME) LIKE UPPER('SCOTT');

--���ڿ� ����,����Ʈ ���ϱ� // LENGTH, LENGTHB
SELECT ENAME, LENGTH(ENAME) FROM EMP;
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME) >= 5;
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;



--JOIN
--FROM���� ���̺� �Ǵ� ���� ������ ������ ������ ���� ���� ����

--ũ�ν� ����(���� ����)
--��ī��Ʈ ��(ī�׽þ� ��: Cartesian product): �� ������ �̷�� ��� ������ ������
--(��ī��Ʈ �� ������ �Ͼ�� �ʰ� �ϴ� �� �ʿ��� ���ǽ��� ����) = (���� ���̺� ����) - 1
SELECT * FROM EMP, DEPT ORDER BY EMPNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO ORDER BY EMPNO; --Ư�� ���̺��� Ư�� �� �̸� �� ����
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO ORDER BY EMPNO; --���̺� �̸��� ��Ī ����

--��� �����͸� ��� �����ϴ��Ŀ� ����

--1. � ����(equi join)/���� ����, �ܼ� ����
--���� ���̺� �ִ� ���� �ݵ�� ���� �ִ� ���̺� ����ؾ� ��
--�ǹ������� ��κ� �� �̸��� ���̺� ��� 
--SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO ORDER BY D.DEPTNO, E.DEPTNO;
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPNO, D.DNAME, D.LOC FROM EMP.E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND SAL = 3000;

--2. �� ����(non-equi join)
SELECT * FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--3. ��ü ����(self join)
--SELECT * FROM EMP E, COPY_EMP C WHERE E.MGR = C.EMPNO;
--������ ���� �뷮�� �� �谡 ��-> ���� ���α׷� ���� ȿ�� ����
--���̺��� ������ ���� ������ ��� ���̺� �����ؾ� �ϴ� �߰� �۾� -> �ݺ� �۾� Ƚ�� ����
--�ϳ��� ���̺��� ���� ���� ���̺�ó�� Ȱ���Ͽ� �����ϴ� ���//ū ���������� � ����
--FROM���� ���� ���̺��� ���� �� ����ϵ� ���̺��� ��Ī�� �ٸ��� �����ϴ� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO;

--4. �ܺ� ����(outer join)
--�� ���̺� �� ���� ���࿡�� ���� ���� ���� ��� ������ NULL�̾ ������ ����ϴ� ��� //���� �� ����
--�¿��� ������ ������̴�.
--���� �ܺ� ����(Left Outer Join): WHERE TABLE1.COL1 = TABLE2.COL1(+)
--������ �ܺ� ����(Right Outer Join): WHERE TABLE1.COL1(+) = TABLE2.COL1
--���ʿ� +�� ���̴� ������δ� ��ü �ܺ� ���� ��� �Ұ�
--���տ����� UNION ����� ���� ȿ�� ���� ����
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO(+) ORDER BY E1.EMPNO;
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR(+) = E2.EMPNO ORDER BY E1.EMPNO;

--<<<SQL-99 ǥ�� ����>>>
--�����ϰ� ��������� � ����� ������ ����ϰ� �ִ��� �� �� �ִ�
--���� ���ǽİ� ��� ���� �����ϴ� ���ǽ��� ������ �� �ִ�. 
--NATURAL JOIN
--���� ����� �Ǵ� �� ���̺� �̸��� �ڷ����� ���� ���� ã�� �� �� ���� �������� � ����
--���� � ���ΰ� �ٸ��� ���� ���� ���� SELECT���� ����� �� ���̺� �̸��� ���̸� �� �ȴ�.
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC FROM EMP E NATURAL JOIN DEPT D ORDER BY DEPTNO, E.EMPNO;
 
--JOIN ~ USING
--USING Ű���忡 ���� �������� ����� ���� ����Ͽ� ����Ѵ�. 
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC FROM EMP E JOIN DEPT D USING (DEPTNO) WHERE SAL >= 3000 ORDER BY DEPTNO, E.EMPNO;

--JOIN ~ ON
--���뼺 ����
--���� ���� ���ǽ��� ON�� ���
SELECT E.EMPNO, E.ENAME, E.JOB, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO) WHERE SAL <= 3000 ORDER BY E.DEPTNO, EMPNO;

--OUTER JOIN 
--Left Outer Join: FROM TABLE1 LEFT OUTER JOIN TABLE2 ON (���� ���ǽ�)
--Right Outer Join: FROM TABLE1 RIGHT OUTER JOIN TABLE2 ON (���� ���ǽ�)
--Full Outer Join: FROM TABLE1 FULL OUTER JOIN TABLE2 ON (���� ���ǽ�)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO;
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO;
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO;

--�� �� �̻��� ���̺��� ������ ��
--FROM TABLE1 JOIN TABLE2 ON (���ǽ�) JOIN TABLE3 ON (���ǽ�)

--239P
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO AND E.SAL > 2000 ORDER BY D.DEPTNO, E.EMPNO;
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM DEPT D JOIN EMP E USING(DEPTNO) WHERE SAL > 2000 ORDER BY DEPTNO, E.EMPNO;
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM DEPT D NATURAL JOIN EMP E WHERE SAL > 2000 ORDER BY DEPTNO, E.EMPNO;

--<<<��������>>>
--���� ����: SQL���� �����ϴ� �� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� SQL�� ���ο��� ����ϴ� SELECT��
--���� ����: ���������� ��� ���� ����Ͽ� ����� �����ϴ� ����
--�߹��� ������ ������ �߿�
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� ��ȣ�� ��� ���
--2. Ư���� ��� ��츦 ������ ��κ��� �������������� ORDER BY�� ��� �Ұ�
--3 ���������� SELECT���� ����� ���� ���������� �� ���� ���� �ڷ����� ���� ������ �����ؾ� ��.
--4. ���������� �ִ� SELECT���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ �����ؾ� ��.

--������ ��������
--������ ������: ��� �� ������, ���� �� ������
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');--�������� ������� ��¥�� �������� ���� ��� ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20 AND E.SAL > (SELECT AVG(SAL) FROM EMP);--������������ Ư�� �Լ��� ����� ������� �ϳ��� ��

--������ ��������
--������ ������: 
--IN: ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� �ִٸ� ��
--ANY, SOME: ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� ��
--ALL: ���������� ���ǽ��� ���������� ����� ��ΰ� �����ϸ� ��
--EXISTS: ���������� ����� �����ϸ�(��, ���� 1�� �̻��̸�) ��


--DML

--���̺� ����
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;
--���� ���̺� ����: DROP TABLE ���̺� �̸�;

--INSERT��
--INSERT INTO: ���ο� �����͸� �Է��� ��� ���̺�� ���� �Է��Ѵ�.
--VALUES: INSERT INTO���� ������ ���̺��� �� ������ �ڷ����� �´� �Է� �����͸� �����Ѵ�.
--INSERT������ ������ ���� �� ���� �Է��� �������� ����, �ڷ����� ��ġ���� �ʴ� ��� �Ǵ� �� ���̸� �ʰ��ϴ� ��� ���� �߻�
--�� ���� ���� ��: �ش� ���̺��� ���� �� ������ �� ������� ��� �����Ǿ� �ִٰ� �����ϰ� ������ �ۼ�
--�ǹ�: �� ����, ,NULL�� �����Ͽ� �Է�
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (50, 'DATABASE', 'SEOIL');
SELECT * FROM DEPT_TEMP;

DESC DEPT;
INSERT INTO DEPT_TEMP VALUES (60, 'NETWORK', 'BUSAN');
SELECT * FROM DEPT_TEMP;

--NULL�� ����� �Է�
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES (70, 'WEB', NULL); --NULL�� ���� �Է�
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (80, 'MOBILE', '');--�� ���� ���ڿ��� NULL �Է�
SELECT * FROM DEPT_TEMP;

--NULL�� �Ͻ��� �Է�
INSERT INTO DEPT_TEMP (DEPTNO, LOC) VALUES (90, 'INCHEON'); --�� �����͸� ���� �ʴ� ���
SELECT * FROM DEPT_TEMP;

--���̺� ��¥ ������ �Է��ϱ�
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1; --���̺� �� ������ ������ �����ʹ� ������� �ʵ���
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)--��¥ ���̿� / �Է�
    VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) --��¥ ���̿� - �Է�
    VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
SELECT * FROM EMP_TEMP;

--����Ŭ�� ��ġ�Ǿ� �ִ� �ü���� ������ ����ϴ� �⺻ ���� ���� ��¥ ǥ������ �ٸ���.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (2111, '�̼���', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) --TO_DATE �Լ�
    VALUES (2111, '�̼���', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
SELECT * FROM EMP_TEMP;

--SYSDATE�� ���� ������ ��¥ �Է�
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
    VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
SELECT * FROM EMP_TEMP; --��� ȯ�� �Ǵ� ������ �ٶ� HIREDATE���� ����/���� �ð��� �԰� ��µ� �� ����.

--���������� �� ���� ���� �� �߰�
--1. VALUES���� ������� �ʴ´�.
--2. (�����Ͱ� �߰��Ǵ� ���̺��� �� ����)==(���������� �� ����)
--3. (�����Ͱ� �߰��Ǵ� ���̺��� �ڷ���)==(���������� �ڷ���)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;
SELECT * FROM EMP_TEMP;

--INSERT: https://docs.oracle.com/cd/E11882_01/server.112/e41084/statements_9014.htm#SQLF01604
--MERGE: https://docs.oracle.com/cd/E11882_01/server.112/e41084/statements_9016.htm#SQLF01606

--UPDATE��
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP2;
--UPDATE: �����͸� ������ ���̺��� ����
--SET: ������ ���� �����ϰ� �����͸� �Է�
--WHERE: ���̺��� ������ ������ ���� ���ǽ��� ����, ������ ���̺� �� ������ ��� ���� ������ ����

--��ü ����
UPDATE DEPT_TEMP2 SET LOC = 'SEOUL'; 
SELECT * FROM DEPT_TEMP2;
--���� ���·� �ǵ�����
ROLLBACK; 
SELECT * FROM DEPT_TEMP2;
--�Ϻ� ����
UPDATE DEPT_TEMP2 SET DNAME = 'DATEBASE', LOC = 'SEOUL' WHERE DEPTNO = 40; 
SELECT * FROM DEPT_TEMP2;
--���������� ���� �� �� ���� ����
UPDATE DEPT_TEMP2 SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40) WHERE DEPTNO = 40;
SELECT * FROM DEPT_TEMP2;
--���������� ���� �� �ϳ��ϳ� ����
UPDATE DEPT_TEMP2 SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO = 40), LOC = (SELECT LOC FROM DEPT WHERE DEPTNO = 40) WHERE DEPTNO = 40;
SELECT * FROM DEPT_TEMP2;
--WHERE���� �������� ����Ͽ� ����
UPDATE DEPT_TEMP2 SET LOC = 'SEOUL' WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME = 'OPERATIONS');
SELECT * FROM DEPT_TEMP2;

--WHERE�� ���� �� ����/����
SELECT * FROM DEPT_TEMP2 WHERE DEPTNO = 40;
UPDATE DEPT_TEMP2 SET DNAME = 'DATABASE', LOC = 'SEOUL' WHERE DEPTNO = 40;

--DELETE��
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP2;
--DELETE [FROM]: �����͸� ������ ���̺��� ����
--WHERE: ���̺��� ������ ������ ���� ���ǽ��� ����, ������ ���̺� �� ������ ��� ���� ������ ����

--WHERE�� ���� �� �Ϻ� ����
SELECT * FROM EMP_TEMP2 WHERE JOB = 'MANAGER';
DELETE FROM EMP_TEMP2 WHERE JOB = 'MANAGER';
SELECT * FROM EMP_TEMP2;
--WHERE���� �������� ����Ͽ� �ߺ� ����
DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO FROM EMP_TEMP2 E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 3 AND DEPTNO = 30);
SELECT * FROM EMP_TEMP2;
SELECT * FROM SALGRADE;
ROLLBACK;
--��ü ����
DELETE FROM EMP_TEMP2;
SELECT * FROM EMP_TEMP2;

--287p
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (50,'ORACLE', 'BUSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES(60, 'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES(70, 'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES(80, 'DML', 'BUNDANG');

DESC DEPT;
SELECT * FROM DEPT;

 