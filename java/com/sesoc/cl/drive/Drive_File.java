package com.sesoc.cl.drive;

public class Drive_File {
	
	private int num;
	private String original_filename;
	private String saved_filename;
	private int drive_num;
	private int down_count;
	
	public Drive_File() {
	}

	public Drive_File(int num, String original_filename, String saved_filename, int drive_num, int down_count) {
		super();
		this.num = num;
		this.original_filename = original_filename;
		this.saved_filename = saved_filename;
		this.drive_num = drive_num;
		this.down_count = down_count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOriginal_filename() {
		return original_filename;
	}

	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}

	public String getSaved_filename() {
		return saved_filename;
	}

	public void setSaved_filename(String saved_filename) {
		this.saved_filename = saved_filename;
	}

	public int getDrive_num() {
		return drive_num;
	}

	public void setDrive_num(int drive_num) {
		this.drive_num = drive_num;
	}

	public int getDown_count() {
		return down_count;
	}

	public void setDown_count(int down_count) {
		this.down_count = down_count;
	}

	@Override
	public String toString() {
		return "Drive_File [num=" + num + ", original_filename=" + original_filename + ", saved_filename="
				+ saved_filename + ", drive_num=" + drive_num + ", down_count=" + down_count + "]";
	}
	
}
