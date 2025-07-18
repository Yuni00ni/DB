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

select first_name, salary, department_id from employees where department_id = 30 or department_id = 40 or department_id = 50 order by department_id desc;

-- 문제1) 부서가 50이면서 직책이 st_man인 직원의 모든 정보를 조회하시오.
select * from employees where department_id = 50 and job_id = 'ST_MAN';

-- 문제2) 부서가 100이거나 급여가 7000 미만인 직원의 직원id, 이름, 부서정보, 급여정보를 조회하시오.
select employee_id, first_name, department_id, salary from employees where department_id = 100 or  salary < 7000;

-- 문제3) 직책이 st_man이고 급여가 7000미만인 직원의 이름, 직책, 급여 정보를 조회하시오.
select first_name, job_id, salary from employees where job_id = 'ST_MAN' and salary < 7000;

-- 문제4) 부서가 50이거나 90에 소속된 직원 중에서 급여가 7000이상을 받고 일하고 있는 직원의 이름, 부서id, 급여 정보를 조회하시오.
select first_name, department_id, salary from employees where department_id = 50 or department_id = 90 and salary > 7000;

-- 문제5) 부서가 100이거나 90인 직원 중에 직원id가 101인 직원의 직원id, 이름, 급여, 연봉 정보를 조회하시오.
select department_id, employee_id, first_name, salary, salary * 12 as "연봉" from employees where (department_id = 100 or department_id = 90) and employee_id = 101;
-- and가 연산 순서가 or 보다 높은건 연산이 먼저 처리되는 것. 조건의 우선순위가 높은 것이 아님. 혼동하지 말 것.

-- SQL 연산자
-- SQL에서만 사용할 수 있는 연산자다
-- is null, in, between, like

-- is null 연산자
-- 데이터 값이 null인 값을 조회하여 가져온다.

-- is null : 데이터 값이 null인 값을 조회하는 연산자
-- is not null : 데이터 값이 null이 아닌 값을 조회하는 연산자

-- 직원테이블에서 직원의 이름, 급여, 보너스 정보를 조회한 것
select first_name, salary, commission_pct from employees;

-- 보너스를 받고 있지 않는 직원의 수는 몇 명인가? = 72명 % 35
-- 출력 결과를 통해서 알아보자.
select first_name, salary, commission_pct from employees where commission_pct is not null;

-- 직원테이블에서 부서id를 조회하시오.
select department_id from employees;

-- 부서가 존재하지 않는 직원의 이름은 누구인가?
--> Kimberely Grant
select first_name, last_name, department_id from employees where department_id is null;

-- 부서장이 존재하는 부서의 모든 정보를 조회하시오.
select * from departments where manager_id is not null;

-- in 연산자
-- 특정 컬럼에 포함된 데이터를 여러 개 조회할 때 사용한다.
-- = + or 의 결과값이다.
-- in 연산자는 null값을 제외하는 특성을 가지고 있다.

-- 부서가 10, 20, 30, 40에 해당하는 직원의 이름과 부서 정보를 조회하시오.
select * from employees;

select first_name, department_id from employees where department_id = 10 or department_id = 20 or department_id = 30 or department_id = 40;

-- in 연산자 사용법
select first_name, department_id from employees where department_id in (10, 20, 30, 40) or department_id is null;

-- in 연산자 활용
-- 문제1) 직원테이블에서 직책이 ad_pres 이거나 it_prog인 직원의 이름과 직책 정보를 조회하시오.
select first_name, last_name, job_id from employees where job_id in ('AD_PRES', 'IT_PROG');

-- 문제2) 이메일이 sande, tfox, dlee인 직원의 이름과 이메일, 핸드폰번호 정보를 조회하시오.
select first_name, last_name, email, phone_number from employees where email in ('SANDE', 'TFOX', 'DLEE');

-- 문제3) 매니저 아이디가 100, 102, 103, 104, 105에 해당하지 않는 직원의 이름과 직원id, 매니저id를 조회하시오.
select first_name, last_name, employee_id, manager_id from employees where manager_id not in (100, 102, 103, 104);

-- 문제4) 부서가 10, 20, 30, 40에 해당하지 않는 부서명, 부서id, 위치id를 조회하시오.
select department_name, department_id, location_id from departments where department_id not in (10, 20, 30, 40);

-- between 연산자
-- 일정 범위 내의 데이터를 조회할 때 사용한다.

-- between a(최소값) and b(최대값)
-- a이상(<=) b이하(<=)에 해당하는 범위의 값을 가져오는 것

-- 급여가 10000 이상 20000 이하의 범위안에 있는 직원의 이름과 급여 정보를 조회하시오.
select first_name, salary from employees where salary >= 10000 and salary <= 20000 order by salary;

-- between 적용하여 SQL 작성
select first_name, salary from employees where salary between 10000 and 20000 order by salary;

-- like 연산자
-- 일부 문자열이 포함된 데이터를 조회하고자 할 때 사용하는 연산자.
-- 와일드카드(특수문자)를 이용해서 매칭 연산을 진행합니다.

-- [ 와일드 카드의 종류 ]
-- % : 길이와 상관 없이 모든 데이터를 의미하는 특수문자
-- _ : 어떤 값이든 상관 없이 한 개의 문자 데이터를 의미하는 특수문자

-- 직원테이블에서 직원의 직원id와 이름과 핸드폰번호를 조회하시오.
select employee_id, first_name, phone_number from employees;

-- 핸드폰 번호가 650으로 시작하는 직원의 이름과 핸드폰번호 출력
select first_name, phone_number from employees where phone_number like '650%';

-- fitst_name이 S로 시작하고 n으로 끝나는 직원의 first_name의 정보를 가져오기
select first_name from employees where first_name like 'S%n';

-- first_name이 it로 끝나고 총 4글자인 직원의 first_name의 정보를 가져오기
select first_name from employees where first_name like '__it';

-- first_name의 두번째 글자가 e인 직원의 first_name의 정보를 가져오기
select first_name from employees where first_name like '_e%';

