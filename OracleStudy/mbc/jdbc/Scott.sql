desc emp; --emp 테이블 구조보기
select * from emp; --emp 테이블 내용보기

desc dept; --dept 테이블 구조보기
select * from dept; --dept 테이블 내용보기

desc bonus; --bonus 테이블 구조보기
select * from bonus; --bonus 테이블 내용보기

desc salgrade; --salgrade 테이블 구조보기
select * from salgrade; --salgrade 테이블 내용보기

--실행 F9/명령어 선택 후 Ctrl Enter
--데이터를 제외한 SQL문의 띄어쓰기와 줄 바꿈은 명령 수행에 영향을 주지 않는다.
--SQL문에 사용하는 기본 형식은 대, 소문자를 구별하지 않고 사용 가능
--테이블 안에 들어 있는 문자 또는 문자열 데이터는 대소문자를 구별함.

--===================<<<사용자 관리>>>======================
--업무별 사용자 생성 후 각 사용자가 데이터 구조 만들어 관리
--대표 사용자가 데이터 구조를 정의하고 권한은 각 사용자에게 지정
--데이터 간의 관계, 데이터 구조, 제약 조건 등 데이터를 저장 및 관리하기 위해 정의한 DB 구조의 범위를 스키마를 통해 그룹 단위로 분류한다.

--SCOTT 계정은 사용자 생성 권한이 없다. 
CREATE USER ORCLSTUDY IDENTIFIED BY ORACLE;
 

CREATE TABLE TEMP ( COL1 VARCHAR2(20), COL2 VARCHAR2(20) );
GRANT SELECT, INSERT ON TEMP TO ORCLSTUDY;
COMMIT;
SELECT * FROM TEMP;
REVOKE SELECT, INSERT ON TEMP FROM ORCLSTUDY;
COMMIT;


--416p
GRANT SELECT ON DEPT, SALGRADE TO PREV_HW;






