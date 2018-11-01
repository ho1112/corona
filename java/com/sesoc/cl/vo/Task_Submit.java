package com.sesoc.cl.vo;

public class Task_Submit {
	private int num;            //과제제출 번호
	private int task_num;       //해당 과제의 번호
	private String user_id;     //작성 학생 아이디
	private String name;        //학생 이름
	private String submit_file; //제출 파일 명
	private String submit_time; //제출 시간
	private String title;       //과제 제목
	private String submit_code; //제출 코드 내용
	
	public Task_Submit() {
		
	}

	public Task_Submit(int num, int task_num, String user_id, String name, String submit_file, String submit_time,
			String title, String submit_code) {
		super();
		this.num = num;
		this.task_num = task_num;
		this.user_id = user_id;
		this.name = name;
		this.submit_file = submit_file;
		this.submit_time = submit_time;
		this.title = title;
		this.submit_code = submit_code;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getTask_num() {
		return task_num;
	}

	public void setTask_num(int task_num) {
		this.task_num = task_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubmit_file() {
		return submit_file;
	}

	public void setSubmit_file(String submit_file) {
		this.submit_file = submit_file;
	}

	public String getSubmit_time() {
		return submit_time;
	}

	public void setSubmit_time(String submit_time) {
		this.submit_time = submit_time;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubmit_code() {
		return submit_code;
	}

	public void setSubmit_code(String submit_code) {
		this.submit_code = submit_code;
	}

	@Override
	public String toString() {
		return "Task_Submit [num=" + num + ", task_num=" + task_num + ", user_id=" + user_id + ", name=" + name
				+ ", submit_file=" + submit_file + ", submit_time=" + submit_time + ", title=" + title
				+ ", submit_code=" + submit_code + "]";
	}

	
}
