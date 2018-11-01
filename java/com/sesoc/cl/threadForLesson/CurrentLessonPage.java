package com.sesoc.cl.threadForLesson;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 클래스 Thread에 대한 강의 내용 정보를 담고 있는 클래스
 * @author LSY
 */
public class CurrentLessonPage {
	
	private List<List<Map<String, Map<String, String>>>> projectExplorerList;
	private String nowConsole;
	private String nowPath;
	private String nowCode;
	private List<Map<String, String>> chatHistory = new ArrayList<>(); 
	
	public CurrentLessonPage() {
		super();
	}
	
	/**
	 * 클래스 Thread 강의 정보 보관 VO 생성자
	 * @param projectExplorerList Project Explorer의 정보를 저장
	 * @param changedCode Editor의 현재 Code를 저장
	 * @param changedConsole Console의 현재 출력 결과를 저장
	 * @param nowPath 활성화 Editor의 파일 Path를 저장
	 * @param nowCode 활성돠 Editor의 파일 내용(Code)을 저장
	 */
	public CurrentLessonPage(List<List<Map<String, Map<String, String>>>> projectExplorerList, String nowConsole,
			String nowPath, String nowCode, List<Map<String, String>> chatHistory) {
		super();
		this.projectExplorerList = projectExplorerList;
		this.nowConsole = nowConsole;
		this.nowPath = nowPath;
		this.nowCode = nowCode;
		this.chatHistory = chatHistory;
	}
	
	
	/**
	 * 클래스 Thread 강의 정보 초기화
	 * @return 초기화 완료 했으면 true, 실패면 false
	 */
	public boolean close() {
		boolean result = false;
		projectExplorerList = null;
		nowConsole = null;
	    nowPath = null;
	    nowCode = null;
	    chatHistory.clear();
	    result = true;
	    return result;
	}
	

	public List<List<Map<String, Map<String, String>>>> getProjectExplorerList() {
		return projectExplorerList;
	}
	
	public void setProjectExplorerList(List<List<Map<String, Map<String, String>>>> projectExplorerList) {
		this.projectExplorerList = projectExplorerList;
	}
	
	public String getNowConsole() {
		return nowConsole;
	}
	
	public void setNowConsole(String nowConsole) {
		this.nowConsole = nowConsole;
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
	
	public List<Map<String, String>> getChatHistory() {
		return chatHistory;
	}

	public void setChatHistory(List<Map<String, String>> chatHistory) {
		this.chatHistory = chatHistory;
	}

	@Override
	public String toString() {
		return "CurrentLessonPage [projectExplorerList=" + projectExplorerList + ", nowConsole=" + nowConsole
				+ ", nowPath=" + nowPath + ", nowCode=" + nowCode + ", chatHistory=" + chatHistory + "]";
	}

}
