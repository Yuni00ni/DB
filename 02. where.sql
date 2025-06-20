-- chapter 02.where절

-- 조건을 통해 원하는 데이터만 데이터베이스에서 가져오는 방법

-- [ where절 사용 방법 ]
-- select 조회하고자 하는 "컬럼의 정보"
-- from 데이터를 가져올 "테이블의 정보"
-- where 원하는 행(데이터)만 선별하여 가져오기 위한 "조건식"

select * from employees;

-- employee_id가 105에 해당하는 직원의 전체 정보만 가져오세요
select * from employees where employee_id = 105;

-- 급여가 4800에 해당하는 직원의 이름과, 직원id, 부서id, 급여 정보를 조회하시오.
select first_name, employee_id, department_id, salary from employees where salary = 4800;
-- 부서id가 90에 해당하는 부서id, 부서이름을 조회하시오.
select department_id, department_name from departments where department_id = 90;
-- manager_id가 100에 해당하는 직원의 모든 정보를 조회하시오.
select * from departments where manager_id = 100;

