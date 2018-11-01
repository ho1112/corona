package com.sesoc.cl.board;

public class Board {
	private int num; //게시글의 num
	private int class_num; //해당 반의 num
	private String user_id; //작성자
	private String title; //게시글 제목
	private String content; //게시글 내용
	private String register_time; //게시글 작성 시간
	private int hit; //조회수
	private int reply_count; //댓글 수 
	
	public Board() {
	}

	public Board(int num, int class_num, String user_id, String title, String content, String register_time, int hit,
			int reply_count) {
		super();
		this.num = num;
		this.class_num = class_num;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.register_time = register_time;
		this.hit = hit;
		this.reply_count = reply_count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getRegister_time() {
		return register_time;
	}

	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", class_num=" + class_num + ", user_id=" + user_id + ", title=" + title
				+ ", content=" + content + ", register_time=" + register_time + ", hit=" + hit + ", reply_count="
				+ reply_count + "]";
	}

}
