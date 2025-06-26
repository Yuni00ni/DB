-- CHAPTER 05. JOIN 

-- RDBMS ( 관계형 데이터 베이스)
-- Relational DataBase Mangerment System 

-- PK (PRIMARY KEY) : 기본키 , 관계형 데이터베이스에서 각 행(ROW) 고유하게 식별하기 위한
-- 컬럼 값이다. > 반드시 테이블에서 PK가 존재해야 한다. 
-- PK 의 특징은 NOT NULL + UNIQUE 이다.

SELECT * FROM EMPLOYEES;

-- FK (FOREIGH KEY) : 외래키 , 테이블과 테이블을 이어주는 역할을 하는 키이다.
-- 참조테이블(부모테이블)의 PK를 참조하는 컬럼 을 말한다.

-- JOIN 이란
-- 여러 테이블에서 필요한 데이터를 한번에 가져오는 기술


-- [ 등가조인 사용 방법 ]

-- SELECT   테이블1.컬럼명, 테이블2.컬럼명 -- .(경로)를 작성함으로써 해당 테이블에 컬럼을 조회
-- FROM     테이블1, 테이블2 --> 해당 테이블을 조인하겠다.
-- WHERE    테이블1.컬럼명 = 테이블2.컬럼명 --> 해당 조건으로 조인하겠다 (조인조건)


SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES ;
  

SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
SELECT * FROM COUNTRIES;

-- 직원ID, 이름(FIRST_NAME), 부서ID, 부서명 
-- 조인할 테이블의 정보 : EMPLOYEES, DEPARTMENTS

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
ORDER BY E.EMPLOYEE_ID ASC ;

-- FROM절에 별칭 사용 ( 테이블에 별칭 적용하기 )
-- AS키워드를 사용할수 없다.
-- FROM절에 별칭 사용시 이후에 사용되는 절에도 반드시 별칭을 적용해야한다.


-- [ 조인 프로세스 ]
-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. FROM : 조인할 테이블을 ,(컴마) 기준으로 작성
-- 3. WHERE : 조인 조건이 되는 "특정 컬럼"을 확인하여 조인 조건절을 작성
--> 조인조건이 되는 특정 컬럼 : 조인할 테이블 간 같은 값을 가지는 컬럼 
--> PK 와 FK 관계로 대부분 조인이 이루어진다. 단 전부 그런것은 아니다!
--> 의미있는 값을 가지면 조인할 수 있다.
-- 4. SELECT : .(경로)를 작성하여 조회하고자 하는 컬럼 값을 작성

SELECT * FROM 수강생정보;
SELECT * FROM 성적표;

-- 학생ID, 학생이름, 과목, 성적 
-- 조인할 테이블의 정보 : 수강생정보, 성적표

SELECT 수강생정보.학생ID, 수강생정보.학생이름
     , 성적표.과목, 성적표.성적
  FROM 수강생정보 , 성적표 
 WHERE 수강생정보.학생ID = 성적표.학생ID ;
 
-- 해설
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES; 

-- 직원ID, 이름, 직책ID, 직책TITLE 의 컬럼의 정보 순으로 출력
-- 조인할 테이블의 정보 : EMPLOYEES, JOBS
-- 직원ID 기준으로 오름차순(ASC) 정렬하여 출력 .
-- 조건 : AD_PRES와 IT_PROG 와 AD_VP 를 제외하시오.
 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_ID
     , J.JOB_TITLE
  FROM EMPLOYEES E , JOBS J 
 WHERE E.JOB_ID = J.JOB_ID 
   AND E.JOB_ID NOT IN ('AD_PRES','IT_PROG','AD_VP')
ORDER BY E.EMPLOYEE_ID ASC ;

-- INNER JOIN 으로 풀어보자
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID) 
 WHERE E.JOB_ID NOT IN ('AD_PRES','IT_PROG','AD_VP')
ORDER BY E.EMPLOYEE_ID ASC;

-- CROSS JOIN : 조인조건절이 없는 조인 방식
--> 조인 조건이 없기 때문에 모든 경우의 수가 나온다
--> 카티션 곱 : 모든 경우의 수가 출력이 되는 것

SELECT 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적
  FROM 수강생정보, 성적표 ;

SELECT * FROM 수강생정보; -- 9
SELECT * FROM 성적표 ;   -- 18
-- CROSS JOIN 은 각 테이블의 행의 갯수를 곱한 결과가 나온다.

-- CROSS JOIN 사용방법
SELECT 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적
  FROM 수강생정보 CROSS JOIN 성적표 ;


-- 단독으로 존재하는 테이블이면 경로(.)를 안적어줘도 DB가 찾아준다
-- 하지만 코드의 가독성을 위해서 테이블의 경로를 적어주는 것이 좋다.

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID FROM DEPARTMENTS;

-- 부서ID, 부서명, 위치ID, STREET_ADDRESS, CITY
-- 조인할 테이블의 정보 : DEPARTMENTS, LOCATIONS 
-- 조건 : 부서가 30,40,100인 부서만 조회하시오.

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
     , L.STREET_ADDRESS, L.CITY
  FROM DEPARTMENTS D , LOCATIONS L 
 WHERE D.LOCATION_ID = L.LOCATION_ID
   AND D.DEPARTMENT_ID IN (30,40,100) 
ORDER BY D.DEPARTMENT_ID ASC;

-- [ INNER JOIN 사용 방법 ]

-- SELECT   조회하고자 하는 컬럼의 정보는 .(경로)를 통해 작성
-- FROM     테이블1 INNER JOIN 테이블2
--   ON     (테이블1.컬럼 = 테이블2.컬럼) -- 조인조건 작성
-- WHERE    일반 행을 선별하기 위한 조건식 -- 일반조건 작성

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
     , L.STREET_ADDRESS, L.CITY
  FROM DEPARTMENTS D INNER JOIN LOCATIONS L 
    ON ( D.LOCATION_ID = L.LOCATION_ID )
 WHERE D.DEPARTMENT_ID IN (30,40,100) 
ORDER BY D.DEPARTMENT_ID ASC;






















