--Q&A 게시판 테이블 -> BG_QNA
DROP TABLE BG_QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_QNA;

CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    TITLE VARCHAR2(200) NOT NULL,             --제목
    CONTENT VARCHAR2(4000) NOT NULL,      --내용
    WDATE DATE NOT NULL,                        --작성일
    READCOUNT NUMBER(8) NOT NULL,          --조회수
    IS_SECRET NUMBER(1) NOT NULL,             --비밀글 여부 (0 : 아님 / 1 : 비밀글)
    IS_ANSWER NUMBER(1) NOT NULL,			-- 관리자의 답변 여부(0 : 답변하지 않음 / 1 : 답변함)
    DEL NUMBER(1) NOT NULL,                     --삭제여부 (0 : X / 1 : 계정 탈퇴)
    BESTQNA NUMBER(1) NOT NULL				-- 관리자가 지정한 베스트 질문 여부 (0 : X / 1 : 베스트 지정)
);

CREATE SEQUENCE SEQ_BG_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA
ADD CONSTRAINT FK_BG_QNA_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

SELECT * FROM BG_QNA

delete from BG_QNA where seq=1;

