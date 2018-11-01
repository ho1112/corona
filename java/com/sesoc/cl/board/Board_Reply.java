package com.sesoc.cl.board;

public class Board_Reply {
	private int num; //댓글의 num
	private int board_num; //해당 게시글의 num
	private String user_id; //작성자
	private String content; //댓글내용
	private int parent; //부모댓글의 num
	private String register_time; //댓글 작성시간
	private int depth; //답글일 경우의 위치
	private int reorder; //전체 댓글의 순서
	
	public Board_Reply() {
	}

	public Board_Reply(int num, int board_num, String user_id, String content, int parent, String register_time,
			int depth, int reorder) {
		super();
		this.num = num;
		this.board_num = board_num;
		this.user_id = user_id;
		this.content = content;
		this.parent = parent;
		this.register_time = register_time;
		this.depth = depth;
		this.reorder = reorder;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getRegister_time() {
		return register_time;
	}

	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getReorder() {
		return reorder;
	}

	public void setReorder(int reorder) {
		this.reorder = reorder;
	}

	@Override
	public String toString() {
		return "Board_Reply [num=" + num + ", board_num=" + board_num + ", user_id=" + user_id + ", content=" + content
				+ ", parent=" + parent + ", register_time=" + register_time + ", depth=" + depth + ", reorder="
				+ reorder + "]";
	}

}
