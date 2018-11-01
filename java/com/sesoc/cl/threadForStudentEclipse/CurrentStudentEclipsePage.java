package com.sesoc.cl.threadForStudentEclipse;

import java.util.List;
import java.util.Map;

/**
 * 학생 Eclipse 접속 Thread에서 학생 Eclipse 정보를 담고 있는 클래스
 * @author LSY
 */
public class CurrentStudentEclipsePage {
	
	private List<List<Map<String, Map<String, String>>>> projectExplorerList;
	private String changedCode;
	private String changedConsole;
	private String nowPath;
	private String nowCode;
	
	public CurrentStudentEclipsePage() {
		super();
	}
	
	/**
	 * 학생 Eclipse 접속  Thread 강의 정보 보관 VO 생성자
	 * @param projectExplorerList Project Explorer의 정보를 저장
	 * @param changedCode Editor의 현재 Code를 저장
	 * @param changedConsole Console의 현재 출력 결과를 저장
	 * @param nowPath 활성화 Editor의 파일 Path를 저장
	 * @param nowCode 활성돠 Editor의 파일 내용(Code)을 저장
	 */
	public CurrentStudentEclipsePage(List<List<Map<String, Map<String, String>>>> projectExplorerList, String changedCode, String changedConsole,
			String nowPath, String nowCode) {
		super();
		this.projectExplorerList = projectExplorerList;
		this.changedCode = changedCode;
		this.changedConsole = changedConsole;
		this.nowPath = nowPath;
		this.nowCode = nowCode;
	}
	
	/**
	 * 학생 Eclipse 접속 Thread의 학생 Eclipse 정보 초기화
	 * @return 초기화 완료 했으면 true, 실패면 false
	 */
	public boolean close() {
		boolean result = false;
		projectExplorerList = null;
		changedCode = null;   
		changedConsole = null;
	    nowPath = null;
	    nowCode = null;
	    return result;
	}
	
	public List<List<Map<String, Map<String, String>>>> getProjectExplorerList() {
		return projectExplorerList;
	}
	
	public void setProjectExplorerList(List<List<Map<String, Map<String, String>>>> projectExplorerList) {
		this.projectExplorerList = projectExplorerList;
	}
	
	public String getChangedCode() {
		return changedCode;
	}
	
	public void setChangedCode(String changedCode) {
		this.changedCode = changedCode;
	}
	
	public String getChangedConsole() {
		return changedConsole;
	}
	
	public void setChangedConsole(String changedConsole) {
		this.changedConsole = changedConsole;
	}
	
	public String getNowPath() {
		return nowPath;
	}
	
	public void setNowPath(String nowPath) {
		this.nowPath = nowPath;
	}
	
	public String getNowCode() {
		return nowCode;
	}
	
	public void setNowCode(String nowCode) {
		this.nowCode = nowCode;
	}

	@Override
	public String toString() {
		return "CurrentStudentEclipsePage [projectExplorerList=" + projectExplorerList + ", changedCode=" + changedCode
				+ ", changedConsole=" + changedConsole + ", nowPath=" + nowPath + ", nowCode=" + nowCode + "]";
	}

}
