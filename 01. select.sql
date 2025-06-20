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
    last_name,
    phone_number,
    salary
FROM
    employees;