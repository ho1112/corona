package com.sesoc.cl.vo;

public class ClassCount {
	private int num;
	private int usernum;
	public ClassCount() {
		// TODO Auto-generated constructor stub
	}
	public ClassCount(int num, int usernum) {
		super();
		this.num = num;
		this.usernum = usernum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	@Override
	public String toString() {
		return "ClassCount [num=" + num + ", usernum=" + usernum + "]";
	}
	
}
