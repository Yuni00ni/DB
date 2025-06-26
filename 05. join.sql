-- chapter 05. join

-- rdbms(관계형 데이터베이스)
-- Relational DataBase Mangerment System

-- pk (primary key) : 기본키, 관계형 데이터베이스에서 각 행(row)을 고유하게 식별하기 위한 컬럼값
--> 테이블에서 pk는 반드시 존재해야한다.
-- pk의 특징은 not null + unique이다.

select * from employees;

-- fk(foreigh key) : 외래키(참조키), 테이블과 테이블을 이어주는 역할
-- 참조테이블(부모테이블)의 pk를 참조하는 컬럼을 말함

-- [ 조인 사용 방법 ]

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

-- 문제2) 직원테이블에서 직원id, 이름, 직책id 직책title 조회
select e.employee_id, e.first_name, e.job_id, j.job_title from employees e, jobs j where e.job_id = j.job_id order by employee_id;

