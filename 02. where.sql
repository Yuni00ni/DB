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

-- 대표이사의 지시를 받고 일을 하고 있는 직원의 정보
select * from employees where manager_id = 100;



-- 데이터베이스에서 사용하는 자료형 종류

-- varchar2(n) : 가변형 문자형, n크기만큼 길이를 갖지만 가변 길이로 조정이 가능
-- number(p, s) : 숫자형 자료형, p 자리만큼 입력받고, s자리만큼 소수를 입력 받는다.(p,s 는 생략 가능, 최대 크기는 138)
-- ㄴ> ex) number(3) = 999, number(3,1) = 99.9, number(3,2) = 9.99

-- date : 날짜형 자료형, sysdate(날짜형)함수를 사용하여 현재 날짜 값을 입력 받는다.
-- timestamp라는 구체적인 시간을 지정하는 자료형도 있다(ms까지 지정 가능)