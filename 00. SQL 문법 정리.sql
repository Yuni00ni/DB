-- 00. SQL 문법 정리

-- DDL (Data Definition Language) : 데이터 정의어
-- Definition : 정의

-- DDL이란 데이터 정의어로 테이블같은 저장소 객체를 만들거나 수정한다.

-- [ DDL의 명령어 종류 ]

-- create : 테이블같은 객체를 생성하는 명령어
-- alter : 테이블같은 객체를 변경하는 명령어
-- drop : 테이블같은 객체를 삭제하는 명령어
-- truncate : 테이블의 데이터를 영구삭제하는 명령어
-- rename : 테이블같은 객체의 이름을 변경하는 명령어

-- 테이블 삭제하는 방법
-- drop table [테이블명];

-- 수강생정보 테이블과 성적표 테이블을 삭제하자

-- 테이블의 정보를 확인하는 방법
-- 1. desc [테이블의 정보];
desc 수강생정보;
-- 2. 해당 테이블을 마우스로 드래그 후 shift + f4

-- 해당 테이블의 제약조건을 강제로 삭제하는 방법
-- cascade constraint 라는 옵션을 주면 된다.


drop table 수강생정보 cascade constraint;

drop table 성적표;

-- 수강생정보 테이블을 만드는 SQL 문장
CREATE TABLE 수강생정보 (
학생ID   VARCHAR2(9) PRIMARY KEY , 
학생이름  VARCHAR2(50) NOT NULL , 
소속반    VARCHAR2(5) 
); 

select * from 수강생정보;

-- 성적표 테이블을 만드는 SQL 문장
CREATE TABLE 성적표 ( 
    학생ID VARCHAR2(9) , 
    과목   VARCHAR2(30) , 
    성적   NUMBER  , 
    CONSTRAINT 성적표_학생ID_PK PRIMARY KEY(학생ID , 과목) , 
    CONSTRAINT TB성적표_학생ID_FK FOREIGN KEY(학생ID) REFERENCES 수강생정보(학생ID) 
)  ;

select * from 성적표;

-- 제약조건(constraint)이란?
-- 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
--> 데이터의 정확성을 유지하기 위한 목적으로 사용
--> 제약 조건 지정 방식에 따라서 수정이나 삭제 여부에 영향을 받음

-- 제약조건의 종류
-- primary key(pk) : 기본키, not null + unique --> null값 불가 + 중복 불가
-- unique key(uk) : 고유키, null값 입력 가능, 단 중복은 불가
-- not null : null값 불가능, 반드시 입력되어야 하는 데이터이다 할 때 설정하는 것
-- check : true of false로 평가할 수 있는 논리식 지정, 지정한 데이터만 입력 가능
-- foreign key(fk) : 외래키, 테이블을 연결하는 키

-- DML(Data Manipulation Language) : 데이터 조작어
-- manipulate : 조작

-- DML이란 데이터 조작어로 데이터를 추가, 수정, 삭제, 조회 할 때 사용하는 질의어
--> 테이블에서 원하는 데이터를 입력, 수정, 삭제하는 언어

-- [ DML의 유형 ] -- 세인업데
-- select : 데이터 조회
-- insert : 데이터 추가
-- update : 데이터 수정
-- delete : 데이터 삭제

select * from 수강생정보;

-- 수강생정보 테이블에 데이터를 추가하는 쿼리문 -- insert(추가)
-- insert(데이터 추가)할 때 유의해야할 점
-- insert into 에 작성한 컬럼과 values에 입력한 실제 값은 1:1 매핑이 되어진다.
-- 그렇기 때문에 순서와 자료형을 맞게 작성을 해야한다.
INSERT INTO 수강생정보(학생ID, 학생이름, 소속반) VALUES ('SMHRD1' , '조준용' , 'A') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD2' , '박수현' , 'A') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD3' , '박병관' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD4' , '이명훈' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD5' , '나예호' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD6' , '선영표' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD7' , '최영화' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD8' , '송찬호' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('SMHRD9' , '임승환' , 'C') ; 

-- 성적표 테이블에 데이터를 추가하는 쿼리문
INSERT INTO 성적표(학생ID, 과목, 성적) VALUES('SMHRD1'  ,'JAVA' , 90); 
INSERT INTO 성적표 VALUES('SMHRD1'  ,'DATABASE' , 85); 
INSERT INTO 성적표 VALUES('SMHRD1'  ,'PYTHON' , 100); 
INSERT INTO 성적표 VALUES('SMHRD2'  ,'JAVA' , 100); 
INSERT INTO 성적표 VALUES('SMHRD2'  ,'DATABASE' , 100); 
INSERT INTO 성적표 VALUES('SMHRD2'  ,'PYTHON' , 20); 
INSERT INTO 성적표 VALUES('SMHRD3'  ,'JAVA' , 100); 
INSERT INTO 성적표 VALUES('SMHRD3'  ,'DATABASE' , 100); 
INSERT INTO 성적표 VALUES('SMHRD3'  ,'PYTHON' , 20); 
INSERT INTO 성적표 VALUES('SMHRD4'  ,'JAVA' , 85); 
INSERT INTO 성적표 VALUES('SMHRD4'  ,'DATABASE' , 40); 
INSERT INTO 성적표 VALUES('SMHRD4'  ,'PYTHON' , 60); 
INSERT INTO 성적표 VALUES('SMHRD5'  ,'JAVA' , 100); 
INSERT INTO 성적표 VALUES('SMHRD5'  ,'DATABASE' , 100); 
INSERT INTO 성적표 VALUES('SMHRD5'  ,'PYTHON' , 100); 

select * from 성적표;
select * from 수강생정보;

-- 데이터에 null값을 입력하는 방법 3가지
-- 1. 데이터에 null을 추가하는 방법(1)
INSERT INTO 성적표(학생ID, 과목, 성적) VALUES ( 'SMHRD6' , 'JAVA' , NULL ) ; 

-- 2. 데이터에 null을 추가하는 방법(2)
INSERT INTO 성적표 VALUES ( 'SMHRD6' , 'DATABASE' , '' ) ; 

-- 3. 데이터에 null을 추가하는 방법(3)
INSERT INTO 성적표(학생id, 과목) VALUES ( 'SMHRD6' , 'PYTHON') ; 

-- update : 테이블의 데이터를 변경하고 싶을 때 사용
-- 사용방법
-- update [테이블명]
-- set [변경할 데이터 내용]
-- where [데이터를 변경할 대상 행을 선별하기 위한 조건식]

select * from 성적표;

-- SMHRD6인 학생의 JAVA과목의 성적을 50점으로 수정하시오.(update)
update 성적표 set 성적 = 50 where 학생ID = 'SMHRD6' and 과목 = 'JAVA';

commit; -- 영구 저장하는 명령문

select * from 수강생정보;

-- 수강생정보테이블에서 조준용이라는 학생이름을 CJY , 소속반은 B로 변경(update)
update 수강생정보 set 학생이름 = 'CJY', 소속반 = 'B' where 학생ID = 'SMHRD1';

-- DML로 데이터 조작시 조건절에는 pk에 해당하는 컬럼을 조건절에 작성하는것이 적합하다.

rollback; -- 트랜잭션을 되돌리는 명령어

-- delete : 데이터를 삭제할 때 사용하는 명령어
-- 사용방법
-- delete from [테이블명]
-- where [삭제할 대상 행을 선별하기 위한 조건식];

select * from 수강생정보;

delete from 수강생정보 where 학생ID = 'SMHRD1';

commit;

-- TCL(Transaction Control Language) : 트랜잭션 제어어
-- 트랜잭션이란?
--> 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행단위이다.
--> 업무를 처리하기 위한 최소 수행 단위를 뜻한다.

-- [ TCL의 명령어 ]
-- commit : 데이터베이스에 영구적으로 저장, commit시점 이후에 트랜잭션 결과를 저장
-- rollback : 트랜잭션을 취소, 마지막 commit시점까지만 복구가 가능
-- savepoint : 하나의 트랜잭션을 작게 분할하여 저장하는 기능


-- DCL(Data Control Language) : 데이터 제어어
-- 데이터 제어어로서 데이터베이스에 접근하거나 객체에 권한을 주는 등의 역할을 하는 언어

-- [ DCL의 명령어 ]
-- grant : 권한을 부여
-- revote : 권한을 회수
-- role : 권한을 묶어서 부여(다중 선택 부여)

-- 사용자(user)를 계정이라고 함

-- 계정을 만들어보자.
-- 사용자(계정)를 생성하는 방법

-- create user [계정 이름(user name)]
-- identified by [비밀번호 설정]

-- system(최고관리자 계정)에 접속된 상태에서 계정을 만든다!

-- [ 시스템 권한 부여 방법 ]
-- grant [시스템 권한]
-- to [사용자 계정]

-- [ 시스템 권한 회수 방법 ]
-- revoke [시스템 권한]
-- from [사용자 계정]

-- role : 권한을 묶어서 주는 방법

-- [ role의 종류 ]
-- connect : 접속에 필요한 권한을 묶어놓은 것
-- resource : 객체 생성을 할 수 있는 권한을 묶어놓은 것
-- dba : 데이터베이스의 보스(admin). 모든 권한을 묶어놓은 것

-- grant connect, resource to [사용자 계정];

-- 실습) connect, resource권한을 주고 테이블을 하나 생성하라
