package com.sesoc.cl.drive;

public class Drive {
	private int num;
	private int class_num;
	private String user_id;
	private String title;
	private String content;
	private String saved_filename;
	private String original_filename;
	private String register_time;
	private int hit;
	
	public Drive() {
	}
	
	public Drive(int num, int class_num, String user_id, String title, String content, String saved_filename,
			String original_filename, String register_time, int hit) {
		super();
		this.num = num;
		this.class_num = class_num;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.saved_filename = saved_filename;
		this.original_filename = original_filename;
		this.register_time = register_time;
		this.hit = hit;
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
	public String getSaved_filename() {
		return saved_filename;
	}
	public void setSaved_filename(String saved_filename) {
		this.saved_filename = saved_filename;
	}
	public String getOriginal_filename() {
		return original_filename;
	}
	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
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

	@Override
	public String toString() {
		return "Drive [num=" + num + ", class_num=" + class_num + ", user_id=" + user_id + ", title=" + title
				+ ", content=" + content + ", saved_filename=" + saved_filename + ", original_filename="
				+ original_filename + ", register_time=" + register_time + ", hit=" + hit + "]";
	}
	
}