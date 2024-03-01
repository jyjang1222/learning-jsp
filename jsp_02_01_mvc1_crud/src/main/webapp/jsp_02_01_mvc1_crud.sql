CREATE DATABASE jsp_02_01_mvc1_crud;

USE jsp_02_01_mvc1_crud;

CREATE TABLE member(
	id VARCHAR(20),
    pw VARCHAR(20),
    name VARCHAR(20),
    reg_date DATETIME
);


INSERT INTO member (id, pw, name, reg_date) VALUES ('qwer', '1234', '홍길동', now());
INSERT INTO member VALUES ('abcd', '1234', '박대길', now());
INSERT INTO member VALUES ('hello', '1234', '김여신', now());
INSERT INTO member VALUES ('test', '1111', '민서희', now());

SELECT * FROM member;
SELECT COUNT(*) FROM member WHERE id='abcd' AND pw='1234';

DELETE FROM member WHERE id='test2';

UPDATE member SET name='최여신' WHERE id='hello'; 


DROP TABLE member;
DESC member;



