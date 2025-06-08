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

