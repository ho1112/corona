package com.sesoc.cl.board;

public class Board_File {

	private int num;
	private String original_filename;
	private String saved_filename;
	private int bf_num;
	
	public Board_File() {
	}

	public Board_File(int num, String original_filename, String saved_filename, int bf_num) {
		super();
		this.num = num;
		this.original_filename = original_filename;
		this.saved_filename = saved_filename;
		this.bf_num = bf_num;
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

	public int getBf_num() {
		return bf_num;
	}

	public void setBf_num(int bf_num) {
		this.bf_num = bf_num;
	}

	@Override
	public String toString() {
		return "Board_File [num=" + num + ", original_filename=" + original_filename + ", saved_filename="
				+ saved_filename + ", bf_num=" + bf_num + "]";
	}
	
}
