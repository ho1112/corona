package com.sesoc.cl.vo;

public class Task {
	private int num;                 //과제의 관리 번호
	private int class_num;           //반의 관리 번호
	private String title;            //과제의 제목
	private String content;          //과제의 내용
	private String question_file;    //과제파일의 이름
	private String deadline;    	 //과제의 마감 기간
	private String is_closed;        //과제의 마감 유무
	private String code;             //과제의 실질 코드
	private boolean submitted;
	
	public Task() {
	
	}

	public Task(int num, int class_num, String title, String content, String question_file, String deadline,
			String is_closed, String code, boolean submitted) {
		super();
		this.num = num;
		this.class_num = class_num;
		this.title = title;
		this.content = content;
		this.question_file = question_file;
		this.deadline = deadline;
		this.is_closed = is_closed;
		this.code = code;
		this.submitted = submitted;
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

	public String getQuestion_file() {
		return question_file;
	}

	public void setQuestion_file(String question_file) {
		this.question_file = question_file;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getIs_closed() {
		return is_closed;
	}

	public void setIs_closed(String is_closed) {
		this.is_closed = is_closed;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public boolean isSubmitted() {
		return submitted;
	}

	public void setSubmitted(boolean submitted) {
		this.submitted = submitted;
	}

	@Override
	public String toString() {
		return "Task [num=" + num + ", class_num=" + class_num + ", title=" + title + ", content=" + content
				+ ", question_file=" + question_file + ", deadline=" + deadline + ", is_closed=" + is_closed + ", code="
				+ code + ", submitted=" + submitted + "]";
	}

}
