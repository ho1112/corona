package com.sesoc.cl.drive;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class MultiFiles {
	//다중 업로드 시 필요한 VO
	private String title;
	private MultipartFile[] file1;
	public MultiFiles() {
		// TODO Auto-generated constructor stub
	}
	
	public MultiFiles(String title, MultipartFile[] file1) {
		super();
		this.title = title;
		this.file1 = file1;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile[] getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile[] file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "MultiFiles [title=" + title + ", file1=" + Arrays.toString(file1) + "]";
	}
	
}
