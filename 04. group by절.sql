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

select * from 수강생정보;

select * from 성적표;

-- group by절이란?
-- 특정 컬럼을 기준으로 그룹화(묶는다)

-- sql 작성 순서
-- select > from > where > group by > having > order by;

-- *** sql 실행 순서 ***
-- from > where > group by > having > select > order by;

-- [ group by절 사용 방법 ]
-- select : 조회하고자 하는 "컬럼의 정보"
-- from : 데이터를 가져올 "테이블의 정보"
-- where : 원하는 행(데이터)를 선별하기 위한 "조건식"
-- group by : 특정 컬럼을 기준으로 "그룹화"

-- 수강생정보테이블에서 소속반 별로 반별 인원수를 집계를 통해 구해보자.
select 소속반, count(학생id) as "반별 인원수" from 수강생정보 group by 소속반;

select * from 수강생정보;

-- group by란 통계적인 자료를 가지고 분석을 하기 위해 사용하는 것
-- 특정 컬럼을 적용시켜서 그룹화를 하고 통계적 자료를 분석하기 위해 사용한다.

-- [ group by절을 사용할 때 유의해야할 점 ]
-- 1. group by절을 사용하는 순간 행의 갯수가 감소됨
--> group by절보다 늦게 실행되는 절인 select절에는 출력할 수 있는 행이 제한이 걸리게 됨
-- 2. 다만 집계함수로 처리하는 컬럼에 한에서는 사용이 가능하다.

select * from 수강생정보;

-- 수강생정보 테이블에서 소속반 별로 그룹화 하여 반별 인원수를 집계하겠다. >> group by를 사용할 컬럼을 확실하게 구분지을 수 있어야 함

select 소속반, count(*) as "반별 인원수" from 수강생정보 group by 소속반;

-- 성적표 테이블에서 과목별로 최고 성적과 최저 성적을 출력
select 과목, max(성적) as "최고 성적", min(성적) as "최저 성적" from 성적표 group by 과목;

-- 직원테이블에서 부서별 직원의 급여 총 합계를 구하시오.
select department_id, sum(salary) as "sum" from employees group by department_id order by department_id;

-- 직원데이블에서 직업별 직원의 평균 급여를 구하시오.
select job_id, round(avg(salary), 1) as "avg" from employees where department_id is not null group by job_id order by round(avg(salary), 1);

-- 성적표 테이블에서 학생별 과목의 성적합을 구하시오.
-- 단, 'PYTHON' 과목을 제외 시키고 'SMHRD6'인 학생도 제외시켜라.
select 학생ID, sum(성적) from 성적표 where 과목 != 'PYTHON' and 학생ID != 'SMHRD6' group by 학생ID order by 학생ID;

-- 부서별 평균 급여를 구하시오.
-- 단 부서가 50, 80, 100에 해당하는 부서만 조회하시오.
-- 평균 급여는 "평균 급여"라는 별칭으로 출력하고, 소수점 1의자리까지 표시하시오.
select department_id, round(avg(salary), 1) as "평균 급여" from employees where department_id = 50 or department_id = 80 or department_id = 100 group by department_id order by department_id;

-- having절
-- group by 이후에 실행되는 조건절
-- 집계가 완료된 대상을 조건을 통해 필터링하는 문법이며 집계함수에 대한 조건을 걸 때 사용

-- [ sql 작성순서 및 실행순서 ]

-- 5. select : 조회하고자 하는 "컬럼의 정보"
-- 1. from : 데이터를 가져올 "테이블의 정보"
-- 2. where : 원하는 행(데이터)를 선별하기 위한 "조건식"
-- 3. group by : 특정 컬럼을 기준으로 "그룹화"
-- 4. having : 그룹화 된 상태에서 집계함수에 대한 "조건식"
-- 6. order by : 특정 컬럼을 기준으로 "정렬화"

-- where절과 having절의 차이점
-- 조건이 참인 결과만 출력된다는 점에서는 비슷하나,
-- where절은 group by 이전에 실행되는 조건절이라서
-- group by 이후에 사용할 수 있는 집계함수에 대한 조건을 걸 수 없음
-- 집계함수에 대한 조건을 선별하려면 group by 이후에 실행되는 having 조건절을 사용해야함

-- 수강생정보 테이블에서 반별 인원수가 3명 이상인 반만 집계출력하시오
select 소속반, count(학생ID) as "인원수" from 수강생정보 group by 소속반 having count(학생ID) >= 3;

-- 문제1) 직원테이블에서 부서별 최고 연봉이 100000이상인 부서만 조회하시오.
select department_id, max(salary * 12) from employees group by department_id having max(salary * 12) >= 100000;

-- 문제2) 직원테이블에서 직업별 평균 급여가 10000이상인 직업만 조회하시오.
-- 단 사장의 직업은 제외하시오.
select job_id, round(avg(salary)) from employees where job_id != 'AD_PRES' group by job_id having round(avg(salary)) >= 10000;
select job_id from employees;

-- 문제3) 부서별 급여의 총 합계를 구하시오.
-- 단 급여 총 합계가 10000 이하인 부서만 출력하시오.
-- 부서가 null인 부서는 제외하시오.
select department_id, sum(salary) from employees where department_id is not null group by department_id having sum(salary) <= 10000;
