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

--SELECT문
--(출력 데이터를 선정하는 방식에 따라)
--1. selection 행 단위 조회 //활용: 특정 열의 특정 데이터를 가진 행을 선별 가능
--2. projection 열 단위 조회 //활용: 원하는 필드의 데이터만 보기
--selection & projection
--3. join //테이블과 같이 행과 열로 구성된 다른 '요소'를 활용하거나 같은 테이블 여러 번 사용 가능
--기본적으로 출력되는 데이터의 정렬 순서를 보장하지 않는다. 

--실무에서의 * 대신 각 열을 모두 열거하는 이유
--어떤 열이 어떤 순서로 출력될지 명확히 알 수 없다. 
--특정 열의 CUD변화의 감지 및 변화에 따른 프로그램 수정이 쉽지 않을 수 있다. 

SELECT * FROM EMP;
SELECT EMPNO, ENAME, DEPTNO FROM EMP;


--DISTICT 
--활용: 특정 데이터의 종류만 확인하고 싶을 때
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT JOB,DEPTNO FROM EMP;
SELECT ALL JOB, DEPTNO FROM EMP; --SELECT절에서 중복 설정이 없을 경우 ALL을 기본으로 사용한다. 

--alias
--활용: 열 이름의 단순화, 보안 또는 데이터 노출 문제  
SELECT ENAME, SAL, SAL*12+COMM, COMM FROM EMP; 
--열, 연산식, 숫자를 열 이름으로 지정 가능
--NULL값으로 인해 출력되지 않음
SELECT SAL*12+COMM ANNSAL FROM EMP;
SELECT SAL*12+COMM "ANNSAL" FROM EMP;
SELECT SAL*12+COMM AS ANNSAL FROM EMP; 
SELECT SAL*12+COMM AS "ANNSAL" FROM EMP;
--세 번째 선호 -> 별칭 발견 수월, 큰따옴표 없음
--자바에서는 SELECT문 전체를 큰 따옴표로 묶어서 처리한다. 오류나 예외 상황 발생 가능성

--ORDER BY
--SELECT문을 작성할 때 사용할 수 있는 여러 절 중 가장 마지막 부분에 쓴다.
--먼저 지정한 열을 우선으로 정렬
--정렬 옵션을 지정하지 않을 경우 기본값으로 오름차순이 설정됨
--VARCHAR2: 알파벳순(사전 순서)으로 정렬 
--DATE: 이전 날짜, 이후 날짜로 크기를 부여하여 정렬 
--주의: 정렬로 인해 서비스 응답시간이 느려져 SQL문의 효율이 낮아진다.
SELECT * FROM EMP ORDER BY SAL; --오름차순
SELECT * FROM EMP ORDER BY SAL DESC; --내림차순
SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;--내림, 올림 차순 동시 사용

--92P
SELECT DISTINCT JOB FROM EMP;
SELECT EMPNO AS EMPLOYEE_NO,
       ENAME AS ENAME_NAME,
       MGR AS MANAGER,
       SAL AS SALARY, 
       COMM AS COMMISSION,
       DEPTNO AS DEPARTMENT_NO FROM EMP
       ORDER BY DEPTNO DESC, ENAME;

--WHERE절
--활용: SELECT문으로 데이터 조회시 특정 조건을 기준으로 원하는 행을 출력하는데 사용
--조건문에서 문자열은 작은 따옴표로 묶어준다.
SELECT * FROM EMP WHERE DEPTNO = 30; --'='이 비교연산자로 쓰임
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN'; --AND연산자로 여러 개의 조건식 사용하기
SELECT * FROM EMP WHERE DEPTNO = 30 OR JOB = 'CLERK'; --OR연산자로 여러 개의 출력 조건 사용하기

--연산자
--WHERE 절 조건식에서 가장 많이 사용하지만 SELECT절, HAVING절에서도 쓰임
--나머지 연산은 SQL문에서 제공하지 않으나 오라클에서 mod함수로 구현 가능
SELECT * FROM EMP WHERE SAL*12 = 36000; --산술연산자
SELECT * FROM EMP WHERE SAL >= 3000; --비교 연산자
SELECT * FROM EMP WHERE ENAME >= 'F'; --문자열과 문자 비교(열의 첫문자)
SELECT * FROM EMP WHERE ENAME <= 'FORZ'; --문자열 간의 비교(앞에서부터 차례로 비교한다.)
SELECT * FROM EMP WHERE SAL != 3000; --등가비교 연산자
SELECT * FROM EMP WHERE SAL <> 3000;
SELECT * FROM EMP WHERE SAL ^= 3000; --실무 활용도 상대적 낮음
SELECT * FROM EMP WHERE NOT SAL = 3000; --논리 부정 연산자
--IN, BETWEEN, IS NULL 연산자와 복합적으로 사용
--복잡한 여러 개의 조건식 최종 결과 반전을 위해 사용
--대소, 등가 비교 연산자에 직접 사용하는 경우는 적음

--IN 연산자
--활용: 특정 열에 해당하는 조건을 여러 개 지정할 수 있다. (OR의 활용)
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
SELECT * FROM EMP WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

--BETWEEN A AND B 연산자
--활용: 일정한 범위 내의 데이터를 조회할 때
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <=3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

--LIKE 연산자와 와일드 카드
--와일드 카드: 특정 문자 또는 문자열을 대체하거나 문자열 데이터의 패턴을 표기하는 특수 문자
--활용: 일부 문자열이 포함된 데이터 조회
-- '_' : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
-- '%' : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미
SELECT * FROM EMP WHERE ENAME LIKE 'S%'; 
SELECT * FROM EMP WHERE ENAME LIKE '_L%';
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';
--ESCAPE절
--와일드 카드 문자가 데이터의 일부인 경우
--지정한 문자 바로 뒤에 있는 기호는 와일드 카드 기호를 아닌 데이터에 포함된 문자로 인식해라
--실무 활용도 낮음
SELECT * FROM EMP WHERE SOME_COLLUM LIKE 'A\_A%' ESCAPE '\';

--NULL의 활용
--값이 존재하지 않음(ex.통장을 개설한 적 없는 은행 고객의 계좌 번호)
--해당 사항 없음(ex. 미혼인 고객의 결혼기념일)
--노출할 수 없는 값(ex.고객 비밀번호 찾기 같은 은행 고객의 계좌 번호)
--확장되지 않은 값(ex. 미성년자 출신 대학)

--IS NULL 연산자
--NULL은 산술연산자와 비교연산자와의 연산 결과는 NULL이다.
--활용: 특정 열 또는 연산의 결과 값이 NULL인지 여부를 확인
SELECT ENAME, SAL, SAL*23+COMM, COMM FROM EMP;
SELECT * FROM EMP WHERE COMM = NULL;
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE MGR IS NOT NULL;
--AND, OR 연산자와의 관계
--TRUE, FALSE, NULL의 조합
SELECT * FROM EMP WHERE SAL > NULL AND COMM IS NULL;
SELECT * FROM EMP WHERE SAL >NULL OR COMM IS NULL;

--집합 연산자
--두 개의 SELECT문의 결과 값을 연결할 때 각 SELECT문이 출력하려는 열 개수와 각 열의 자료형이 순서별로 일치해야 한다. 
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 20;
--출력 열 개수가 다를 때
--SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10 
--UNION
--SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 20;
--출력 열의 자료형이 다를 때
--SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
--UNION
--SELECT EMPNO, ENAME, DEPTNO, SAL FROM EMP WHERE DEPTNO = 20;

--출력 열 개수와 자료형이 같을 때...출력은 된다.
--출력되는 열 이름은 먼저 작성한 SELECT문의 열 이름으로 표기된다.
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL FROM EMP WHERE DEPTNO = 20;

--UNION: 합집합, 중복 제거
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;
--UNION ALL: 합집합, 중복도 출력
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;
--MINUS: 선후 유지 차집합
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;
--INTERSECT: 교집합
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 10;

--연산자 우선순위
--1. 산술연산자
--2. 대소 비교 연산자
--3. IS NULL, LIKE, IN
--4. BETWEEN A AND B
--5. 논리 부정 연산자 NOT
--6. 논리 연산자 AND
--7. 논리 연산자 OR

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
--논리 부정 NOT
SELECT * FROM EMP WHERE NOT(SAL>=2000 AND SAL <=3000);
--복합 활용
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP WHERE ENAME LIKE '%E%' AND DEPTNO = 30
INTERSECT
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP WHERE SAL NOT BETWEEN 1000 AND 2000;

SELECT * FROM EMP WHERE COMM IS NULL AND  MGR IS NOT NULL 
INTERSECT
SELECT * FROM EMP WHERE JOB IN('MANAGER', 'CLERK')
INTERSECT 
SELECT * FROM EMP WHERE ENAME NOT LIKE '_L%';


--=====================<<<CH06, CH07 오라클 함수>>>============================

--특정한 결과 값을 얻기 위해 데이터를 입력할 수 있는 특수 명령어
--매개변수, 입력 파라미터, 인자
--단일행 함수; 한 행씩 입력되고 한 행당 결과가 하나씩 나오는 함수
--다중행 함수: 여러 행이 입력되어 하나의 행으로 결과가 반환되는 함수

--====================<<<문자 데이터>>>==============================

--대소문자 변환 // UPPER, LOWER, INITCAP
--입력 데이터에 열 이름이나 데이터를 직접 지정해야 함.
--활용: 실제 검색어의 대, 소문자 여부와 상관없이 검색 단어와 일치한 문자열을 포함한 데이터 검색 가능
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;
SELECT * FROM EMP WHERE UPPER(ENAME) = UPPER('SCOTT');
SELECT * FROM EMP WHERE UPPER(ENAME) LIKE UPPER('%scott%');

--문자열 길이,바이트 구하기 // LENGTH, LENGTHB
SELECT ENAME, LENGTH(ENAME) FROM EMP;
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME) >= 5;
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;
--DUAL TABLE: SYS소유로 SCOTT도 사용 가능한 더미 테이블, 임시 연산이나 함수의 결과 값 확인 용도로 사용
--더미 데이터(dummy data): 유용한 데이터가 포함되지 않지만 공간을 예비해두어 실제 데이터가 명목상 존재하는 것처럼 다루는 유순한 정보
--여러건의 물리적 데이터를 이용하여 테스트 (페이징 테스트 등)할 때 사용

--문자열 일부 추출 // SUBSTR, SUBSTRB
--형식: SUBSTR(문자열 데이터, 시작 위치, 추출 길이)
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5) FROM EMP;
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), SUBSTR(JOB, -LENGTH(JOB), 2), SUBSTR(JOB, -3) FROM EMP;

--문자열 데이터 안에서 특정 문자 위치 찾기 // INSTR
--형식: INSTR([대상 문자열 데이터(필수)], 
--			[위치를 찾으려는 부분 문자(필수)], 
--			[위치 찾기를 시작할 대상 문자열 데이터 위치(선택, 기본값은 1)], 
--			[시작 위치에서 찾으려는 문자가 몇 번째인지 지정선택, 기본값은 1)])
--만약 찾으려는 문자가 문자열 데이터에 포함되어 있지 않다면 위치값이 없으므로 0으로 반환
--LIKE 연산자와 비슷하게 사용 가능
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, 
	   INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, 
   	   INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 FROM DUAL;

SELECT * FROM EMP WHERE INSTR(ENAME, 'S') > 0;
SELECT * FROM EMP WHERE ENAME LIKE '%S%';

--특정 문자를 다른 문자로 바꿈 // REPLACE
--형식: REPLACE([문자열 데이터 또는 열 이름(필수)], [찾는 문자(필수)], [대체할 문자(선택)]
SELECT '010-1234-5678' AS REPLACE_BEFORE, 
		REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1, 
		REPLACE('010-1234-5678', '-') AS REPLACE_2 FROM DUAL;
		
--데이터의 빈 공간을 특정 문자로 채움 // LPAD, RPAD
--데이터와 자릿수를 지정한 후 데이터 길이가 지정한 자릿수보자 작을 경우에 나머지 공간을 특정 문자로 채우는 함수
--형식: LPAD/RPAD ([문자열 데이터 또는 열이름(필수)], [데이터 자릿수(필수)], [빈 공간에 채울 문자(선택)])
--활용: 데이터 일부만 노출해야 하는 개인정보를 출력할 때
SELECT 'ORACLE', LPAD('ORACLE', 10, '#') AS LPAD_1, LPAD('ORACLE', 10) AS LPAD_2, 
				 RPAD('ORACLE', 10, '*') AS RPAD_1, RPAD('ORACLE', 10) AS RPAD_2 FROM DUAL;
SELECT RPAD('971225-', 14, '*') AS RPAD_MNO,
	   RPAD('010-1234-', 13, '*') AS RPAD_PHONE FROM DUAL;
	   
--두 문자열을 합침 // CONCAT
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(':', ENAME)) FROM EMP WHERE ENAME = 'SCOTT';
--문자열 데이터를 연결하는 || 연산자
SELECT EMPNO || ENAME, EMPNO || ' : ' || ENAME FROM EMP WHERE ENAME = 'SCOTT'

--특정 문자를 지움 // TRIM, LTRIM, RTRIM
--활용: 검색 대상이 되는 데이터에 혹시나 들어 있을지도 모르는 양쪽 끝의 공백을 제거할 때	
--삭제할 문자가 생략될 경우 기본적으로 공백 제거
--삭제 옵션: LEADING, TRAILING, BOTH
--형식: TRIM([삭제 옵션(선택)] [삭제할 문자(선택)] FROM [원본 문자열 데이터(필수)])
--(선택)이 없으면 FROM을 쓰지 않는다. 
SELECT '[' || TRIM(' _ _ORACLE_ _ ') || ']' AS TRIM,
	   '[' || TRIM(LEADING FROM ' _ _ORACLE_ _ ') || ']' AS TRIM_LEADING,
	   '[' || TRIM(TRAILING FROM ' _ _ORACLE_ _ ') || ']' AS TRIM_TRAILING,
	   '[' || TRIM(BOTH FROM ' _ _ORACLE_ _ ') || ']' AS TRIM_BOTH FROM DUAL
SELECT '[' || TRIM('_' FROM '_ _ORACLE_ _') || ']' AS TRIM,
	   '[' || TRIM(LEADING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_LEADING,
	   '[' || TRIM(TRAILING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_TRAILING,
	   '[' || TRIM(BOTH '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_BOTH FROM DUAL	   

	   --LTRIM, RTRIM: 삭제할 문자로 여러 문자 지정이 가능하다.
--형식: LTRIM/RTRIM ([원본 문자열 데이터(필수)], [삭제할 문자 집합(선택)])
--삭제할 문자 집합에서 순서와 반복을 통해 만들어 낼 수 있는 모든 조합이 바깥쪽부터 삭제됨
SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS TRIM,
	   '[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM,
	   '[' || LTRIM('<_ORACLE_>', '_<') || ']' AS LTRIM_2,
	   '[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM,
	   '[' || RTRIM('<_ORACLE_>', '_>') || ']' AS RTRIM_2 FROM DUAL
   
--======================<<<숫자 데이터>>>==========================

--지정한 숫자의 특정 위치에서 반올림 // ROUND
--형식: ROUND([숫자(필수)], [반올림 위치(선택)])
--자연수 첫째자리 반올림: -1
--소수점 첫째자리 반올림: 0
--소수점 둘째자리 반올림: 1
--지정하지 않으면 소수점 첫째 자리에서 반올림해서 정수 반환
SELECT ROUND(1234.5678) AS ROUND,
	   ROUND(1234.5678, 0) AS ROUND_0,
	   ROUND(1234.5678, 1) AS ROUND_1,
	   ROUND(1234.5678, 2) AS ROUND_2,
	   ROUND(1234.5678, -1) AS ROUND_MINUS1,
	   ROUND(1234.5678, -2) AS ROUND_MINUS2 FROM DUAL;
	   	   
--지정한 숫자의 특정 위치에서 버림 // TRUNC
--형식: TRUNC([숫자(필수)], [반올림 위치(선택)])
--지정하지 않으면 소수점 둘째 자리에서 버림해서 정수 반환
SELECT TRUNC(1234.5678) AS TRUNC,
	   TRUNC(1234.5678, 0) AS TRUNC_0,
	   TRUNC(1234.5678, 1) AS TRUNC_1,
	   TRUNC(1234.5678, 2) AS TRUNC_2,
	   TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	   TRUNC(1234.5678, -2) AS TRUNC_MINUS2 FROM DUAL;
	   
--지정한 숫자보다 큰 정수 중 가장 작은 정수를 반환 // CEI
--지정한 숫자보다 작은 정수 중 가장 큰 정수 반환 // FLOOR
--형식: CEIL/FLOOR([숫자(필수)])
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) FROM DUAL;

--지정한 숫자를 나눈 나머지 값을 반환 // MOD
SELECT MOD(15, 6), MOD(10, 2), MOD(11, 2) FROM DUAL;

--======================<<<날짜 데이터>>>============================
--오라클DB서버가 놓인 OS의 현재 날짜와 시간 // SYSDATE
--날짜 데이터 - 날짜 데이터: 두 날짜 데이터 간의 일수 차이
SELECT SYSDATE AS NOW, SYSDATE - 1 AS YESTERDAY, SYSDATE + 1 AS TOMORROW FROM DUAL;

--몇 개월 이후 날짜 구하기 // ADD_MONTHS
--형식: ADD_MONTHS([날짜 데이터(필수)], [더할 개월 수(정수)(필수)])
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR FROM EMP;
SELECT EMPNO, ENAME, HIREDATE, SYSDATE FROM EMP WHERE ADD_MONTHS(HIREDATE, 504) > SYSDATE;

--두 날짜 간의 개월 수 차이 구하기 // MONTHS_BETWEEN
--앞에서 뒤를 뺀다.
SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
		MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1, 
		MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3 FROM EMP;
		
--돌아오는 요일 // NEXT_DAY, 달의 마지막 날짜 // LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE) FROM DUAL;

--날짜의 반올림, 버림
SELECT SYSDATE,
		ROUND(SYSDATE, 'CC') AS FORMAT_CC,
		ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY, 
		ROUND(SYSDATE, 'Q') AS FORMAT_Q,
		ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
		ROUND(SYSDATE, 'HH') AS FORMAT_HH FROM DUAL;

--=======================<<<형 변환 함수>>>=====================
--날짜, 숫자 데이터를 문자 데이터로 변환 // TO_CHAR
		
--숫자 변형 //9(빈 자리를 채우지 않음), 0(빈 자리를 0으로 채움), 소수점과 천 단위 구분 기호 표시 
SELECT SAL, 
		TO_CHAR(SAL, '$999,999') AS SAL_$,
		TO_CHAR(SAL, 'L999,999') AS SAL_L,
		TO_CHAR(SAL, '999,999.00') AS SAL_1,
		TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
		TO_CHAR(SAL, '000999999.99') AS SAL_3,
		TO_CHAR(SAL, '999,999,00') AS SAL_4 FROM EMP;
		
		
--문자 데이터를 숫자 데이터로 변환 // TO_NUMBER
--IMPLICIT TYPE CONVERSION
SELECT 1300 - '1500', '1300' + 1500, '2' * '3' FROM DUAL;
SELECT '1,300' - '1,500' FROM DUAL;
--EXPLICIT TYPE CONVERSION
--숫자 데이터가 가공된 문자 데이터로 저장되어 있고 그 데이터를 산술 연산에 사용하고자 할 경우
--TO_NUMBER('[문자열 데이터(필수)]', '[인식될 숫자형태(필수)]')
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999') FROM DUAL;

--문자 데이터를 날짜 데이터로 변환 // TO_DATE
--TO_NUMBER('[문자열 데이터(필수)]', '[인식될 날짜형태(필수)]')
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
	   TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2 FROM DUAL;
	   
SELECT * FROM EMP WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_49,
	   TO_DATE('49/12/10', 'RR/MM/DD') AS RR_49,
	   TO_DATE('50/12/10', 'YY/MM/DD') AS YY_50,
	   TO_DATE('50/12/10', 'RR/MM/DD') AS RR_49,
	   TO_DATE('51/12/10', 'YY/MM/DD') AS YY_51,
	   TO_DATE('51/12/10', 'RR/MM/DD') AS RR_51 FROM DUAL;
	   
--========================<<<조건문>>>=========================

--NVL([NULL인지 여부를 검사할 데이터 또는 열(필수)], [앞의 데이터가 NULL일 경우 반환할 데이터(필수)]) 
--활용: 특정 열의 데이터가 NULL일 경우 연산 수행을 위해 데이터를 NULL이 아닌 다른 값으로 대체해야 할때
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM, 0), SAL+NVL(COMM,0) FROM EMP;

--NVL2([], [앞 데이터가 NULL이 아닐 경우 반환할 데이터 또는 계산식(필수)], [])
SELECT EMPNO, ENAME, COMM, NVL2(COMM, 'O', 'X'), NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL FROM EMP;

--DECODE([검사 대상], [조건1], [결과], [조건2], [결과], [ELSE]) cf.switch문 연상
--ELSE값 지정 안 하면 NULL 반환
SELECT EMPNO, ENAME, JOB, SAL, DECODE(JOB, 'MANAGER', SAL*1.1, 'SALESMAN', SAL*1.05, 'ANALYST', SAL, SAL*1.03) AS UPSAL FROM EMP;

--CASE([검사대상(선택)] WHEN [조건1] THEN [결과] WHEN [조건2] THEN [결과] ELSE [결과] END)
--각 조건에 사용하는 데이터가 서로 상관없어도 된다. 
--DECODE 함수의 상위 포함관계에 있다.
SELECT EMPNO, ENAME, JOB, SAL, CASE JOB WHEN 'MANAGER' THEN SAL*1.1 WHEN 'SALESMAN' THEN SAL*1.05 WHEN 'ANALYST' THEN SAL ELSE SAL*1.03 END AS UPSAL FROM EMP;
SELECT EMPNO, ENAME, COMM, CASE WHEN COMM IS NULL THEN '해당사항 없음' WHEN COMM = 0 THEN '수당없음' WHEN COMM > 0 THEN '수당없음: ' || COMM END AS COMM_TEXT FROM EMP

--174P
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO, ENAME, RPAD(SUBSTR(ENAME, 1, 1), 5, '*') AS MASKING_ENAME FROM EMP WHERE LENGTH(ENAME) >=5 AND LENGTH(ENAME)<6;

SELECT EMPNO, ENAME, SAL, TRUNC(SAL/21.5,2) AS DAY_PAY, ROUND(SAL/21.5/8, 1) AS TIME_PAY FROM EMP;

SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB, NVL(TO_CHAR(COMM), 'N/A') AS COMM FROM EMP;

SELECT EMPNO, ENAME, MGR, CASE WHEN MGR IS NULL THEN 0000 WHEN SUBSTR(MGR, 1, 2) = 75 THEN 5555 WHEN SUBSTR(MGR, 1, 2) = 76 THEN 6666
WHEN SUBSTR(MGR, 1, 2) = 77 THEN 7777 WHEN SUBSTR(MGR, 1, 2) = 78 THEN 8888 ELSE MGR END AS CHG_MGR FROM EMP;

--==========================<<<다중행 함수>>>========================

--형식: 함수명([DISTINCT/ALL] [합계를 구할 데이터]) OVER(분석을 위한 여러 문법을 지정)
--다중행 함수를 사용한 SELECT절에는 기본적으로 여러 행이 결과로 나올 수 있는 열을 함께 사용 불가
SELECT ENAME, SUM(SAL) FROM EMP;

--합계 // SUM
SELECT SUM(SAL) FROM EMP;
--NULL 데이터를 제외하고 합계를 구한다.
SELECT SUM(COMM) FROM EMP;
--DISTINCT는 중복 데이터를 제외하고 계산할 때 사용
SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL) FROM EMP;

--데이터의 개수 // COUNT
SELECT COUNT(*) FROM EMP;
SELECT COUNT(*) FROM EMP WHERE DEPTNO = 30;
--활용: 웝커뮤니티에서 특정 회뤈의 정보를 조합하여 회원 등급이나 레벨 관리 가능
SELECT COUNT(DISTINCT SAL), COUNT(ALL SAL), COUNT(SAL) FROM EMP;
--NULL데이터는 반환 개수에서 제외됨
SELECT COUNT(COMM) FROM EMP;
SELECT COUNT(COMM) FROM EMP WHERE COMM IS NOT NULL;

--최댓값, 최솟값 // MAX, MIN
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 10;
SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10;
SELECT MAX(HIREDATE) FROM EMP WHERE DEPTNO = 20;
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO = 20;

--평균값 // AVG
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;
SELECT AVG(DISTINCT SAL) FROM EMP WHERE DEPTNO = 30;

--=================<<<GROUP BY 절>>>==================

--하드 코딩: 코드를 상황에 따라 유연하게 동작할 수 있도록 일반화 또는 공식화해서 제작하지 않고, 그 상황 자체를 각각 지정하여 제작하는 방식
--별칭 사용 불가
SELECT AVG(SAL), DEPTNO FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;
--다중행 함수를 사용하지 않은 일반 열은 GROUP BY절에 명시하지 않으면 SELECT절에서 사용할 수 없다. 
SELECT ENAME, DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

--HAVING절: 그룹화된 결과 값의 범위를 제한하는 데 사용
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 ORDER BY DEPTNO, JOB;
--출력 행을 제한하는 WHERE절에서는 그룹화된 데이터를 제한하는 조건식 지정 불가
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP WHERE AVG(SAL) >= 2000 GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;
--그룹화 데상 데이터에서 처음부터 제외할 목적이면 
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 ORDER BY DEPTNO, JOB;
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP WHERE SAL <= 3000 GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 ORDER BY DEPTNO, JOB;

--ROLLUP, CUBE, GROUPING SETS 함수
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP
	GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;
--ROLLUP: N+1 명시함 열을 소그룹부터 대그룹의 순서로 각 그룹별 결과를 출력하고 마지막에 총 데이터의 결과를 출력
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP 
	GROUP BY ROLLUP(DEPTNO, JOB);
--CUBE: 2^N 지정한 모든 열에서 가능한 조합의 결과 출력
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP
	GROUP BY CUBE(DEPTNO, JOB) ORDER BY DEPTNO, JOB;
--PARTIAL ROLLUP/CUBE
SELECT DEPTNO, JOB, COUNT(*) FROM EMP GROUP BY DEPTNO, ROLLUP(JOB);
SELECT DEPTNO, JOB, COUNT(*) FROM EMP GROUP BY JOB, ROLLUP(DEPTNO);
--GROUPING SETS: 지정한 모든 열을 같은 수준으로 출력
SELECT DEPTNO, JOB, COUNT(*) FROM EMP GROUP BY GROUPING SETS(DEPTNO, JOB) ORDER BY DEPTNO, JOB;

--================<<<그룹화 함수>>>========================

--데이터 자체의 가공이나 특별한 연산 기능을 수행하지는 않으나 데이터의 식별이 쉽고 가독성을 높이기 위한 목적으로 사용

--GROUPING 함수: 그룹화 대상으로 지정한 열이 그룹화된 상태로 결과가 집계되었는지 확인
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL), GROUPING(DEPTNO), GROUPING(JOB) FROM EMP 
	GROUP BY CUBE(DEPTNO, JOB) ORDER BY DEPTNO, JOB;
SELECT DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT', DEPTNO) AS DEPTNO, DECODE(GROUPING(JOB), 1, 'ALL_JOB', JOB) AS JOB, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL) FROM EMP
	GROUP BY CUBE(DEPTNO, JOB) ORDER BY DEPTNO, JOB;

--GROUPING_ID 함수: GROUPING과 같은 기능, 검사 대상 열 여러 개 지정 가능
--결과는 그룹화 비트 벡터 값으로 나타냄
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL), GROUPING(DEPTNO), GROUPING(JOB), GROUPING_ID(DEPTNO, JOB) FROM EMP 
GROUP BY CUBE(DEPTNO, JOB) ORDER BY DEPTNO, JOB;

--LISTAGG: 그룹화 데이터를 하나의 열에 가로로 나열하여 출력
SELECT DEPTNO, ENAME FROM EMP GROUP BY DEPTNO, ENAME ORDER BY DEPTNO;
SELECT DEPTNO, LISTAGG(ENAME,', ') WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES FROM EMP GROUP BY DEPTNO

--PIVOT, UNPIVOT
SELECT DEPTNO, JOB, MAX(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;
SELECT * FROM (SELECT DEPTNO, JOB, SAL FROM EMP ) 
	PIVOT(MAX(SAL) FOR DEPTNO IN (10, 20, 30)	) ORDER BY JOB
SELECT * FROM (SELECT DEPTNO, JOB, SAL FROM EMP ) 
	PIVOT(MAX(SAL) FOR JOB IN ('CLERK' AS CLERK, 'SALESMAN' AS SALESMAN, 'MANAGER' AS MANAGER, 'ANALYST' AS ANALYFT)) ORDER BY DEPTNO
SELECT DEPTNO, MAX(DECODE(JOB, 'CLERK', SAL)) AS 'CLERK',
			   MAX(DECODE(JOB, 'SALESMAN', SAL)) AS 'SALESMAN',
			   MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS 'PRESIDENT',
			   MAX(DECODE(JOB, 'MANAGER', SAL)) AS 'MANAGER',
			   MAX(DECODE(JOB, 'ANALYST', SAL)) AS 'ANALYST' FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO
--------------------------208~211

--212P
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
	FROM EMP GROUP BY DEPTNO;
	
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB HAVING COUNT(*)>=3;

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*) AS CNT FROM EMP GROUP BY NVL2(COMM, 'O', 'X');

SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*) AS CNT, MAX(SAL) AS MAX_SAL, SUM(SAL) AS SUM_SAL, AVG(SAL) AS AVG_SAL
	FROM EMP GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));
	

--====================<<<CH08. JOIN>>>======================
--FROM절에 테이블 또는 열과 행으로 구성된 데이터 집합 지정 가능(ex. 뷰, 서브쿼리)
--크로스 조인(교차 조인)
--데카르트 곱(카테시안 곱: Cartesian product): 각 집합을 이루는 모든 원소의 순서쌍
--(데카르트 곱 현상이 일어나지 않게 하는 데 필요한 조건식의 개수) = (조인 테이블 개수) - 1
SELECT * FROM EMP, DEPT ORDER BY EMPNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO ORDER BY EMPNO; --특정 테이블의 특정 열 이름 비교 조건
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO ORDER BY EMPNO; --테이블 이름의 별칭 지정

--대상 데이터를 어떻게 연결하느냐에 따라

--1. 등가 조인(equi join)/내부 조인, 단순 조인
--조인 조건이 되는 각 테이블의 열 이름이 같을 경우 반드시 속해 있는 테이블 명시해야 함
--실무에서는 대부분 열 이름의 테이블 명시 
--SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO ORDER BY D.DEPTNO, E.DEPTNO;
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPNO, D.DNAME, D.LOC FROM EMP.E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND SAL = 3000;

--2. 비등가 조인(non-equi join)
SELECT * FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--3. 자체 조인(self join)
--SELECT * FROM EMP E, COPY_EMP C WHERE E.MGR = C.EMPNO;
--데이터 저장 용량이 두 배가 됨-> 응용 프로그램 동작 효율 저하
--테이블의 데이터 수정 사항을 모든 테이블에 적용해야 하는 추가 작업 -> 반복 작업 횟수 증가
--하나의 테이블을 여러 개의 테이블처럼 활용하여 조인하는 방식//큰 범위에서의 등가 조인
--FROM절에 같은 테이블을 여러 번 명시하되 테이블의 별칭만 다르게 지정하는 방식
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO,E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO;

--4. 외부 조인(outer join)
--두 테이블 간 조인 수행에서 조인 기준 열의 어느 한쪽이 NULL이어도 강제로 출력하는 방식 //면접 빈도 높음
--좌우의 기준이 모니터이다.
--왼쪽 외부 조인(Left Outer Join): WHERE TABLE1.COL1 = TABLE2.COL1(+)
--오른쪽 외부 조인(Right Outer Join): WHERE TABLE1.COL1(+) = TABLE2.COL1
--양쪽에 +를 붙이는 방식으로는 전체 외부 조인 사용 불가
--집합연산자 UNION 사용해 같은 효과 구현 가능
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO(+) ORDER BY E1.EMPNO;
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR(+) = E2.EMPNO ORDER BY E1.EMPNO;

--SQL-99 표준 문법
--간략하고 명시적으로 어떤 방식의 조인을 사용하고 있는지 알 수 있다
--조인 조건식과 출력 행을 선정하는 조건식을 구별할 수 있다. 

--NATURAL JOIN
--조인 대상이 되는 두 테이블에 이름과 자료형이 같은 열을 찾은 후 그 열을 기준으로 등가 조인
--기존 등가 조인과 다르게 조인 기준 열을 SELECT절에 명시할 때 테이블 이름을 붙이면 안 된다.
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC FROM EMP E NATURAL JOIN DEPT D ORDER BY DEPTNO, E.EMPNO;
 
--JOIN ~ USING
--USING 키워드에 조인 기준으로 사용할 열을 명시하여 사용한다. 
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC FROM EMP E JOIN DEPT D USING (DEPTNO) WHERE SAL >= 3000 ORDER BY DEPTNO, E.EMPNO;

--JOIN ~ ON
--범용성 높음
--조인 기준 조건식을 ON에 명시
SELECT E.EMPNO, E.ENAME, E.JOB, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO) WHERE SAL <= 3000 ORDER BY E.DEPTNO, EMPNO;

--OUTER JOIN 
--Left Outer Join: FROM TABLE1 LEFT OUTER JOIN TABLE2 ON (조인 조건식)
--Right Outer Join: FROM TABLE1 RIGHT OUTER JOIN TABLE2 ON (조인 조건식)
--Full Outer Join: FROM TABLE1 FULL OUTER JOIN TABLE2 ON (조인 조건식)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO;
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO;
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO;

--세 개 이상의 테이블을 조인할 때
--FROM TABLE1 JOIN TABLE2 ON (조건식) JOIN TABLE3 ON (조건식)

--239P
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO AND E.SAL > 2000 ORDER BY D.DEPTNO, E.EMPNO;
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM DEPT D JOIN EMP E USING(DEPTNO) WHERE SAL > 2000 ORDER BY DEPTNO, E.EMPNO;
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM DEPT D NATURAL JOIN EMP E WHERE SAL > 2000 ORDER BY DEPTNO, E.EMPNO;

--=========================<<<CH09. 서브쿼리>>>================================
--서브 쿼리: SQL문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 SQL문 내부에서 사용하는 SELECT문
--메인 쿼리: 서브쿼리의 결과 값을 사용하여 기능을 수행하는 영역
--발문의 적절한 분할이 중요
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 괄호로 묶어서 사용
--2. 특수한 몇몇 경우를 제외한 대부분의 서브쿼리에서는 ORDER BY절 사용 불가
--3 서브쿼리의 SELECT절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정해야 함.
--4. 서브쿼리에 있는 SELECT문의 결과 행 수는 함께 사용하는 메인쿼리의 연산자 종류와 호환 가능해야 함.

--단일행 서브쿼리
--단일행 연산자: 대소 비교 연산자, 동등 비교 연산자
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');--서브쿼리 결과값이 날짜형 데이터일 때도 사용 가능
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20 AND E.SAL > (SELECT AVG(SAL) FROM EMP);--서브쿼리에서 특정 함수를 사용한 결과값이 하나일 때

--다중행 서브쿼리
--다중행 연산자: 
--IN: 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 참
--ANY, SOME: 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 참
--ALL: 메인쿼리의 조건식을 서브쿼리의 결과의 모두가 만족하면 참
--EXISTS: 서브쿼리의 결과가 존재하면(즉, 행이 1개 이상이면) 참


--==========================<<<CH11. DML>>>================================

--테이블 복사
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;
--기존 테이블 삭제: DROP TABLE 테이블 이름;

--INSERT문
--INSERT INTO: 새로운 데이터를 입력할 대상 테이블과 열을 입력한다.
--VALUES: INSERT INTO에서 지정한 테이블의 열 순서와 자료형에 맞는 입력 데이터를 지정한다.
--INSERT문에서 지정한 열과 각 열에 입력할 데이터의 개수, 자료형이 일치하지 않는 경우 또는 열 길이를 초과하는 경우 오류 발생
--열 지정 생략 시: 해당 테이블을 만들 때 설정한 열 순서대로 모두 나열되어 있다고 가정하고 데이터 작성
--실무: 열 지정, ,NULL을 지정하여 입력
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (50, 'DATABASE', 'SEOIL');
SELECT * FROM DEPT_TEMP;

DESC DEPT;
INSERT INTO DEPT_TEMP VALUES (60, 'NETWORK', 'BUSAN');
SELECT * FROM DEPT_TEMP;

--NULL의 명시적 입력
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES (70, 'WEB', NULL); --NULL을 직접 입력
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (80, 'MOBILE', '');--빈 공백 문자열로 NULL 입력
SELECT * FROM DEPT_TEMP;

--NULL의 암시적 입력
INSERT INTO DEPT_TEMP (DEPTNO, LOC) VALUES (90, 'INCHEON'); --열 데이터를 넣지 않는 방식
SELECT * FROM DEPT_TEMP;

--테이블에 날짜 데이터 입력하기
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1; --테이블 열 구조는 같지만 데이터는 복사되지 않도록
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)--날짜 사이에 / 입력
    VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) --날짜 사이에 - 입력
    VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
SELECT * FROM EMP_TEMP;

--오라클이 설치되어 있는 운영체제의 종류나 사용하는 기본 언어군에 따라 날짜 표기방식이 다르다.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) --TO_DATE 함수
    VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
SELECT * FROM EMP_TEMP;

--SYSDATE로 현재 시점의 날짜 입력
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
    VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
SELECT * FROM EMP_TEMP; --사용 환경 또는 설정에 다라 HIREDATE열에 오전/오후 시간이 함게 출력될 수 있음.

--서브쿼리로 한 번에 여러 행 추가
--1. VALUES절은 사용하지 않는다.
--2. (데이터가 추가되는 테이블의 열 개수)==(서브쿼리의 열 개수)
--3. (데이터가 추가되는 테이블의 자료형)==(서브쿼리의 자료형)
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;
SELECT * FROM EMP_TEMP;

--INSERT: https://docs.oracle.com/cd/E11882_01/server.112/e41084/statements_9014.htm#SQLF01604
--MERGE: https://docs.oracle.com/cd/E11882_01/server.112/e41084/statements_9016.htm#SQLF01606

--UPDATE문
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP2;
--UPDATE: 데이터를 수정할 테이블을 지정
--SET: 변경할 열을 선택하고 데이터를 입력
--WHERE: 테이블의 변경할 데이터 선별 조건식을 지정, 생략시 테이블 내 지정된 모든 열의 데이터 변경

--전체 수정
UPDATE DEPT_TEMP2 SET LOC = 'SEOUL'; 
SELECT * FROM DEPT_TEMP2;
--이전 상태로 되돌리기
ROLLBACK; 
SELECT * FROM DEPT_TEMP2;
--일부 수정
UPDATE DEPT_TEMP2 SET DNAME = 'DATEBASE', LOC = 'SEOUL' WHERE DEPTNO = 40; 
SELECT * FROM DEPT_TEMP2;
--서브쿼리로 여러 열 한 번에 수정
UPDATE DEPT_TEMP2 SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40) WHERE DEPTNO = 40;
SELECT * FROM DEPT_TEMP2;
--서브쿼리로 여러 열 하나하나 수정
UPDATE DEPT_TEMP2 SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO = 40), LOC = (SELECT LOC FROM DEPT WHERE DEPTNO = 40) WHERE DEPTNO = 40;
SELECT * FROM DEPT_TEMP2;
--WHERE절에 서브쿼리 사용하여 수정
UPDATE DEPT_TEMP2 SET LOC = 'SEOUL' WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME = 'OPERATIONS');
SELECT * FROM DEPT_TEMP2;

--WHERE절 검증 후 수정/삭제
SELECT * FROM DEPT_TEMP2 WHERE DEPTNO = 40;
UPDATE DEPT_TEMP2 SET DNAME = 'DATABASE', LOC = 'SEOUL' WHERE DEPTNO = 40;

--DELETE문
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP2;
--DELETE [FROM]: 데이터를 삭제할 테이블을 지정
--WHERE: 테이블의 삭제할 데이터 선별 조건식을 지정, 생략시 테이블 내 지정된 모든 열의 데이터 삭제

--WHERE절 검증 후 일부 삭제
SELECT * FROM EMP_TEMP2 WHERE JOB = 'MANAGER';
DELETE FROM EMP_TEMP2 WHERE JOB = 'MANAGER';
SELECT * FROM EMP_TEMP2;
--WHERE절에 서브쿼리 사용하여 읿부 삭제
DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO FROM EMP_TEMP2 E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 3 AND DEPTNO = 30);
SELECT * FROM EMP_TEMP2;
SELECT * FROM SALGRADE;
ROLLBACK;
--전체 삭제
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

--=======================<<<제약 조건>>>============================
--개념: 어떤 테이블에 저장할 데이터의 특성을 정의하는 데 사용하는 특수한 규칙
--테이블의 특정 열에 지정
--목적: 데이터의 정확성 유지
--DB 설계 시점, 테이블 생성시 주로 지정, 테이블 생성 후에도 추가, 변경, 삭제 가능

--data integrity: 데이터 베이스에 저장되는 데이터의 정확성과 일관성을 보장한다.
--domain integrity
--열에 저장되는 값의 적정 여부 확인.
--자료형, 적절한 형식의 데이터, NULL 여부같은 종해놓은 범위를 만족하는 데이터임을 규정
--entity integrity
--테이블 데이터를 유일하게 식별할 수 있는 기본키는 반드시 값을 가지고 있어야 하며 NULL 불가, 중복 불가를 규정
--referential integrity
--참조 테이블의 외래키 같은 참조 테이블의 기본키로서 존재해야 하며 NULL이 가능


--NOT NULL(C) : NULL 불가, NULL을 제외한 데이터의 중복 허용
--UNIQUE(U) : 데이터의 중복 불가, NULL은 중복에서 제외
--PRIMARY KEY (P) : 기본키의 조건, 테이블에 하나만 지정 가능
--FOREIGN KEY  (R) : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
--CHECK (C) : 설정한 조건식을 만족하는 데이터만 입력 가능

--=================NOT NULL===================

CREATE TABLE TABLE_NOTNULL (LOGIN_ID VARCHAR2(20) NOT NULL, LOGIN_PWD VARCHAR2(20) NOT NULL, TEL VARCHAR2(20) );
DESC TABLE_NOTNULL;

--NULL 삽입 불가
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID_01', NULL, '010-1234-5678');

--무결성 충족
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD) VALUES ('TEST_ID_01', '1234');
SELECT * FROM TABLE_NOTNULL;

--NULL로 수정 불가(삭제에도 영향)
UPDATE TABLE_NOTNULL SET LOGIN_PWD = NULL WHERE LOGIN_ID = 'TEST_ID_01';

--제약 조건 살펴보기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS;

--테이블 생성시 제약 조건 이름 직접 지정 // 실무에서는 제약 조건 이름 지정!!
CREATE TABLE TABLE_NOTNULL2 (LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL, LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL, TEL VARCHAR2(20) );
DESC TABLE_NOTNULL2;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS;

--제약 조건 추가하기 // 대상이 되는 열이 가진 데이터 중 추가하려는 제약 조건에 맞지 않는 데이터 존재
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);

--제약 조건 추가하기
UPDATE TABLE_NOTNULL SET TEL = '010-1234-5678' WHERE LOGIN_ID = 'TEST_ID_01';
SELECT * FROM TABLE_NOTNULL;
ALTER TABLE TABLE_NOTNULL MODIFY TEL NOT NULL;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS;

--제약 조건에 이름 지정해서 추가하기
ALTER TABLE TABLE_NOTNULL2 MODIFY TEL CONSTRAINT TBL_TEL_NN NOT NULL;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS;
DESC TABLE_NOTNULL2;

--제약 조건 이름 변경하기
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBL_TEL_NN TO TBLNN2_TEL_NN;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS;

--제약 조건 삭제하기
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN2_TEL_NN;
DESC TABLE_NOTNULL2;

--================UNIQUE======================

--테이블을 생성하며 제약 조건 지정
CREATE TABLE TABLE_UNIQUE (LOGIN_ID VARCHAR2(20) UNIQUE, LOGIN_PWD VARCHAR2(20) NOT NULL, TEL VARCHAR(20) );
DESC TABLE_UNIQUE;

--제약 조건 확인
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TABLE_UNIQUE';

--삽입시 중복 불허
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
SELECT * FROM TABLE_UNIQUE;
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');

--NOT NULL은 중복 허용
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID_02', 'PWD01', '010-1234-5678');
SELECT * FROM TABLE_UNIQUE;

--UNIQUE의 NULL 허용 (NULL간의 비교 불가)
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL) VALUES (NULL, 'PWD01', '010-2345-6789');
SELECT * FROM TABLE_UNIQUE;

--수정시 중복 불허
UPDATE TABLE_UNIQUE SET LOGIN_ID = 'TEST_ID_01' WHERE LOGIN_ID IS NULL;

--테이블 생성하며 제약 조건 이름 직접 지정
CREATE TABLE TABLE_UNIQUE2 (LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE, LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL, TEL VARCHAR2(20) );
DESC TABLE_UNIQUE2;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--제약 조건 추가하기 // 대상이 되는 열이 가진 데이터 중 추가하려는 제약 조건에 맞지 않는 데이터 존재
ALTER TABLE TABLE_UNIQUE MODIFY TEL UNIQUE;

--제약 조건 추가하기
UPDATE TABLE_UNIQUE SET TEL = NULL;
SELECT * FROM TABLE_UNIQUE;
ALTER TABLE TABLE_UNIQUE MODIFY TEL UNIQUE;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--제약 조건 이름 지정해서 추가하기
ALTER TABLE TABLE_UNIQUE2 MODIFY TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--제약 조건 이름 변경하기
ALTER TABLE TABLE_UNIQUE2 RENAME CONSTRAINT TBLUNQ_TEL_UNQ TO TBLUNQ2_TEL_UNQ;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--제약 조건 삭제
ALTER TABLE TABLE_UNIQUE2 DROP CONSTRAINT TBLUNQ2_TEL_UNQ;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--==================PRIMARY KEY===================

--UNIQUE의 특성 + NOT NULL의 특성
--테이블에 하나만 지정 가능
--지정된 열은 자동으로 인덱스 생성

--테이블 생성하며 제약 조건 지정하기
CREATE TABLE TABLE_PK ( LOGIN_ID VARCHAR2(20) PRIMARY KEY, LOGIN_PWD VARCHAR2(20) NOT NULL, TEL VARCHAR2(20) );
DESC TABLE_PK;

--제약 조건 확인하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_PK%';

--자동 생성된 인덱스 확인하기
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME LIKE 'TABLE_PK%';

--테이블 생성하며 제약 조건 이름 지정하기
CREATE TABLE TABLE_PK2 (LOGIN_IN VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK PRIMARY KEY, LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_LGNPW_NN NOT NULL, TEL VARCHAR2(20) );
DESC TABLE_PK2;
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME LIKE 'TABLE_PK%';
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME LIKE 'TABLE_PK%';

--제약 조건 지정되었는지 확인하기
INSERT INTO TABLE_PK (LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
SELECT * FROM TABLE_PK;
INSERT INTO TABLE_PK (LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID_01', 'PW02', '010-2345-6789');
INSERT INTO TABLE_PK (LOGIN_ID, LOGIN_PWD, TEL) VALUES (NULL, 'PW02', '010-2345-6789');
INSERT INTO TABLE_PK (LOGIN_PWD, TEL) VALUES ('PW02', '010-2345-6789');

--ALTER TABLE 명령어 사용시
--생성시점에 확정되는 경우가 대부분
--이미 지정되어 있다면 다른 열에 추가 불가
--중복 값이나 NULL값이 있으면 지정 불가

--CREATE문에서 제약 조건을 지정하는 방식

--inline, column-level
--CREATE TABLE TABLE_NAME(
--  COL1 VARCHAR2(20) CONSTRAINT CONSTRAINT_NAME PRIMARY KEY,
--  COL2 VARCHAR2(20) NOT NULL,
--  COL3 VARCHAR2(20) 
--);

--outline, table-level
--CREATE TABLE TABLE_NAME(
--  COL1 VARCHAR2(20),
--  COL2 VARCHAR2(20),
--  COL3 VARCHAR2(20)
--  PRIMARY KEY (COL1).
--  CONSTRAINT CONSTRAINT_NAME UNIQUE (COL2)
--);

--=============FOREIGN KEY===================

--EMP TABLE & DEPT TABLE constraint condition
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('EMP', 'DEPT');
--외래키가 참조하는 열에 존재하지 않는 데이터 입력하기
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (9999, '홍길동', 'CLERK', '7788', TO_DATE ('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50 );

--inline, column-level
--CREATE TABLE 테이블 이름 (…(다른 열 정의), 열 자료형 CONSTRAINT 제약조건이름 REFERENCES 참조테이블(참조할 열) );
--outline, table-level
--CREATE TABLE 테이블 이름 (…(다른 열 정의), CONSTRAINT 제약조건이름 FOREIGN KEY 열 REFERENCES 참조테이블 (참조할 열) );

--참조 대상이 될 테이블 생성하기
CREATE TABLE DEPT_FK (DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY, DNAME VARCHAR2(14), LOC VARCHAR2(13) );
DESC DEPT_FK;
--외래키 제약 조건을 정의한 테이블 생성하기
CREATE TABLE EMP_FK (EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY, ENAME VARCHAR2(10), JOB VARCHAR2(9), MGR NUMBER(4), HIREDATE DATE, SAL NUMBER(7, 2), COMM NUMBER(7, 2), DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO) );
DESC EMP_FK;

--참조 주체가 참조 대상의 열에 존재하지 않는 값을 사용하는 것은 불가능하다.
--외래키는 다른 테이블의 기본키여야 한다. 참조 대상 테이블의 기본키, 즉 부모키가 없다면 오류 발생
INSERT INTO EMP_FK VALUES(9999, ‘TEST_NMAME’, ‘TEST_JOB’, NULL, TO_DATE(’2001/01/01’, ‘YYYY/MM/DD’), 3000, NULL, 10);

--선...참조 대상 테이블의 기본키에 데이터 삽입
INSERT INTO DEPT_FK VALUES (10, ‘TEST_DNAME’, ‘TEST_LOC’);
SELECT * FROM DEPT_FK;
--후...참조 행위의 주체 테이블의 외래키에 데이터 삽입
INSERT INTO EMP_FK VALUES(9999, ‘TEST_NMAME’, NULL, TO_DATE(’2001/01/01’, ‘YYYY/MM/DD’), 3000, NULL, 10);
SELECT * FROM EMP_FK;

--삭제하려는 값을 참조하는 데이터가 존재하면 오류가 발생한다. 
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

--1. 현재 삭제하려는  열 값을 참조하는 데이터를 먼저 삭제한다.
--2. 현재 삭제하려는 열 값을 참조하는 데이터를 수정한다. (해당 열의 다른 값 또는 NULL로 변경한다.)
--3. 현재 삭제하려는 열을 참조하는 자식 테이블의 외래키 제약 조건을 해제한다. 
--위 방법은 삭제할 데이터를 참조하는 데이터의 수정 또는 삭제 작업을 선행해야 함.
--외래키 제약 조건을 해제할 수 없는 경우도 종종 있음

--(제약 조건을 처음 지정할 때 추가 옵션을 지정하는 방법)
--열 데이터를 삭제할 때 이 데이터를 참조하고 있는 데이터도 함께 삭제
--CONSTRAINT 제약조건이름 REFERENCES 참조테이블(참조할 열) IN DELETE CASCADE
--열 데이터를 삭제할 때 이 데이터를 참조하는 데이터를 NULL로 수정
--CONSTRAINT 제약조건이름 REFERENCES 참조테이블(참조할 열) ON DELETE SET NULL

--외래키 제약 조건도 테이블을 설계하는 시점에 결정나는 경우가 많다.

--======================CHECK=========================

--활용: 열에 저장할 수 있는 값의 범위 또는 패턴 정의할 때 사용

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






