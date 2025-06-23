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

-- 데이터 유형에 따른 사용하는 방법

-- 문자형, 날짜형 -> 반드시 ''(작은따옴표)로 감싸줘야 한다.
-- ㄴ> ""(쌍따옴표)는 문자로 인식하지 못한다. 다만 별칭을 사용할 때 특수문자를 인식하기 위해 사용한다.

-- 숫자형 -> 그냥 숫자로 쓰면 된다.

select * from employees;

-- job_id(직책) 정보가 it_prog에 해당하는 직원의 수는 몇 명인가? >> 5명
select * from employees where job_id = 'IT_PROG';

-- 비교연산자
-- = : 같다.
-- > : 보다 크다(초과)
-- >= : 보다 크거나 같다(이상)
-- < : 보다 작다(미만)
-- <= : 보다 작거나 같다(이하)

-- 직원테이블에서 급여가 5000 이하인 직원의 직원id, 이름(first_name), 이메일, 급여(salary)를 가져오시오.
select employee_id, first_name, email, salary from employees where salary <= 5000 order by salary desc;

-- 문제1) 직원테이블에서 연봉이 120000이상인 직원의 직원id, 이름, 부서id, 직책id, 급여, 연봉 정보를 조회하시오. 단 연봉은 s_001 이라는 별칭을 적용하고 직원id기준으로 내림차순 정렬하여 조회하시오.
select employee_id, first_name, department_id, salary, salary * 12 as "s_001" from employees where salary * 12 >= 120000 order by employee_id desc;
 
 -- 문제2) 직원테이블에서 최근에 입사한 날짜를 기준으로 모든 직원의 정보를 조회하시오. 단 입사날짜는 "입사날짜" 라는 별칭을 적용하여 출력하시오.
select employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id, hire_date as "입사날짜" from employees order by hire_date desc;

-- 문제3) 입사날짜가 06년06월01일 이후에 입사한 직원들의 모든 정보를 조회하시오.
select * from employees where hire_date > '06/06/01' order by hire_date asc;

-- 부정 비교 연산자
-- !=, <>, ^= : 같지 않다.
-- not a = b : 같지 않다.

-- 문제) 부서가 50에 해당하지 않는 직원의 이름과, 부서정보를 조회하시오. 
select first_name, department_id from employees where department_id != 50 order by department_id desc;

-- 문제2) 직책이 it_prog에 해당하지 않는 직원의 직원id, 이름, 직책id, 급여 정보를 조회하시오.
select employee_id, first_name, job_id, salary from employees where job_id != 'IT_PROG' order by employee_id asc;

-- 논리 연산자 : 조건과 조건을 이어주는 역할을 하는 연산자
-- and : 조건 모두 만족해야만 true값을 반환
-- or : 하나의 조건이라도 만족하면 true값을 반환

-- 연산자의 우선 순위(실행 순서)
-- and > or : and연산자가 or 연산자보다 우선순위가 높기 때문에 and연산자가 먼저 실행이 된다.

-- 문제) 부서가 30, 40, 50에 해당하는 직원들의 이름과 급여와 부서정보를 조회하시오. 부서를 기준으로 내림차순 정렬하여 조회하시오.

-- 직원 테이블의 모든 정보를 가져온것(출력한것)
select * from employees;

select salary, department_id from employees where department_id = 30 or department_id = 40 or department_id = 50 order by department_id desc;

