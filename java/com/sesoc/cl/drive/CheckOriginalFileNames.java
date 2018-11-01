package com.sesoc.cl.drive;

import java.util.Arrays;

public class CheckOriginalFileNames {
	private String title;
	private String[] original_filename;
	public CheckOriginalFileNames() {
		// TODO Auto-generated constructor stub
	}
	
	public CheckOriginalFileNames(String title, String[] original_filename) {
		super();
		this.title = title;
		this.original_filename = original_filename;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String[] getOriginal_filename() {
		return original_filename;
	}
	public void setOriginal_filename(String[] original_filename) {
		this.original_filename = original_filename;
	}
	@Override
	public String toString() {
		return "CheckOriginalFileNames [title=" + title + ", original_filename=" + Arrays.toString(original_filename)
				+ "]";
	}
	
}
