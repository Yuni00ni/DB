-- CHAPTER 01.SELECT절

-- 주석기호

-- 주석 색깔 바꾸기
-- 도구 > 환경설정 > 코드편집기 > PL/SQL구문색상 

DESC EMPLOYEES ;

-- DESC(DESCRIBE) : 테이블의 정보를 확인하는 명령어.

-- 데이터베이스에서 데이터를 가져오는 방법
-- [ SELECT 절 사용 방법 ]
-- SELECT  [ALL/DISTINCT] 사용자가 조회하고 하는 "컬럼의 정보"
-- FROM     데이터(컬럼의정보)를 가져올 "테이블의 정보"

-- 직원(EMPLOYEES) 테이블에서 직원의 이름(FIRST_NAME), (LAST_NAME)의 정보를 가져오고 싶다.

SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER, SALARY 
FROM EMPLOYEES ;

select first_name, last_name 
from employees ;

-- 주석기호 (2)
/*

1. SQL 실행 단축키 : CTRL + ENTER , F9
2. SQL 문장은 대소문자 구분하지 않는다.
3. SQL 문장은 띄어쓰기에 영향을 받지 않는다.
4. SQL 문장 끝에는 반드시 문장의 끝을 알수 있게 하는 ;(세미클론)을 작성 해야한다.

*/

-- SQL 정석 작성방식
SELECT FIRST_NAME
     , LAST_NAME
     , PHONE_NUMBER
     , SALARY 
  FROM EMPLOYEES  ;
  

-- 부서테이블에서 부서ID, 부서이름의 컬럼의 정보를 가져오시오.
DESC DEPARTMENTS;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPARTMENTS ;

-- 직원테이블에서 직원ID, 직원이름, 급여(SALARY), 직책ID, 부서ID 정보를 가져오시오
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , SALARY
     , JOB_ID
     , DEPARTMENT_ID
  FROM EMPLOYEES ;

-- 직책테이블(JOBS) 에서 직책ID, 직책내용의 컬럼의 정보를 가져오시오.
SELECT JOB_ID, JOB_TITLE
  FROM JOBS ;

-- DISTINCT : 중복 제거하는 옵션이다 . (SELECT 절에 한번만 사용이 가능하다).
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES ;

SELECT DISTINCT JOB_ID FROM EMPLOYEES;

-- 전체 조회하기 : *(애스타리스크)
-- SELECT절에 * 를 사용하게 되면 전체 컬럼을 선택하는 애스타리스크라는 특수 문자로 적용된다.


SELECT *
  FROM EMPLOYEES ;

-- 부서테이블의 전체 정보 확인
SELECT *
  FROM DEPARTMENTS ;

-- 직책테이블의 전체 정보 확인
SELECT *
  FROM JOBS;

-- 위치테이블의 전체 정보 확인
SELECT *
  FROM LOCATIONS;

-- 나라테이블의 전체 정보 확인
SELECT *
  FROM COUNTRIES;
  
-- 컬럼의 산술연산 적용해보기
-- 컬럼의 유형이 숫자형(NUMBER)/날짜형(DATE) 이면 산술 연산(+,-,*,/)이 적용된다.

DESC EMPLOYEES ;

-- 직원테이블에서 직원ID, 이름, 급여 정보를 확인해보자.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 12 AS "연 봉"
     , HIRE_DATE, HIRE_DATE + 1 AS H_001
  FROM EMPLOYEES ; 

-- 별칭을 사용하기
-- Alias(별칭) 은 주로 AS 라는 키워드로 컬럼명에 별칭을 사용한다.
-- 별칭을 사용시 특수문자까지 별칭에 적용시키기 위해서는 ""감싸줘야 한다.

-- [ 별칭 사용 방법 ]
-- 1. SELECT 특정컬럼 AS 별칭
-- 2. SELECT 특정컬럼 AS "별칭"
-- 3. SELECT 특정컬럼 별칭
-- 4. SELECT 특정컬럼 "별칭"

-- 실습문제) 직원테이블에서 직원ID, 이름(FIRST_NAME), 급여, 보너스정보(COMMISSION_PCT), 연락처 의 정보를 출력
-- 별칭을 사용하여 직원아이디, 이름, 보너스, 연락처, 라는 별칭으로 출력.

SELECT EMPLOYEE_ID AS 직원아이디
     , FIRST_NAME AS 이름
     , SALARY
     , COMMISSION_PCT AS 보너스정보
     , PHONE_NUMBER AS 연락처
  FROM EMPLOYEES ;

-- [ ORDER BY 절 사용 ]
-- 2. SELECT   조회하고자 하는 "컬럼의 정보"
-- 1. FROM     데이터를 가져올 "테이블의 정보"
-- 3. ORDER BY 특정 컬럼을 기준으로 "정렬 화"

-- ASC  : 오름차순 정렬 ( 1,2,3,4,5....)
-- DESC : 내림차순 정렬 (10,9,8,7,....)

-- 직원테이블에서 직원의 이름과 급여 정보 출력.
SELECT FIRST_NAME, SALARY 
  FROM EMPLOYEES 
ORDER BY SALARY ; 

-- 실습) 직원의 모든 정보를 조회하는데 최근에 입사한 순으로 정렬하여 출력.
SELECT *
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- NULL 값이란
-- 존재하지 않거나 정해지지 않은 것을 의미한다.
-- 데이터의 값이 완전히 비어 있는 상태를 말한다
-- NULL , ""
--> 0, " "(공백)은 NULL 값이 아니다 > 데이터가 존재한다.
--> 1. NULL은 산술 연산(+,-,*,/)이 적용되지 않는다 --> 무조건 NULL값이 나온다.
--> 2. NULL은 비교 연산(=, >,>=,<,<=) 이 적용되지 않는다. --> 무조건 FALSE 값이 반환된다.

-- USER IS "" --> NULL 인상태
-- USER IS " " --> 공백이라는 유저에 접속이 되어있는 상태

SELECT FIRST_NAME, SALARY, COMMISSION_PCT 
     , COMMISSION_PCT * 2
  FROM EMPLOYEES ;
  

DESC EMPLOYEES;




