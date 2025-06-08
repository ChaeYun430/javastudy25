
--=======================<<<CH12. DDL>>>==============================
--데이터 정의어를 실행하면 자동으로 커밋되기 때문에 이전에 사용한 데이터 조작어는 데이터베이스에 영구히 반영된다.
--ROLLBACK을 통한 실행취소가 불가하다.

--CREATE TABLE 소유계정.테이블 이름 (열 이름 자료형(길이), ...)
--CREATE TABLE 소유계정.테이블 이름 AS 서브쿼리
--ALTER TABLE 테이블이름 키워드 열이름 TO열
--RENAME 테이블이름 TO 테이블이름
--TRUNCATE TABLE 테이블이름
--DROP TABLE 테이블이름

--<<<CREATE>>>
--계정 이름 생략시 현재 접속해 있는 계정 소유의 테이블이 만들어짐
--테이블 이름 대소문자 구별하지 않으나 필요시 큰따옴표 사용

--테이블/열 이름 생성 규칙
--문자로 시작, 한글 가능, 숫자 불가
--30바이트 이하
--영문자, 한글, 숫자, 특수문자($, #, _) 사용 가능
--SQL 키워드는 테이블 이름으로 사용 불가
--테이블: 같은 사용자 소유의 테이블 이름은 중복될 수 없다. (계정마다 같은 이름의 테이블 이름을 가질 수 있다.)
--열: 한 테이블의 열 이름은 중복될 수 없다. 
 
--자료형을 각각 정의하여 새 테이블 생성하기
CREATE TABLE EMP_DDL(EMPNO NUMBER(4), ENAME VARCHAR2(10), JOB VARCHAR2(9), MGR NUMBER(4), HIREDATE DATE, SAL NUMBER(7, 2), COMM NUMBER(7, 2), DEPTNO NUMBER(2));
DESC EMP_DDL;
--열 구조와 데이터를 복사
CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;
DESC DEPT_DDL;
SELECT * FROM DEPT_DDL;
--열 구조와 일부 데이터만 복사
CREATE TABLE EMP_DDL_30 AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;
--열 구조만 복사
CREATE TABLE EMPDEPT_DDL AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE 1<>1;
SELECT *FROM EMPDEPT_DDL;

--<<<ALTER>>> 테이블 변경
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

--ADD 열이름 자료형(길이): 열 추가
ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);
SELECT * FROM EMP_ALTER;

--RENAME COLUMN 열이름 TO 열이름: 열 이름 변경
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;
SELECT * FROM EMP_ALTER;

--MODIFY 열이름 자료형(길이): 열 자료형 변경
--데이터에 문제가 생기지 않는 범위 내에서 허용
--길이를 줄이거나 기존 열의 자료형을 다름 자료형으로 변경하는 것은 저장된 데이터 상태에 따라 결정된다.
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;

--DROP COLUMN 열이름: 특정 열 삭제(내부 데이터도 함께)
ALTER TABLE EMP_ALTER DROP COLUMN TEL;
SELECT * FROM EMP_ALTER;

--<<<RENAME>>> 테이블 이름 변경
RENAME EMP_ALTER TO EMP_RENAME;
DESC EMP_ALTER;
SELECT * FROM EMP_RENAME;

--<<<TURNCATE>>> 테이블 데이터 삭제
--DDL이므로 ROLLBACK 불가
TRUNCATE TABLE EMP_RENAME;
SELECT * FROM EMP_RENAME;

--<<<DROP>>> 테이블 삭제
--DDL이므로 ROLLBACK 불가
--FLASHBACK 기능을 사용하여 DROP 명령어로 삭제된 테이블을 복구 가능
DROP TABLE EMP_RENAME;
DESC EMP_RENAME;

--324p
CREATE TABLE EMP_HW AS SELECT * FROM EMP WHERE 1<>1;
DESC EMP_HW;

ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);
DESC EMP_HW;

ALTER TABLE EMP_HW MODIFY BIGO VARCHAR2(30);
DESC EMP_HW;

ALTER TABLE EMP_HW RENAME COLUMN BIGO TO REMARK;
DESC EMP_HW;

--DML과 DDL 유연하게 활용
INSERT INTO EMP_HW SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL FROM EMP;
SELECT * FROM EMP_HW;

DROP TABLE EMP_HW;
SELECT * FROM EMP_HW;

--<<<데이터 사전>>>
--데이터베이스 테이블 = 사용자 테이블(Normal Table) + 데이터 사전(Base Table)
--사용자 테이블: DB를 통해 관리할 데이터를 저장하는 테이블
--데이터 사전: DB를 구성하고 운영하는 데 필요한 모든 정보를 저장하는 특수한 테이블
--DB생성 지점에 자동으로 생성
--DB의 메모리, 성능, 사용자, 권한, 객체 등

--Data Dictionary View
--USER_ : 현재 DB에 접속한 사용자가 소유한 객체 정보
--ALL_ : 현재 DB에 접속한 사용자가 소유한 객체 또는 다른 사용자가 소유한 객체 중 사용 허가를 받은 객체 (사용 가능한 모든 객체)
--DBA_ : DB관리를 위한 정보(SYSTEM, SYS 사용자만 열람 가능)
--V$_ : DB 성능 관련 정보(X$_ 테이블의 뷰) 

--SCOTT계정에서 사용 가능한 BASE TABLE
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;
--SCOTT 계정이 가지고 있는 테이블 이름
SELECT TABLE_NAME FROM USER_TABLES;
--
