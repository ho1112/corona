package com.sesoc.cl.threadForStudentEclipse;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sesoc.cl.connInfo.StudentEclipseThreadList;
import com.sesoc.cl.connInfo.TeacherConn;

/**
 * 학생 Eclipse 접속 Thread의 메인 클레스
 * @author LSY
 */
public class StudentEclipseThread implements Runnable{
	
	private Socket socket;
	private InputStream is;
	private OutputStream os;
	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	
	private TeacherConn teacherConn;
	private StudentEclipseInitialization init;
	private SendToStudentEclipsePage send;
	private CurrentStudentEclipsePage currentStudentEclipsePage;
	
	private boolean stop;
	
	/**
	 * 학생 Eclipse 접속 Thread의 생성자, 실행에 필요한 요소들의 객체를 생성
	 * @param teacherConn 접속을 시도하는 선생님의 정보를 담은 VO
	 * @param socket 접속 될 학생의 IP
	 */
	public StudentEclipseThread(TeacherConn teacherConn, Socket socket) {
		this.teacherConn = teacherConn;
		this.socket = socket;
		currentStudentEclipsePage = new CurrentStudentEclipsePage();
		
		send = new SendToStudentEclipsePage(teacherConn.getSession());
		init = new StudentEclipseInitialization();
	}
	
	/**
	 * Thread가 start() 명령을 받았을 경우 실행되는 메소드
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		initStream();
		init.initStreamCheck(oos);
		
		send.sendToStudentEclipsePage("connStudentEclipseSuccess");
		
		init.getInitProjectExplorer(ois, currentStudentEclipsePage, send);
		init.getInitActivedEditor(ois, currentStudentEclipsePage, send);
		
		try {
			//stop이 true가 될 때까지 무한 반복
			while(!stop) {
				//Eclipse에게 정보를 받음
				Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
				//action을 추출하여 저장
				String action = (String)receiveMapFromEclipse.get("action");
				
				//action의 정보에 따라 그에 맞는 코드를 실행
				switch(action) {
				//project에 포함되어 있는 요소의 변화가 생겼을 경우 실행
				case "projectChange":
					//요소가 변화 된 Project의 정보를 로딩
					List<Map<String, Map<String, String>>> changedProjectList = (List<Map<String, Map<String, String>>>)receiveMapFromEclipse.get("list");

					//변화 된 Project의 Project이름(path)을 로딩
					String projectName1 = null;
					for(Map<String, Map<String, String>> m : changedProjectList) {
						if(m.get("parent") == null) {
							projectName1 = m.get("child").get("path");
							break;
						}
					}
					
					//변화 된 Project의 이름과 동일한 Project를 탐색
					List<List<Map<String, Map<String, String>>>> projectExplorerList1 = currentStudentEclipsePage.getProjectExplorerList();
					for(List<Map<String, Map<String, String>>> l : projectExplorerList1) {
						for(Map<String, Map<String, String>> m : l) {
							if(m.get("parent") == null) {
								if(m.get("child").get("path").equals(projectName1)) {
									//변화 된 project의 index를 확인
									int index = projectExplorerList1.indexOf(l);
									//변화 된 project로 바꿔 줌
									projectExplorerList1.set(index, changedProjectList);
									//update된 project explorer의 정보를 접속 학생들에게 전송
									send.sendToStudentEclipsePage("changeProject", "projectExplorer", projectExplorerList1);
									break;
								}
							}
						}
					}
					break;
					
				//Project가 삭제 되었을 경우 실행
				case "projectDelete":
					//삭제 된 Project의 정보를 로딩
					List<Map<String, Map<String, String>>> deletedProjectList = (List<Map<String, Map<String, String>>>)receiveMapFromEclipse.get("list");
					String projectName2 = null;
					projectName2 = deletedProjectList.get(0).get("child").get("path");
					
					//삭제 된 Project의 이름과 동일한 Project를 탐색
					int deleteIndex = -1;
					List<List<Map<String, Map<String, String>>>> projectExplorerList2 = currentStudentEclipsePage.getProjectExplorerList();
					for(List<Map<String, Map<String, String>>> l : projectExplorerList2) {
						for(Map<String, Map<String, String>> m : l) {
							if(m.get("parent") == null) {
								if(m.get("child").get("path").equals(projectName2)) {
									//삭제 된 Project의 index를 저장
									deleteIndex = projectExplorerList2.indexOf(l);
									break;
								}
							}
						}
					}
					if(deleteIndex != -1) {
						//삭제 된 project를 저장된 project explorer객체에서 삭제
						projectExplorerList2.remove(deleteIndex);
						//update된 project explorer의 정보를 접속 학생들에게 전송
						send.sendToStudentEclipsePage("changeProject", "projectExplorer", projectExplorerList2);
					}
					break;
				
				//Project가 추가 되었을 경우 실행
				case "projectAdd":
					//추가 된 Project의 정보를 로딩
					List<Map<String, Map<String, String>>> addedProjectList = (List<Map<String, Map<String, String>>>)receiveMapFromEclipse.get("list");
					
					//추가 된 Project를 project explorer객체에 추가
					List<List<Map<String, Map<String, String>>>> projectExplorerList3 = currentStudentEclipsePage.getProjectExplorerList();
					projectExplorerList3.add(addedProjectList);
					
					//update된 project explorer의 정보를 접속 학생들에게 전송
					send.sendToStudentEclipsePage("changeProject", "projectExplorer", projectExplorerList3);
					break;
					
				//활성화 Editor의 Code에 변화가 있을 경우 실행
				case "codeChange":
					String changedCode = (String)receiveMapFromEclipse.get("code");
					currentStudentEclipsePage.setChangedCode(changedCode);
					currentStudentEclipsePage.setNowCode(changedCode);
//					System.out.println("codeChange : " + changedCode);
					send.sendToStudentEclipsePage("changeCode", "code", changedCode);

					break;
					
				//Console창의 변화가 있을 경우 실행
				case "consoleChange":
					String changedConsole = (String)receiveMapFromEclipse.get("console");
					currentStudentEclipsePage.setChangedConsole(changedConsole);
					
//					System.out.println("consoleChange : " + changedConsole);
					send.sendToStudentEclipsePage("changeConsole", "console", changedConsole);
					break;
					
				//활성화 Editor가 바뀌었을 경우 실행
				case "activatedEditorChange":
					String nowPath = (String) receiveMapFromEclipse.get("path");
					String nowCode = (String) receiveMapFromEclipse.get("code");
					currentStudentEclipsePage.setNowPath(nowPath);
					currentStudentEclipsePage.setNowCode(nowCode);
					
//					System.out.println("now activated path : " + nowPath);
//					System.out.println("now activated code : " + nowCode);
					send.sendToStudentEclipsePage("changeActivatedEditor", "nowPath", nowPath, "nowCode", nowCode);
					break;
				case "disconnect":
					disconnect();
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			disconnect();
		}
	}
	
	
	/**
	 * 학생의 Eclipse와 통신을 위한 Socket 및 Stream 생성
	 */
	private boolean initStream() {
		boolean result = false;
		try {
			os = socket.getOutputStream();
			is = socket.getInputStream();
			
			oos = new ObjectOutputStream(os);
			ois = new ObjectInputStream(is);
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
			close();
		}
		return result;
	}
	
	public TeacherConn getTeacherConn() {
		return teacherConn;
	}

	/**
	 * Eclipse가 종료되거나 강의가 종료되었을 경우 실행, 현재 Thread를 종료 시키고, 학생에게 강의 종료를 알림
	 */
	public boolean disconnect() {
		boolean result = false;
		send.sendToStudentEclipsePage("disconnStudentEclipse");
		currentStudentEclipsePage.close();
		stop = true;
		close();
		StudentEclipseThreadList.getStudentEclipseList().remove(this);
		System.out.println(teacherConn.getId() + "님의 관전이 종료되었습니다.");
		result = true;
		
		return result;
	}
	
	
	public boolean requestDisconnect() {
		boolean result = false;
		
		Map<String, Object> sendMapToEclipse = new HashMap<>();
		sendMapToEclipse.put("action", "disconnection");
		try {
			oos.writeObject(sendMapToEclipse);
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * socket이 강제 종료되었을 경우 실행
	 */
	private void close() {
		try {
			StudentEclipseThreadList.getStudentEclipseList().remove(this);
			if(oos != null)	oos.close();
			if(ois != null) ois.close();
			if(os != null) os.close();
			if(is != null) is.close();
			if(socket != null) socket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
