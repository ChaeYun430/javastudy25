--=================<<<TRIGGER>>>================
--정의: DB안의 큭정 상황이나 동작, 즉 이벤트가 발생할 경우에 자동으로 실행되는 기능을 정의하는 PL/SQL 서브프로그램
--활용: 데이터 변경과 관련된 일련의 정보 기록 가능 
--     -> 여러 사용자가 공유하는 데이터 보안성과 안정성, 문제 발생시의 대처능력 향상
--	   수준 높은  데이터 정의 가능

--==================DML 트리거===================
--CREATE [OR REPLACE] TRIGGER 트리거 이름 // OR  REPLACE는 내용 갱신
--BEFORE | AFTER // DML명령어를 기준으로 트리거의 작동 타이밍 결정
--INSERT | UPSATE | DELETE ON 테이블 이름 // 여러  종류의 DML 명령어를 지정할 경우 OR로 구분
--_REFERENCING OLD as old | New as new // DML로 변경되는 행의 변경 전 값과 변경 후 값 참조
--_FOR EACH ROW WHEN 조건식 // 트리거를 실행하는 행 결정, 생략하면 DML 명령어 실행할 때  한 번만, 쓰면 영향받는 행 모두
--_FOLLOWS 트리거 이름2, 트리거 이름3 //여러 관련 트리거의 실행 순서 지정
--_ENALBLE | DISABLE // 활성화 여부 결정
--DECLARE 선언부
--BEGIN 실행부
--EXCEPTION 예외 처리부
--END;

CREATE TABLE EMP_TRG AS SELECT * FROM EMP


CREATE TABLE EMP_TRG_LOG(
	TABLENAME VARCHAR2(10),
	DML_TYPE VARCHAR2(10),
	EMPNO NUMBER(4),
	USER_NAME VARCHAR2(30),
	CHANGE_DATE DATE
	)
	
