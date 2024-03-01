CREATE DATABASE jsp_02_02_mvc1_board;

USE jsp_02_02_mvc1_board;

CREATE TABLE board(
	num INT,
    writer VARCHAR(20),
    email VARCHAR(20),
    subject VARCHAR(50),
    pw VARCHAR(20),
    content VARCHAR(100),
    ref INT,
    re_step INT,
    re_level INT,
    read_count INT,
    reg_date DATETIME
);

DESC board;

# 새 글 작성하기
INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(1, '홍길동', 'hong@naver.com', '첫번째 게시글 입니다.', '1234', '게시판 연습중이예요', now(), 1, 1, 1, 0);

INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(2, '김루트', 'root@naver.com', '두번째 게시글 입니다.', '1234', '게시판 연습중이예요', now(), 2, 1, 1, 0);

INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(3, '박서방', 'park@naver.com', '세번째 게시글 입니다.', '1234', '게시판 연습중이예요', now(), 3, 1, 1, 0);

INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(4, '민서연', 'min@naver.com', '네번째 게시글 입니다.', '1234', '게시판 연습중이예요', now(), 4, 1, 1, 0);

SELECT * FROM board;
SELECT * FROM board ORDER BY ref DESC, re_level ASC;




SELECT * FROM board;
# 0번부터 게시글 3개 가져오기
SELECT * FROM board LIMIT 0, 3;

SELECT * FROM board ORDER BY ref DESC, re_level ASC;
SELECT * FROM board ORDER BY ref DESC, re_level LIMIT 0, 3;

UPDATE board SET read_count=read_count + 1 WHERE num=3;

SELECT * FROM board WHERE num=3;

SELECT pw FROM board WHERE num=3;

UPDATE board SET subject='2번째 게시글 입니다.', content='게시판 연습은 즐거워요' WHERE num=2;

DELETE FROM board WHERE num=4;

SELECT MAX(num) FROM board;
SELECT MAX(ref) FROM board;
SELECT COUNT(*) FROM board;







# 2번 글에 대한 댓글 작성하기
UPDATE board SET re_level=re_level+1 WHERE ref=2 AND re_level > 1;
INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(5, '김파이', 'pie@naver.com', '[답글]파이님의 답글 입니다.', '1234', '답글 연습중이예요', now(), 2, 1, 1, 0);
UPDATE board SET re_step=re_step+1, re_level=re_level+1 WHERE num=5;
SELECT * FROM board;
SELECT * FROM board ORDER BY ref DESC, re_level ASC;

# 5번 글에 대한 댓글 작성하기
UPDATE board SET re_level=re_level+1 WHERE ref=2 AND re_level > 2;
INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(6, '김맥스', 'max@naver.com', '[답글][답글]맥스님의 답글 입니다.', '1234', '답글 연습중이예요', now(), 2, 2, 2, 0);
UPDATE board SET re_step=re_step+1, re_level=re_level+1 WHERE num=6;
SELECT * FROM board;
SELECT * FROM board ORDER BY ref DESC, re_level ASC;

# 2번 글에 대한 댓글 작성하기 
UPDATE board SET re_level=re_level+1 WHERE ref=2 AND re_level > 1;
INSERT INTO board (num, writer, email, subject, pw, content, reg_date, ref, re_step, re_level, read_count)
VALUES(7, '김파파', 'papa@naver.com', '[답글]파파님의 답글 입니다.', '1234', '답글 연습중이예요', now(), 2, 1, 1, 0);
UPDATE board SET re_step=re_step+1, re_level=re_level+1 WHERE num=7;
SELECT * FROM board;
SELECT * FROM board ORDER BY ref DESC, re_level ASC;




