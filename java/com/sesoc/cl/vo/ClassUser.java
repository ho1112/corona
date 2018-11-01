package com.sesoc.cl.vo;

public class ClassUser {
	private int num;
	private int class_num;
	private String user_id;
	private String status;
	
	public ClassUser() {
		// TODO Auto-generated constructor stub
	}

	public ClassUser(int num, int class_num, String user_id, String status) {
		super();
		this.num = num;
		this.class_num = class_num;
		this.user_id = user_id;
		this.status = status;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ClassUser [num=" + num + ", class_num=" + class_num + ", user_id=" + user_id + ", status=" + status
				+ "]";
	}
	
}
