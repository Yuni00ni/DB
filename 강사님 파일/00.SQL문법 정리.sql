-- 00. SQL 문법 정리

-- DDL (Data Definition Language) : 데이터 정의어
-- Definition : 정의

-- DDL이란 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정한다.

-- [DDL의 명령어 종류]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체를 변경하는 명령어
-- DROP     : 테이블 같은 객체를 삭제하는 명령어
-- TRUNCATE : 테이블의 데이터를 영구 삭제하는 명령어
-- RENAME   : 테이블 같은 객체의 이름을 변경하는 명령어

-- 테이블 삭제하는 방법
-- DROP TABLE [테이블 명]  ;

-- 수강생정보 테이블과 성적표 테이블을 삭제하자

-- 테이블의 정보를 확인하는 방법
-- 1. DESC [테이블의 정보] ;
DESC 수강생정보 ;
-- 2. 해당 테이블을 마우스로 드래그 후 SHIFT + F4 

-- 해당 테이블에 제약조건을 강제로 삭제하는 방법
-- CASCADE CONSTRAINT 라는 옵션을 주면 된다.

DROP TABLE 수강생정보 CASCADE CONSTRAINT ;

DROP TABLE 성적표 ;

-- 수강생정보 테이블을 만드는 SQL 문장
CREATE TABLE 수강생정보 (
학생ID   VARCHAR2(9) PRIMARY KEY , 
학생이름  VARCHAR2(50) NOT NULL , 
소속반    VARCHAR2(5) 
); 

SELECT * FROM 수강생정보;


-- 성적표 테이블을 만드는 SQL 문장
CREATE TABLE 성적표 ( 
    학생ID VARCHAR2(9) , 
    과목   VARCHAR2(30) , 
    성적   NUMBER  , 
    CONSTRAINT 성적표_학생ID_PK PRIMARY KEY(학생ID , 과목) , 
    CONSTRAINT TB성적표_학생ID_FK FOREIGN KEY(학생ID) REFERENCES 수강생정보(학생ID) 
)  ;

SELECT * FROM 성적표;

-- 제약조건 (constraint) 란?
-- 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
--> 데이터의 정확성을 유지하기 위한 목적으로 사용됨.
--> 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받음

-- [ 제약조건의 종류 ] 
-- PRIMARY KEY(PK) : 기본키, NOT NULL + UNQIE --> NULL 불가 + 중복 불가
-- UNIQUE KEY(UK) : 고유키, NULL 값 입력가능, 단 중복은 불가 
-- NOT NULL : NULL 값 불가능, 반드시 입력되어야 하는 데이터이다 할때 설정하는 것
-- CHECK : T OR F 로 평가할 수 있는 논리식 지정, 지정한 데이터만 입력 가능
-- FOREIGN KEY(FK) : 외래키, 테이블을 연결하는 키

-- DML(Data Manipulation Langauge) : 데이터 조작어
-- manipulate : 조작

-- DML이란 데이터 조작어로 데이터를 추가, 수정, 삭제, 조회 할때 사용하는 질의어입니다.
--> 테이블에서 원하는 데이터를 입력, 수정, 삭제하는 언어이다.

-- [ DML의 유형 ] -- 세인업데
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- 수강생정보 테이블에 데이터를 추가하는 쿼리문 -- INSERT (추가)
-- INSERT (데이터 추가) 할때 유의해야할 점

-- INSERT INTO 에 작성한 컬럼과 VALUES에 입력한 실제 값은 1:1 매핑이 되어진다.
-- 그러기 때문에 순서와 자료형을 맞게 작성을 해야 한다.

SELECT * FROM 수강생정보;

INSERT INTO 수강생정보 (학생ID, 학생이름, 소속반) 
VALUES ('SMHRD1' , '조준용' , 'A') ; 

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
INSERT INTO 성적표 VALUES('SMHRD5'  ,'DATABASE' , ' '); 
INSERT INTO 성적표(학생ID,과목,성적) VALUES('SMHRD5'  ,' ' , 100);

-- 데이터에 NULL값을 입력하는 방법 3가지 
-- 1. 데이터에 NULL을 추가하는 방법 (1)
INSERT INTO 성적표(학생ID, 과목, 성적)  VALUES ( 'SMHRD6' , 'JAVA' , NULL ) ; 

SELECT * FROM 성적표 ;
SELECT * FROM 수강생정보;

-- 2. 데이터에 NULL값을 추가하는 방법 (2)
INSERT INTO 성적표 VALUES ( 'SMHRD6' , 'DATABASE' , '' ) ; -- ' ' (X) 

-- 3. 데이터 NULL값을 추가하는 방법 (3)
INSERT INTO 성적표(학생ID, 과목) VALUES ( 'SMHRD6' , 'PYTHON' ) ; 

-- UPDATE : 테이블의 데이터를 변경하고 싶을때 사용
-- 사용방법
-- UPDATE [테이블 명]
-- SET [변경할 데이터 내용]
-- WHERE [데이터를 변경할 대상 행을 선별하기 위한 조건식] 

SELECT * FROM 성적표;

-- SMHRD6인 학생의 JAVA 과목의 성적을 50점으로 수정하시오.(UPDATE)

UPDATE 성적표
SET 성적 = 50
WHERE 학생ID = 'SMHRD6' 
  AND 과목 = 'JAVA' ;

COMMIT ; -- 영구 저장하는 명령문
 
SELECT * FROM 수강생정보;

-- 수강생정보테이블에서 조준용이라는 학생이름을 CJY , 소속반을 B으로 변경(UPDATE)

UPDATE 수강생정보
SET 학생이름 = 'CJY' , 소속반 = 'B' 
WHERE 학생ID = 'SMHRD1' ;

-- DML 로 데이터 조작시 조건절에 는 PK에 해당하는 컬럼을 조건절에 작성하는것이 적합하다.


ROLLBACK ; -- 트랜잭션을 되돌리는 명령어

-- DELETE : 데이터를 삭제할대 사용하는 명령어
-- 사용방법
-- DELETE FROM [테이블 명]
-- WHERE [삭제할 대상 행을 선별하기 위한 조건식] ;

SELECT * FROM 수강생정보;

DELETE FROM 수강생정보
WHERE 학생ID = 'SMHRD1' ;

COMMIT;


-- TCL(Transaction Control Language) :트랜잭션 제어어

-- 트랜잭션이란?
--> 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행단위이다.
--> 업무를 처리하기 위한 최소 수행 단위를 뜻한다.

-- [ TCL의 명령어 ]
-- COMMIT   : 데이터베이스에 영구적으로 저장 , COMMIT시점 이후에 트랜잭션 결과를 저장한다.
-- ROLLBACK : 트랜잭션을 취소, 마지막 COMMIT 시점까지만 복구가 가능하다.
-- SAVEPOINT : 하나의 트랜잭션을 작게 분할하여 저장하는 기능을 수행하는 명령어


-- DCL (Data Control Language) 데이터 제어어
-- 데이터 제어어로서 데이터베이스에 접근하거나 객체에 권한을 주는 등의 역할을 하는 언어

-- DCL의 명령어 종류
-- GRANT  : 권한을 부여하는 명령어 
-- REVOKE : 권한을 회수하는 명령어  
-- ROLE   : 권한을 묶어서 부여할때 사용하는 명령어

-- 사용자(USER)를 계정이라고 한다.

-- 계정을 만들어보자.
-- 사용자(계정)을 생성하는 방법

-- CREATE USER [계정 이름(USER명)]
-- IDENTIFIED BY [비밀번호 설정]

-- SYSTEM(최고관리자 계정) 에 접속된 상태에서 계정을 만든다!

-- [ 시스템 권한 부여 방법 ]
-- GRANT [시스템 권한]
-- TO [사용자(계정)]


-- [ 시스템 권한 회수 방법 ]
-- REVOKE [시스템 권한]
-- FROM [사용자(계정)]


-- ROLE : 권한을 묶어서 주는 방법

-- [ ROLE의 종류 ]
-- CONNECT : 접속에 필요한 권한을 묶어놓은 것
-- RESOURCE : 객체 생성을 할수 있는 권한이 묶어놓은 것
-- DBA : 데이터베이스의 모든 권한이 묶어놓은것 

-- GRANT CONNECT, RESOURCE TO [사용자] ; 

-- 실습) CONNECT, RESOURCE 를 권한을 주고 테이블을 아무거나 하나 만들어보자.

CREATE TABLE EMP (
    EMPNO NUMBER PRIMARY KEY , 
    ENAME VARCHAR2(20) NOT NULL,
    JOB_ID VARCHAR2(10),
    SAL NUMBER ,
    DEPTNO NUMBER
) ;



























