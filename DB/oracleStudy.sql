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


--<<<오라클 함수>>>
--특정한 결과 값을 얻기 위해 데이터를 입력할 수 있는 특수 명령어
--매개변수, 입력 파라미터, 인자
--단일행 함수; 한 행씩 입력되고 한 행당 결과가 하나씩 나오는 함수
--다중행 함수: 여러 행이 입력되어 하나의 행으로 결과가 반환되는 함수

--대소문자 변환 // UPPER, LOWER, INITCAP
--입력 데이터에 열 이름이나 데이터를 직접 지정해야 함.
--활용: 실제 검색어의 대, 소문자 여부와 상관없이 검색 단어와 일치한 문자열을 포함한 데이터 검색 가능
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;
SELECT * FROM EMP WHERE UPPER(ENAME) = UPPER('SCOTT');
SELECT * FROM EMP WHERE UPPER(ENAME) LIKE UPPER('SCOTT');

--문자열 길이,바이트 구하기 // LENGTH, LENGTHB
SELECT ENAME, LENGTH(ENAME) FROM EMP;
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME) >= 5;
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;



--JOIN
--FROM절에 테이블 또는 열과 행으로 구성된 데이터 집합 지정 가능

--크로스 조인(교차 조인)
--데카르트 곱(카테시안 곱: Cartesian product): 각 집합을 이루는 모든 원소의 순서쌍
--(데카르트 곱 현상이 일어나지 않게 하는 데 필요한 조건식의 개수) = (조인 테이블 개수) - 1
SELECT * FROM EMP, DEPT ORDER BY EMPNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO ORDER BY EMPNO; --특정 테이블의 특정 열 이름 비교 조건
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO ORDER BY EMPNO; --테이블 이름의 별칭 지정

--대상 데이터를 어떻게 연결하느냐에 따라

--1. 등가 조인(equi join)/내부 조인, 단순 조인
--여러 테이블에 있는 열은 반드시 속해 있는 테이블 명시해야 함
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

--<<<SQL-99 표준 문법>>>
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

--<<<서브쿼리>>>
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


--DML

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

 