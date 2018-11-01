package com.sesoc.cl.threadForStudentEclipse;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 학생 Eclipse 접속 Thread의 초기화 메소드를 모아논 클래스
 * @author LSY
 */
public class StudentEclipseInitialization {
	
	/**
	 * Eclipse와의 Stream이 잘 구축되었는지 확인을 위해 Eclipse에 성공 메세지 전달
	 * @param oos 
	 */
	public void initStreamCheck(ObjectOutputStream oos) {
		try {
			Map<String, Object> sendMapToEclipse = new HashMap<>();
			sendMapToEclipse.put("initResult", "success");
			oos.writeObject(sendMapToEclipse);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Eclipse연결 시 Project Explorer의 정보를 로딩 
	 * @param send 
	 * @param currentStudentEclipsePage 
	 * @param ois 
	 * @return Eclipse로 부터 정보를 받아서 CurrentLessonPage객체에 저장을 완료했으면 true, 실패하면 false
	 */
	@SuppressWarnings("unchecked")
	public void getInitProjectExplorer(ObjectInputStream ois, 
			CurrentStudentEclipsePage currentStudentEclipsePage, 
			SendToStudentEclipsePage send) {
		
		try {
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initProjectExplorer":
				List<List<Map<String, Map<String, String>>>> projectExplorerList = (List<List<Map<String, Map<String, String>>>>)receiveMapFromEclipse.get("list");
				currentStudentEclipsePage.setProjectExplorerList(projectExplorerList);
				//Eclipse의 Project Explorer의 정보 전달
				send.sendToStudentEclipsePage("initProjectExplorer", 
						"projectExplorer", projectExplorerList);
				break;
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * Eclipse연결 시 활성화 되어 있는 Editor의 정보를 로딩 
	 * @return Eclipse로 부터 정보를 받아서 CurrentLessonPage객체에 저장을 완료했으면 true, 실패하면 false
	 */
	@SuppressWarnings("unchecked")
	public boolean getInitActivedEditor(ObjectInputStream ois, 
			CurrentStudentEclipsePage currentStudentEclipsePage, 
			SendToStudentEclipsePage send) {
		boolean result = false;
		
		try {
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initActivatedEditor":
				String path = (String) receiveMapFromEclipse.get("path");
				String code = (String) receiveMapFromEclipse.get("code");
				currentStudentEclipsePage.setNowPath(path);
				currentStudentEclipsePage.setNowCode(code);
				send.sendToStudentEclipsePage("initActivatedEditor", 
						"nowPath", path, 
						"nowCode", code);
//				System.out.println("init activated path : " + path);
//				System.out.println("init activated code : " + code);
				break;
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
