package model1.board;

public class BoardDTO {
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String visitcount;
	private String name; // member table의 name을 가져올 데이터! (Board에는 존재X)
	private int replyCnt; // reply table의 댓글 수를 가져올 데이터!


	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public java.sql.Date getPostdate() {
		return postdate;
	}

	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	
}
