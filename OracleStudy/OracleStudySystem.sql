--DBA_ : 데이터 관리 권한을 가진 사용자만 조회할 수 있는 테이블
--보안: 사용 권한이 없는 사용자는 해당 개체의 존재 여부조차 확인 불가

SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_USERS WHERE USERNAME = 'SCOTT';




--사용자 생성하기 (DB 연결을 위한 권한 미부여 상태)
CREATE USER ORCLSTUDY IDENTIFIED BY ORACLE;

--DB 접속 권한 부여하기
GRANT CREATE SESSION TO ORCLSTUDY;

--사용자 또는 사용자 소유 객체 정보 조회
SELECT * FROM ALL_USERS WHERE USERNAME = 'ORCLSTUDY';
SELECT * FROM DBA_USERS WHERE USERNAME = 'ORCLSTUDY';
SELECT * FROM DBA_OBJECTS WHERE OWNER = 'ORCLSTUDY';

--오라클 사용자 변경(기존 패스워드로 접속 불가)
ALTER USER ORCLSTUDY IDENTIFIED BY ORCL;

--오라클 사용자 삭제(해당 사용자  접속 중이면 삭제 불가)
DROP USER ORCLSTUDY;

--오라클 사용자와 객체 모두 삭제
DROP USER ORCLSTUDY CASCADE;

--======================시스템 권한(system privilege)==================
--사용자 생성과 정보 수정 및 삭제, DB접근 오라클 DB의 여러 자원과 객체 생성 및 관리
--ANY: 소유자에 상관없이 사용 가능한 권한

--형식: GRANT 시스템 권한 TO 사용자 이름/롤 이름/PUBLIC [WITH ADMIN OPTION];
--형식: REVOKE 시스템 권한 FROM 사용자 이름/롤 이름/PUBLIC;
--권한 여러 개 부여 시, 권한 부여 여러 대상에 지정 시 쉼표로 구분
--WITH ADMIN OPTION으로 현재 GRANT문을 통해 부여받은 권한을 다른 사용자에게 부여 가능한 권한도 부여 받음
--현재 사용자가 권한이 사라져도, 권한을 재부여한 다른 사용자의 권한은 유지됨

--롤의 목적: 여러 권한을 하나의 이름으로 묶어 권한 부여 관련 작업을 간편하게 하려고 
--RESOURCE롤에는 UNLIMITED TABLESPACE 권한이 포함되어 있음 (12C 버전에서는 UNLIMITED TABLESPACE 권한을 부여하지 않는다.)

CREATE USER ORCLSTUDY IDENTIFIED BY ORACLE;
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO ORCLSTUDY;--권한 부여
ALTER USER ORCLSTUDY QUOTA 2M ON USERS; --사용 영역 제한
REVOKE RESOURCE, CREATE TABLE FROM ORCLSTUDY; --권한 삭제
--다시공부

--===================객체 권한(object privilege)================
--GRANT 객체 권한/ALL PRIVILEGES ON 스키마.객체 이름 TO 사용자 이름/롤 이름/PUBLIC [WITH GRANT OPTION];
--현재 권한을 부여받은 사용자의 권한이 사라지면, 다른 사용자에게 재부여된 둰한도 함께 사라진다.

--=====================<<ROLE>>>=======================
--여러 종류의 권한을 묶어 놓은 그룹, 권한 관리의 효율성 증가

--==================사전 정의된 롤==================
--CONNECT 롤: CREATE SESSION
--RESOURCR 롤: CREATE TRIGGER, CREATE SEQUENCE, CREATE TYPE, CREATE PROCEDURE, CREATE CLUSTER, CREATE OPERATOR, CREATE INDEXTYPE, CREATE TABLE
--CREATE VIEW, CREATE SYNONYM 권한을 다로 부여해야 함
--DBA 롤: DB를 관리하는 시스템 권한을 대부분 가지고 있다. 

--===================사용자 정의 롤==================
--1. 롤 생성
CREATE ROLE ROLESTUDY;
--2. 롤에 권한 부여 (사전 정의된 롤도 부여 가능)
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM TO ROLESTUDY;
--3. 사용자에게 롤 부여
GRANT ROLESTUDY TO ORCLSTUDY;
COMMIT;
--4. 부여된 롤 취소
REVOKE ROLESTUDY FROM ORCLSTUDY;
--5. 롤 삭제(해당 롤을 부여받은 모든 사용자의 롤이 취소됨)
DROP ROLE ROLESTUDY;

--416p
CREATE USER PREV_HW IDENTIFIED BY ORCL;
GRANT CREATE SESSION TO PREV_HW;


