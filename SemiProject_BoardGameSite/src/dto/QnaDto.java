package dto;

/*
CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    WDATE DATE NOT NULL,                        --작성일
    TITLE VARCHAR2(200) NOT NULL,             --제목
    CONTENT VARCHAR2(4000) NOT NULL,      --내용
    READCOUNT NUMBER(8) NOT NULL,          --조회수
    IS_SECRET NUMBER(1) NOT NULL,             --비밀글 여부 (0 : 아님 / 1 : 비밀글)
    THIS_PASSWORD VARCHAR2(50),               --비밀글일때 패스워드
    DEL NUMBER(1) NOT NULL                     --삭제여부 (0 : X / 1 : 계정 탈퇴)
);

CREATE SEQUENCE SEQ_BG_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA
ADD CONSTRAINT FK_BG_QNA_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);
*/

/*
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
*/


public class QnaDto {
	
	/*
	private int seq;
	private String id;
	private String wdate;
	private String title;
	private String content;
	private int readcount;
	private int is_secret;
	private String this_password;
	private int del;	
	*/
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int readcount;
	private int is_secret;
	private int is_answer;
	private int del;
	private int bestqna;
	
	public QnaDto() {
	}
	
	public QnaDto(String id, String title, String content, int is_secret) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.is_secret = is_secret;
	}

	public QnaDto(int seq, String id, String title, String content, String wdate, int readcount, int is_secret,
			int is_answer, int del, int bestqna) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readcount = readcount;
		this.is_secret = is_secret;
		this.is_answer = is_answer;
		this.del = del;
		this.bestqna = bestqna;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getIs_secret() {
		return is_secret;
	}
	public void setIs_secret(int is_secret) {
		this.is_secret = is_secret;
	}
	public int getIs_answer() {
		return is_answer;
	}
	public void setIs_answer(int is_answer) {
		this.is_answer = is_answer;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getBestqna() {
		return bestqna;
	}
	public void setBestqna(int bestqna) {
		this.bestqna = bestqna;
	}
	
	
}
