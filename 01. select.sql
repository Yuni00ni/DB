-- chapter 01. select절

-- 주석기호

-- 주석 색깔 바꾸기
-- 도구 > 환경설정 > 코드편집기 > PL/SQL구문색상

desc employees;

-- desc(describe) : 테이블의 정보를 확인하는 명령어.

-- 데이터베이스에서 데이터를 가져오는 방법
-- [ select 절 사용 방법 ]
-- select   사용자가 조회하고자 하는 "컬럼의 정보"
-- from     데이터(컬럼의 정보)를 가져올 "테이블의 정보"

-- 직원 (employees) 테이블에서 직원의 이름(first_name), (last_name)의 정보를 가져오고 싶다.
SELECT
    first_name,
    last_name,
    phone_number,
    salary
FROM
    employees;

-- 주석기호 (2)
/*
1. SQL 실행 단축키 : ctrl + enter, f9
2. SQL 문장은 대소문자 구분하지 않음.
3. SQL 문장은 띄어쓰기에 영향을 받지 않음.
4. SQL 문장 끝에는 반드시 문장의 끝을 알수 있게 하는 ;(세미콜론)을 작성 해야한다.
*/

-- SQL 정석 작성방식
SELECT
    first_name,
    NULL last_name,
    phone_number,
    salary
FROM
    employees;
    
-- 부서테이블에서 부서ID, 부서이름의 컬럼의 정보를 가져오시오.
SELECT
    department_id,
    department_name
FROM
    departments;

-- 직원테이블에서 직원ID, 직원이름, 급여(salary), 직책ID, 부서ID 정보를 가져오시오.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    job_id,
    department_id
FROM
    employees;

-- 직책테이블(jobs)에서 직책id, 직책내용의 컬럼의 정보를 가져오시오.
SELECT
    job_id,
    job_title
FROM
    jobs;

-- distinct : 중복 제거하는 옵션이다. (select 절에 한 번만 사용이 가능하다.)
SELECT DISTINCT
    department_id
FROM
    employees;

SELECT DISTINCT
    job_id
FROM
    employees;

-- 전체 조회하기 : *(애스타리스크)
-- select절에 * 를 사용하게 되면 전체 컬럼을 선택하는 애스타리스크라는 특수 문자로 적용된다.

SELECT
    *
FROM
    employees;

-- 부서테이블의 전체 정보 확인
SELECT
    *
FROM
    departments;
-- 직책테이블의 전체 정보 확인
SELECT
    *
FROM
    employees;
-- 위치테이블의 전체 정보 확인
SELECT
    *
FROM
    locations;
-- 나라테이블의 전체 정보 확인
SELECT
    *
FROM
    regions;

-- 컬럼의 산술연산 적용해보기
-- 컬럼의 유형이 숫자형/날짜형이면 산술 연산이 적용된다.

desc employees;

-- 직원테이블에서 직원ID, 이름, 급여 정보를 확인해보자.
SELECT
    employee_id,
    first_name,
    salary,
    salary * 12 as "연 봉",
    hire_date
FROM
    employees;
    
-- 별칭을 사용하기
-- Alias(별칭)은 주로 AS 라는 키워드로 컬럼명에 별칭을 사용한다.
-- 별칭을 사용 시 특수문자까지 별칭에 적용시키기 위해서는 ""감싸줘야 한다.

-- [ 별칭 사용 방법 ]
-- 1. select 특정컬럼 as 별칭
-- 2. select 특정컬럼 as "별칭"
-- 3. select 특정컬럼 별칭
-- 4. select 특정컬럼 "별칭"

-- 실습문제) 직원테이블에서 직원ID, 이름(first_name), 급여, 보너스정보(commission_pct), 연락처의 정보를 출력
-- 별칭을 사용하여 직원아이디, 이름, 보너스, 연락처라는 별칭으로 출력
select employee_id as 직원아이디, first_name as 이름, salary as 급여, commission_pct as 보너스, phone_number as 연락처 from employees;


-- order by 절 사용
-- select   조회하고자 하는 "컬럼의 정보"
-- from     데이터를 가져올 "테이블의 정보"
-- order by 특정 컬럼을 기준으로 "정렬화"

-- asc : 오름차순 정렬 (1,2,3,4,5....) -> 컬럼만 입력 시 기본값.
-- desc : 내림차순 정렬 (10,9,8,7,6.........)

-- 직원테이블에서 직원의 이름과 급여 정보 출력.
select first_name, salary from employees order by salary;

-- 실습) 직원의 모든 정보를 조회하는데 최근에 입사한 순으로 정렬하여 출력
select * from employees order by hire_date desc;

-- null 값이란
-- 존재하지 않거나 정해지지 않은 것을 의미한다.
-- 데이터의 값이 완전히 비어 있는 상태를 말한다.
-- null, '', ""
--> 0, " "(공백)은 null 값이 아니다 > 데이터가 존재한다.

-- null값의 특징
--> 1. null은 산술 연산이 적용되지 않는다. --> 무조건 null값이 나온다.
--> 2. null은 비교연산(=, >, >=, <, <=)이 적용되지 않는다. --> 무조건 false값이 반환된다.

-- user is "" << null
-- user is " " << 공백이라는 특수문자를 가진 유저로 접속된 상태

select first_name, salary, commission_pct, commission_pct * 2 from employees;

desc employees;