package dto;

/*
CREATE TABLE BG_EPILOGUE(
    SEQ NUMBER(8) PRIMARY KEY,               
    ID VARCHAR2(50) NOT NULL, 
    REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
    THUMBNAIL VARCHAR2(200) NOT NULL,     
    TITLE VARCHAR2(200) NOT NULL,  
    PCONTENT VARCHAR2(4000) NOT NULL,
    TCONTENT VARCHAR2(200) NOT NULL,
    FILENAME VARCHAR2(50) NOT NULL,
    WDATE DATE NOT NULL, 
    DEL NUMBER(1) NOT NULL,
    READCOUNT NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_BG_EPILOGUE
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_EPILOGUE
ADD CONSTRAINT FK_BG_EPILOGUE_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);
*/

public class EpilogueDto {

	private int seq;
	private String id;	// æ∆¿Ãµ
	
	private int ref;	// ¬¸¡∂
	private int step;	// (row) Ω∫≈«
	private int depth;	// ±Ì¿Ã
	
	private String thumbnail;	//ΩÊ≥◊¿œ.
	
	private String title;
	private String pcontent;
	private String tcontent;
	private String filename;
	private String wdate;	// ¿€º∫¿œ
	
	private int del;
	private int readcount;
	
	
	public EpilogueDto() {
		// TODO Auto-generated constructor stub
	}

	public EpilogueDto(int seq, String id, int ref, int step, int depth, String thumbnail, String title,
			String pcontent, String tcontent, String filename, String wdate, int del, int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.thumbnail = thumbnail;
		this.title = title;
		this.pcontent = pcontent;
		this.tcontent = tcontent;
		this.filename = filename;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}


