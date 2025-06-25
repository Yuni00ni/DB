-- CHAPTER 03. 오라클 함수

-- 함수란
-- 입력값(INPUT) 을 넣어서 특정한 기능을 수행하는 프로그램(함수)가 OUTPUT(결과값)을 출력하는 것

-- 사용자 정의함수 : 사용자가 직접 만든 함수
-- 내장 함수 : 오라클에서 이미 만들어 놓은 함수
--> 필요할때마다 호출 하여 사용하는 함수이다.
-- 종류로는 문자형 함수, 숫자형 함수, 날짜형 함수, 변환형 함수, NULL처리 함수, 조건 함수

-- 함수이름() --> 함수를 실행할때 사용하는 입력 값을 매개변수, 인자값

-- [ 문자형 함수 ]
-- UPPER() : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- LOWER() : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

SELECT FIRST_NAME
     , EMAIL
     , UPPER(FIRST_NAME) AS UPPER함수사용
     , LOWER(EMAIL) AS "LOWER  함수사용"
     , UPPER(FIRST_NAME)
  FROM EMPLOYEES;

-- LENGTH() : 괄호 안 문자 데이터의 길이를 구하는 함수 

SELECT 'HELLO WORLD' , 1234567
     , LENGTH('HELLO WORLD')
  FROM DUAL ; 
  
-- DUAL 테이블이란 임시값 혹은 함수 결과값을 확인하는 용도로 사용하는 테스트용 테이블입니다.

SELECT FIRST_NAME
     , LENGTH(FIRST_NAME)
  FROM EMPLOYEES;

-- 직원의 FIRST_NAME의 길이가 6 이상인 직원들의 이름과 급여 정보를 조회하시오.

SELECT FIRST_NAME, SALARY, LENGTH(FIRST_NAME)
  FROM EMPLOYEES 
 WHERE LENGTH(FIRST_NAME) >= 6 
ORDER BY LENGTH(FIRST_NAME) ASC;

-- SUBSTR() : 문자열을 추출하는 함수
-- SUBSTR(입력값, 시작위치, 추출길이)
-- 추출길이생갹 가능 > 단 추출길이를 생략을 하게 되면 시작위치부터 끝까지 출력합니다.

SELECT '광주인공지능사관학교 개강'
      , SUBSTR('광주인공지능사관학교 개강', 3 , 4) AS 인공지능
      , SUBSTR('광주인공지능사관학교 개강', 1, 2) AS 광주
      , SUBSTR('광주인공지능사관학교 개강', 10, 3) AS "교 개"
      , SUBSTR('광주인공지능사관학교 개강', 8, 5) AS "관학교 개"
      , SUBSTR('광주인공지능사관학교 개강', 8) 
  FROM DUAL ;

-- REPLACE() : 괄호 안 문자 데이터를 다른 문자로 바꾸어주는 함수
-- REPLACE(문자열 데이터, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 바꿔야 할 문자 가 생략 이가능 > 단 생략시 바꾸고 싶은 문자가 삭제가 된다.

SELECT '인공지능#사관학교'
     , REPLACE('인공지능#사관학교', '#', '-')
     , REPLACE('인공지능#사관학교', '#') 
  FROM DUAL ;
  
-- TRIM() : 양쪽의 공백을 제거해주는 함수

SELECT TRIM('                   인공지능사관학교               ')
  FROM DUAL ;


-- [ 숫자형 함수 ]
-- ROUND() : 특정 위치에서 반올림 하는 함수

-- ROUND(반올림 할 숫자, 반올림 위치)
-- 반올림 위치를 생략 가능 > 단 생략시 첫째 자리에서 강제로 반올림

SELECT 12345.56789
     , ROUND(12345.56789, 2)
     , ROUND(12345.56789, 1)
     , ROUND(12345.56789)
  FROM DUAL ;


-- MOD() : 숫자를 나눈 나머지 값을 구하는 함수
-- 홀수,짝수를 구분하기 위해서 나머지 값을 구한다.

-- MOD(나눗셈 될 숫자, 나눌 숫자)

SELECT MOD(10,3)
     , MOD(12,5)
     , MOD(15,6) 
  FROM DUAL ;
  
-- [ 날짜형 함수 ]
-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
--> 입력 시 바로 출력이 되며, 현재 시간을 초 단위까지 출력이 가능하다.
-- 날짜형 데이터는 연산이 가능하다.
-- 날짜형 데이터끼리는 연산이 불가능하다.

SELECT SYSDATE
  FROM DUAL ;

-- 날짜 형식 셋팅 하기
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE
     , SYSDATE +1 AS 다음날
     , SYSDATE -1 AS 어제
--     , SYSDATE + SYSDATE --> 날짜 데이터끼리는 연산이 불가능하다.
  FROM DUAL ;

-- 날짜데이터 활용(실무)
SELECT SYSDATE AS "현재 날짜"
     , SYSDATE +1 AS "하루를 더함"
     , SYSDATE +1/24 AS "한시간 더함"
     , SYSDATE +1/24/60 AS "일분을 더함"
     , SYSDATE +1/24/60/60 AS "일초를 더함"
  FROM DUAL ;


-- ADD_MONTHS() : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월 수)

-- 현재 날짜에서 3달 후 데이터를 출력
SELECT ADD_MONTHS(SYSDATE, 3)
  FROM DUAL;


-- [ 변환 형 함수 ]

-- [ 형변환 형태의 종류 ] 
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것

SELECT TO_NUMBER('1,000',9999) + 700
  FROM DUAL ;

-- 명시적 형변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는 것

-- TO_NUMBER() : 문자데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열 데이터, 인식 될 숫자 형태)

-- 자료형 변환시 표현 형식
-- 9 : 숫자의 한자리를 의미
-- 0 : 빈자리를 0으로 채움을 의미
-- $ : 달러($) 표시를 붙여서 출력함
-- L : 지역 화패 단위 기호를 붙혀서 출력함
-- . : 소수점을 표시
-- , ; 천 단위의 구분 기호를 표시함

-- TO_CHAR() : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수 
-- TO_CHAR(변환 할 데이터, 출력 형태)

-- 직원테이블에서 직원의 이름과 급여 정보를 가져온것 (출려한것)
SELECT FIRST_NAME, SALARY
     , TO_CHAR(SALARY, 'L999,999')
  FROM EMPLOYEES ;


-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열 데이터, 인식 될 날짜 형태)

-- 날짜 표현 형식
-- YYYY/RRRR : 연도를 4자리로 표현하겠다.
-- YY/RR : 연도를 2자리로 표현하겠다.
-- MM : 월을 2자리로 표현하겠다.
-- MON : 월 을 표한겠다.
-- MONTH : 월 이름을 전체로 표현하겠다.
-- DD : 일을 2자리로 표현하겠다.
-- DAY : 요일을 전체로 표현하겠다.

SELECT TO_DATE('20250625' ,'YY/MM/DD')
  FROM DUAL ;

-- NULL 처리 함수 
-- NVL() / NVL2() : NULL값을 대체 할수 있는 함수
-- NVL(NULL인지 여부를 검사할 데이터, NULL일 경우 반환할 데이터)
-- NVL2(NULL인지 여부를 검사할 데이터, NULL이 아닐 경우 반환할 데이터, NULL일경우 반환할 데이터)

SELECT FIRST_NAME, SALARY, COMMISSION_PCT
     , NVL(COMMISSION_PCT, 0)
     , NVL2(COMMISSION_PCT, 1, 0)
  FROM EMPLOYEES ; 

SELECT * FROM EMPLOYEES;
-- 문제) 직원테이블에서 직원ID, 이름, 급여, 매니저ID를 출력
-- 매니저가 있는 직원은 '직원' 으로 출력
-- 매니저가 없는 직원은 '대표'로 출력

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, MANAGER_ID
     , NVL2(MANAGER_ID, '직원', '대표')
  FROM EMPLOYEES ;

-- 조건 함수 
-- DECODE() : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사대상과 비교해서 지정한 값을 반환

-- DECODE(검사대상이 될 컬럼 또는 데이터, 비교값, 일치 시 반활할 값, 일치하지 않을때 반환값<마지막>)

-- 문제) 직원테이블에서 직원ID, 이름, 급여, 매니저ID를 출력
-- 매니저가 있는 직원은 '직원' 으로 출력
-- 매니저가 없는 직원은 '대표'로 출력

-- EMPLOYEE_ID가 100인 사람은 대표, 101인 직원은 전무, 102인 직원은 상무, 103인 직원은 팀장

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, MANAGER_ID
     , DECODE(MANAGER_ID, NULL, '대표', '직원')
     , DECODE(EMPLOYEE_ID, 100 , '대표', 101, '전무', 102, '상무', 103, '팀장',   '직원')
  FROM EMPLOYEES ;






















