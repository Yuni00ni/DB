-- CHAPTER 03. 오라클 함수

-- 함수란
-- 입력값(input)을 넣어서 특정한 기능을 수행하는 프로그램(함수)이 output(결과값을)을 출력하는 것

-- 사용자 정의 함수 : 사용자가 직접 만든 함수
-- 내장 함수 : 오라클에서 이미 만들어 놓은 함수
--> 필요할 때 마다 호출하여 사용하는 함수이다.

-- 종류 : 문자형 함수, 숫자형 함수, 날짜형 함수, 변환형 함수, null처리 함수, 조건 함수

-- 함수이름() --> 함수를 실행할 때 사용하는 입력 값을 매개변수 | 인자값이라고 함

-- [ 문자형 함수 ]
-- upper() : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- lower() : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

select first_name, email, upper(first_name) as "upper 함수 사용", lower(email) as "lower 함수 사용" from employees;

-- length() : 괄호 안 문자 데이터의 길이를 구하는 함수
select first_name, length(first_name) as "이름의 길이" from employees;

-- dual테이블이란? : 임시값 혹은 함수 결과값을 확인하는 용도로 사용하는 테스트용 테이블(더미)
select 'Hello World', 12345, length('Hello World') from dual;

-- 직원의 first_name의 길이가 6 이상인 직원의 이름과 급여 정보를 조회하시오.
select first_name, salary, length(first_name) as "이름 길이" from employees where first_name like '______%' order by length(first_name);

-- substr() : 문자열을 추출하는 함수
-- substr(입력값, 시작위치, 추출길이)
-- 추출길이생략 가능 > 단 추출길이를 생략하게 되면 시작위치부터 끝까지 출력.
select '광주인공지능사관학교 개강', substr('광주인공지능사관학교 개강', 3, 4) as "인공지능", substr('광주인공지능사관학교 개강', 1, 2) as "광주",
        substr('광주인공지능사관학교 개강', 10, 3) as "교 개", substr('광주인공지능사관학교 개강', 8, 5) as "관학교 개",
        substr('광주인공지능사관학교 개강', 8) as "추출길이 생략" from dual;

-- replace() : 괄호 안 문자 데이터를 다른 문자로 바꾸어주는 함수
-- replace(문자열 데이터, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 바꿔야 할 문자가 생략 가능 > 단 생략 시 바꾸고 싶은 문자가 삭제됨
select '인공지능#사관학교', replace('인공지능#사관학교', '#', '-') as "# to -", replace('인공지능#사관학교', '#') as "# 생략 = 삭제" from dual;

-- trim() : 양쪽의 공백을 제거해주는 함수

select '     인공지능사관학교     ', length('     인공지능사관학교     ') as "길이",
        trim('     인공지능사관학교     ') as "공백 제거", length(trim('     인공지능사관학교     ')) as "공백 제거 길이" from dual;
        

-- [ 숫자형 함수 ]
-- round() : 특정 위치에서 반올림 하는 함수

-- round(반올림 할 숫자, 반올림 위치)
-- 반올림 위치 생략 가능 > 단 생략 시 첫째 자리에서 강제로 반올림

select 12345.56789, round(12345.56789, 2), round(12345.56789, 1), round(12345.56789) from dual;

-- mod() : 숫자를 나눈 나머지 값을 구하는 함수
-- 홀수, 짝수를 구분하기 위해서 나머지 값을 구한다.

-- mod(나눗셈 될 숫자, 나눌 숫자) => 결과적으로 %와 같음

select mod(10, 3) as "10 % 3", mod(12, 5) as "12 % 5", mod(15, 6) as "15 % 6" from dual;

-- [ 날짜형 함수 ]
-- sysdate : 현재 날짜와 시간을 출력해주는 함수
--> 입력 시 바로 출력되며, 현재 시간을 초 단위까지 출력 가능
-- 날짜형 데이터는 연산 가능
-- 날짜형 데이터끼리는 연산 불가능

-- 날짜 형식 세팅하기
-- 도구 > 환경설정 > 데이터베이스 > nls > 날짜형식 > yyyy-mm-dd hh24:mi:ss

-- sysdate + sysdate --> 날짜 데이터끼리는 연산이 불가능하다
select sysdate, sysdate +1 as "내일", sysdate -1 as "어제" from dual;

-- 날짜 데이터 활용(실무)
select sysdate as "현재 날짜", sysdate + 1 as "하루를 더함", sysdate +1/24 as "한 시간 더함", sysdate +1/24/60 as "일 분을 더함", sysdate +1/24/60/60 as "일 초를 더함" from dual;

-- add_months() : 몇 개월 이후 날짜를 구하는 함수
-- add_months(날짜 데이터, 더하거나 뺄 개월 수)

-- 현재 날짜에서 3달 후 데이터를 출력
select add_months(sysdate, +3) as "3달 후" from dual;

-- [ 변환형 함수 ]

-- [ 형변환 형태의 종류 ]
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
select '100' + 700 from dual;

-- 명시적 형변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정해주는 것
select to_number('1,000', 9999) + 700 from dual;

-- to_number() : 문자데이터를 숫자 데이터로 변환하는 함수
-- to_number(문자열 데이터, 인식 될 숫자 형태)

-- 자료형 변환 시 표현 형식
-- 9 : 숫자의 자릿수를 의미
-- 0 : 빈자리를 0으로 채움
-- $ : 달러($) 표시를 붙혀서 출력함
-- L : 지역 화폐 단위 기호를 붙혀서 출력함
-- . : 소수점을 표시
-- , : 1,000 << 처럼 단위를 표시하여 출력함

-- to_char() : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
-- to_char(변환할 데이터, 출력 형태)

-- 직원테이블에서 직원의 이름과 급여정보를 출력하시오.
select first_name, salary, to_char(salary, 'L999,999') from employees;

-- to_date() : 문자 데이터를 날짜 데이터로 변환하는 함수
-- to_date(문자열 데이터, 인식 될 날짜 형태)

-- 날짜 표현 형식
-- YYYY/RRRR : 년도를 4자리로 표현
-- YY/RR : 년도를 2자리로 표현
-- MM : 개월을 2자리로 표현
-- MON : 개월 표현
-- MONTH : 개월 이름을 전체로 표현
-- DD : 요일을 2자리로 표현
-- DAY : 요일을 전체로 표현

select to_date('20250625수요일','YYYY/MM/DD/DAY') from dual;

-- null 처리 함수
-- nvl() / nvl2() : null값을 대체할 수 있는 함수
-- nvl(null 여부 검사 데이터, null일 경우 반환 데이터)
-- nvl2(null 여부 검사 데이터, !null일 경우 반환 데이터, null일 경우 반환 데이터)

select first_name, salary, nvl(commission_pct, 0), nvl2(commission_pct, 1, 0) from employees;

-- 문제) 직원테이블에서 직원id, 이름, 급여, 매니저id를 출력
-- 매니저가 있는 직원은 '직원'으로 출력
-- 매니저가 없는 직원은 '대표'로 출력

select employee_id, first_name, salary, manager_id, nvl2(manager_id, '직원', '대표') as "직책" from employees;

-- 조건 함수
-- decode() : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사대상과 비교해서 지정한 값을 반환

-- decode(검사 대상(컬럼 | 데이터), 비교값, 일치 시 반환값, 불일치 시 반환값)

-- 문제) 직원테이블에서 직원id, 이름, 급여, 매니저id를 출력
-- 매니저가 있는 직원은 '직원'으로 출력
-- 매니저가 없는 직원은 '대표'로 출력

-- employee_id가 100인 사람은 대표, 101인 직원은 전무, 102인 직원은 상무, 103인 직원은 팀장 나머지는 직원으로 출력하시오.

select employee_id, first_name, salary, manager_id, decode(manager_id, null, '대표', '직원') as "직책",
       decode(employee_id, 100, '대표', 101, '전무', 102, '상무', 103, '팀장', '직원') as "직책2" from employees;
       
