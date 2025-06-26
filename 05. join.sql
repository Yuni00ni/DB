-- chapter 05. join

-- rdbms(관계형 데이터베이스)
-- Relational DataBase Mangerment System

-- pk (primary key) : 기본키, 관계형 데이터베이스에서 각 행(row)을 고유하게 식별하기 위한 컬럼값
--> 테이블에서 pk는 반드시 존재해야한다.
-- pk의 특징은 not null + unique이다.

select * from employees;

-- fk(foreigh key) : 외래키(참조키), 테이블과 테이블을 이어주는 역할
-- 참조테이블(부모테이블)의 pk를 참조하는 컬럼을 말함

-- [ 등가 조인 사용 방법 ]

-- select 테이블1.컬럼명, 테이블2.컬럼명 --> .(경로)를 작성함으로써 해당 테이블에 컬럼을 조회
-- from 테이블1, 테이블2 --> 해당 테이블을 조인(연결)하겠다.
-- where 테이블1.컬럼명 = 테이블2.컬럼명 --> 해당 조건으로 조인하겠다(조인 조건)

-- 직원테이블에서 직원id, 이름, 부서id 조회
select employee_id, first_name, department_id from employees;

select * from departments;
select * from locations;
select * from countries;
select * from regions;

-- 직원id, 이름, 부서id, 부서명
-- 조인할 테이블의 정보 : employees, departments

select employees.employee_id, employees.first_name, employees.department_id, departments.department_name from employees, departments where employees.department_id = departments.department_id order by employees.employee_id;

-- from절에 별칭 사용(테이블에 별칭 적용하기)
-- as키워드를 사용할 수 없음
-- from절에 별칭 사용시 이후에 사용되는 절에도 반드시 별칭을 적용해야한다.
select e.employee_id, e.first_name, e.department_id, d.department_name from employees e, departments d where e.department_id = d.department_id order by e.employee_id;

-- [ 조인 프로세스 ]
-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. from : 조인할 테이블을 ","(콤마) 기준으로 작성
-- 3. where : 조인 조건이 되는 "특정 컬럼"을 확인하여 조인 조건절을 작성
--> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간 같은 값을 가지는 컬럼
--> 대부분 pk와 fk관계로 조인이 이루어지나, 예외의 경우도 존재함
--> 예외 : 의미있는 같은 값을 가지면 조인할 수 있음
-- 4. select : .(경로)를 작성하여 해당 테이블의 컬럼 값을 작성

-- 문제1) 학생id, 학생이름, 과목, 성적 출력
-- 조인할 테이블의 정보 : 수강생정보, 성적표
select 성.학생ID, 수.학생이름, 성.과목, 성.성적 from 수강생정보 수, 성적표 성 where 수.학생ID = 성.학생ID;

-- 문제2) 직원테이블에서 직원id, 이름, 직책id 직책title 의 컬럼의 정보 순으로 출력
-- 조인할 테이블의 정보 : employees, jobs
-- 직원id 기준으로 오름차순(asc) 정렬하여 출력
select e.employee_id, e.first_name, e.job_id, j.job_title from employees e, jobs j where e.job_id = j.job_id order by employee_id;

-- inner join으로 풀어보기
select e.employee_id, e.first_name, e.job_id, j.job_title from employees e inner join jobs j on e.job_id = j.job_id where j.job_id not in ('AD_PRES', 'AD_VP', 'IT_PROG') order by employee_id;

-- cross join : 조인조건절이 없는 조인 방식
--> 조인 조건이 없기 때문에 모든 경우의 수가 나온다
--> 카티션 곱 : 모든 경우의 수가 출력이 되는 것

select 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적 from 수강생정보, 성적표;

-- cross join 사용방법
select 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적 from 수강생정보 cross join 성적표;

-- 단독으로 존재하는 테이블이면 경로(.)를 안적어줘도 db가 찾아준다.
-- 하지만 코드의 가독성을 위해서 테이블의 경로를 적어주는 것이 좋다.
select department_id, department_name, manager_id, location_id from departments;

-- 문제3) 부서id, 부서명, 위치id, 도로명주소, 도시 출력
-- 조건 : 부서가 30, 40, 100인 부서만 조회하시오.
select d.department_id, d.department_name, d.location_id, l.street_address, l.city from departments d, locations l where d.location_id = l.location_id and d.department_id in (30, 40, 100) order by d.department_id;

-- [ inner join 사용 방법 ]
-- select : 조회하고자 하는 컬럼의 정보는.(경로)를 통해 작성
-- from : 테이블1 inner join 테이블2
-- on : (테이블1.컬럼 = 테이블2.컬럼) -- 조인조건 작성
-- where : 일반 행을 선별하기 위한 조건식 -- 일반 조건 작성

select d.department_id, d.department_name, d.location_id, l.street_address, l.city from departments d inner join locations l on (d.location_id = l.location_id) where d.department_id in (30, 40, 100) order by d.department_id;

