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

