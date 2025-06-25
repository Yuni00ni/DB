-- CHAPTER 04. GROUP BY절

-- 내장함수 : 오라클에서 미리 만들어 놓은 함수 > 호출해서 사용 하기만 하면 된다.
-- 문자형, 숫자형, 날짜형, 변환형, NULL처리함수, DECODE(조건함수)

--[ 내장함수의 종류 ]
-- 단일행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
-- 다중행 함수 : 여러 행을 입력받아 하나의 결과 값으로 출력이 되는 함수 
--> 다중행 함수를 집계함수 라고 부른다.

-- [ 다중행 함수 종류 ] - 집계함수
-- COUNT() : 지정한 데이터의 개수를 반환 
-- SUM()   : 지정한 데이터의 합을 반환
-- MAX()   : 지정한 데이터 중 최대값 반환
-- MIN()   : 지정한 데이터 중 최소값 반환
-- AVG()   : 지정한 데이터의 평균값 반환

-- 집계함수의 특징
-- 1. 집계함수는 NULL값을 제외하는 특성을 가지고 있다.
-- 2. 집계함수는 GROUP BY절이 있어야만 사용이 가능하다.

-- 직원테이블에서 직원ID 의 행의 갯수를 가져오기
SELECT COUNT(EMPLOYEE_ID) --> 1개
    ,  FIRST_NAME --> 107
  FROM EMPLOYEES 
GROUP BY() ;

-- 출력하려는 행의 갯수가 맞지 않기 때문에 에러를 발생한다.

SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES ;

-- COUNT()함수는 *(전체조회) 를 사용할 수 있다.
-- 다만 다른 집계함수는 사용할 수 없다.

SELECT COUNT(*)
  FROM EMPLOYEES ;

-- 직원테이블에서 직원의 급여의 총 합계를 구하시오.

SELECT SUM(SALARY)
  FROM EMPLOYEES ;

-- 직원테이블에서 직원들의 최대 급여와 최소 급여를 구하시오.
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES
GROUP BY() ; 


-- 직원테이블에서 부서ID가 100에 해당하는 직원의 평균 급여를 구하시오
-- 단 결과 값은 소수점 1의자리까지 반올림하여 출력.

SELECT ROUND(AVG(SALARY), 1)
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 100 ; 

DROP TABLE MEMBER;

SELECT * FROM 수강생정보;

SELECT * FROM 성적표;

-- GROUP BY 절이란
-- 특정 컬럼을 기준으로 그룹화(묶음)

-- SQL 작성 순서
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY 

-- ***SQL 실행되는 순서***
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY 

-- [ GROUP BY절 사용하는 방법 ]
-- SELECT   조회하고자 하는 "컬럼의 정보"
-- FROM     데이터를 가져올 "테이블의 정보"
-- WHERE    원하는 행(데이터)를 선별하기 위한 "조건식"
-- GROUP BY 특정 컬럼을 기준으로 "그룹화" 

-- 수강생정보 테이블에서 소속반 별(GROUP BY)로 반별 인원수를 집계를 통해 구해보자.
SELECT * FROM 수강생정보 ;

SELECT 소속반, COUNT(학생ID)
  FROM 수강생정보
GROUP BY 소속반 ;


-- GROUP BY란 통계적인 자료를 가지고 분석을 하기 위해 사용하는 것
-- 특정 컬럼을 적용시켜서 그룹화를 하고 통계적 자료를 분석하기 위해 사용하는 것이다.

-- [ GROUP BY절을 사용할때 유의 해야할 점 ]
-- 1.GROUP BY절을 사용하는 순간 행의 갯수가 감소가 된다.
-- 그래서 GROUP BY절보다 늦게 실행되는 절인 SELECT 절에는 출력할 수 있는 행이 제한이 걸리게 된다.

-- 2. 다만 집계함수로 처리하는 컬럼에 한에서는 사용이 가능하다.

SELECT * FROM 수강생정보;

-- 수강생정보 테이블에서 소속반 별(GROUP BY)로 그룹화 하여 반별 인원수를 집계를 하겠다.
SELECT 소속반 , COUNT(학생ID)
  FROM 수강생정보
GROUP BY 소속반 ;


-- 성적표 테이블에서 과목별(GROUP BY) 로 최고 성적과 최저 성적을 출력

SELECT * FROM 성적표 ;

SELECT 과목, MAX(성적), MIN(성적)
  FROM 성적표
GROUP BY 과목 ; 


-- 직원테이블에서 부서별(GROUP BY) 직원의 급여 총 합계를 구하시오.
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID, SUM(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC;


-- 직원테이블에서 직업별(GROUP BY) 직원의 평균 급여를 구하시오.
-- 단 AD_PRES 를 제외시키시오.

SELECT JOB_ID ,AVG(SALARY)
  FROM EMPLOYEES
 WHERE JOB_ID != 'AD_PRES'
GROUP BY JOB_ID;

-- 성적표 테이블에서 학생별(GROUP BY) 과목의 성적의 합을 구하시오.
-- 다만 'PYTHON' 과목을 제외 시키고 SMHRD6인 학생도 제외시켜라.

SELECT * FROM 성적표;

SELECT 학생ID , SUM(성적)
  FROM 성적표
 WHERE 과목 != 'PYTHON' 
   AND 학생ID != 'SMHRD6'
GROUP BY 학생ID ;













