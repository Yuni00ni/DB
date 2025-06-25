-- CHAPTER 04. GRUOP BY절

-- 내장함수 : 오라클에서 미리 만들어 놓은 함수 > 호출해서 사용하기만 하면 된다.
-- 문자형, 숫자형, 날짜형, 변환형, null처리함수, decode(조건함수)....

-- [ 내장함수의 종류 ]
-- 단일행 함수 : 입력된 하나의 행당 겨로가가 하나씩 나오는 함수
-- 다중행 함수 : 여러 행을 입력받아 하나의 결과 값으로 출력이 되는 함수
--> 다중행 함수를 '집계함수' 라고 부른다.

-- [ 다중행 함수 종류 ] = 집계함수
-- count() : 지정한 데이터의 개수를 반환
-- sum() : 지정한 데이터의 합을 반환
-- max() : 지정한 데이터의 최대값을 반환
-- min() : 지정한 데이터의 최소값을 반환
-- avg() : 지정한 데이터의 평균값을 반환

-- 집계함수의 특징
-- 1. 집계함수는 null값을 제외하는 특성을 가지고 있다.
-- 2. 집계함수는 group by절이 있어야만 사용이 가능하다.

-- 직원테이블에서 직원id의 행의 개수를 가져오기

select count(employee_id), --> 1개
       first_name --> 107개
       from employees group by (first_name);

-- 출력하려는 행의 개수가 맞지 않기 때문에 에러가 발생한다.

select count(department_id) as "dp_id 개수"
       from employees;
       
-- count()함수는 *(전체선택)를 사용할 수 있다.
-- 다만 다른 집계함수는 사용 불가

select count(*) from employees;

-- 직원테이블에서 직원의 급여의 총 합계를 구하시오.

select sum(salary) from employees;

-- 직원테이블에서 직원들의 최대 급여와 최소 급여를 구하시오.

select max(salary), min(salary) from employees;

-- 직원테이블에서 부서id가 100인 직원의 평균 급여를 구하시오.
-- 단, 결과값은 소수점 1의자리까지 반올림하여 출력.

select round(avg(department_id), 1) from employees;

