package com.sesoc.cl.vo;

public class ClassInfo {
	private int num;
	private String name;
	private String teacher_id;
	private String is_public;
	public ClassInfo() {
		// TODO Auto-generated constructor stub
	}
	public ClassInfo(int num, String name, String teacher_id, String is_public) {
		super();
		this.num = num;
		this.name = name;
		this.teacher_id = teacher_id;
		this.is_public = is_public;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getIs_public() {
		return is_public;
	}
	public void setIs_public(String is_public) {
		this.is_public = is_public;
	}
	@Override
	public String toString() {
		return "Class [num=" + num + ", name=" + name + ", teacher_id=" + teacher_id + ", is_public=" + is_public + "]";
	}
	
}
