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

