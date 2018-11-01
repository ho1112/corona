package com.sesoc.cl.vo;

public class SavedLessonInfo {
	private String num;
	private String class_num;
	private String title;
	private String savetime;
	private String saved_code;
	private String saved_audio;
	
	public SavedLessonInfo() {
		super();
	}

	public SavedLessonInfo(String num, String class_num, String title, String savetime, String saved_code,
			String saved_audio) {
		super();
		this.num = num;
		this.class_num = class_num;
		this.title = title;
		this.savetime = savetime;
		this.saved_code = saved_code;
		this.saved_audio = saved_audio;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getClass_num() {
		return class_num;
	}

	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getSaved_code() {
		return saved_code;
	}

	public void setSaved_code(String saved_code) {
		this.saved_code = saved_code;
	}

	public String getSaved_audio() {
		return saved_audio;
	}

	public void setSaved_audio(String saved_audio) {
		this.saved_audio = saved_audio;
	}

	@Override
	public String toString() {
		return "SavedLessonInfo [num=" + num + ", class_num=" + class_num + ", title=" + title + ", savetime="
				+ savetime + ", saved_code=" + saved_code + ", saved_audio=" + saved_audio + "]";
	}

}
