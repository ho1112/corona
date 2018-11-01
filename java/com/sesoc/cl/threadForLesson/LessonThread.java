package com.sesoc.cl.threadForLesson;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.socket.TextMessage;

import com.sesoc.cl.connInfo.LessonList;
import com.sesoc.cl.connInfo.StudentConn;
import com.sesoc.cl.connInfo.TeacherConn;
import com.sesoc.cl.connInfo.TeacherConnList;
import com.sesoc.cl.forAudioCapture.AudioRecordThread;
import com.sesoc.cl.forLessonSave.LessonSave;

/**
 * 클래스 Thread의 메인 클레스
 * @author LSY
 */
public class LessonThread implements Runnable{
	
	private LessonInitialization init;
	private SendToLessonPage sendToLessonPage;
	private LessonSave lessonSave;
	private AudioRecordThread audioRecordThread;
	private Socket socket;
	private OutputStream os;
	private InputStream is;
	private ObjectOutputStream oos;
	private ObjectInputStream ois;
	
	private TeacherConn teacherConn; 
	private List<StudentConn> studentConnList;
	private CurrentLessonPage currentLessonPage;
	private SendChatMessage sendChatMessage;
	
	private long startTime;
	private boolean stop;
	private String savedFileName;
	
	/**
	 * 클래스 Thread의 생성자, 실행에 필요한 요소들의 객체를 생성
	 * @param teacherConn 선생님의 정보를 담고있는 VO
	 */
	public LessonThread(TeacherConn teacherConn) {
		this.teacherConn = teacherConn;
		studentConnList = new ArrayList<>();
		currentLessonPage = new CurrentLessonPage();
		
		init = new LessonInitialization();
		sendToLessonPage = new SendToLessonPage(studentConnList);
	}
	
	/**
	 * Thread가 start() 명령을 받았을 경우 실행되는 메소드
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		
		initStream(teacherConn.getSocket());
		
		init.initStreamCheck(oos);
		
		savedFileName = init.getSavedFileName(teacherConn.getclassNum());
		startTime = System.currentTimeMillis();
		
		audioRecordThread = init.startAudioRecord(oos, savedFileName);
		
		lessonSave = new LessonSave(savedFileName, startTime);
		lessonSave.initSaveFile();
		
		sendChatMessage = new SendChatMessage(teacherConn, studentConnList, 
				currentLessonPage.getChatHistory(), lessonSave);
		
		init.getInitProjectExplorer(ois, currentLessonPage, lessonSave);
		init.getInitActivedEditor(ois, currentLessonPage, lessonSave);
		
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
					List<List<Map<String, Map<String, String>>>> projectExplorerList1 = currentLessonPage.getProjectExplorerList();
					for(List<Map<String, Map<String, String>>> l : projectExplorerList1) {
						for(Map<String, Map<String, String>> m : l) {
							if(m.get("parent") == null) {
								if(m.get("child").get("path").equals(projectName1)) {
									//변화 된 project의 index를 확인
									int index = projectExplorerList1.indexOf(l);
									//변화 된 project로 바꿔 줌
									projectExplorerList1.set(index, changedProjectList);
									//자막 저장
									lessonSave.savePart("projectChange", projectExplorerList1);
									//update된 project explorer의 정보를 접속 학생들에게 전송
									sendToLessonPage.sendToLessonPage("changeProject", "projectExplorer", projectExplorerList1);
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
					List<List<Map<String, Map<String, String>>>> projectExplorerList2 = currentLessonPage.getProjectExplorerList();
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
						//자막 저장
						lessonSave.savePart("projectDelete", projectExplorerList2);
						//update된 project explorer의 정보를 접속 학생들에게 전송
						sendToLessonPage.sendToLessonPage("changeProject", "projectExplorer", projectExplorerList2);
					}
					break;
				
				//Project가 추가 되었을 경우 실행
				case "projectAdd":
					//추가 된 Project의 정보를 로딩
					List<Map<String, Map<String, String>>> addedProjectList = (List<Map<String, Map<String, String>>>)receiveMapFromEclipse.get("list");
					
					//추가 된 Project를 project explorer객체에 추가
					List<List<Map<String, Map<String, String>>>> projectExplorerList3 = currentLessonPage.getProjectExplorerList();
					projectExplorerList3.add(addedProjectList);
					
					//자막 저장
					lessonSave.savePart("projectAdd", projectExplorerList3);
					
					//update된 project explorer의 정보를 접속 학생들에게 전송
					sendToLessonPage.sendToLessonPage("changeProject", "projectExplorer", projectExplorerList3);
					break;
					
				//활성화 Editor의 Code에 변화가 있을 경우 실행
				case "codeChange":
					String changedCode = (String)receiveMapFromEclipse.get("code");
					currentLessonPage.setNowCode(changedCode);
					
					//자막 저장
					lessonSave.savePart("codeChange", changedCode);
					
//					System.out.println("codeChange : " + changedCode);
					sendToLessonPage.sendToLessonPage("changeCode", "code", changedCode);

					break;
					
				//Console창의 변화가 있을 경우 실행
				case "consoleChange":
					String changedConsole = (String)receiveMapFromEclipse.get("console");
					currentLessonPage.setNowConsole(changedConsole);
					
					//자막 저장
					lessonSave.savePart("consoleChange", changedConsole);
					
//					System.out.println("consoleChange : " + changedConsole);
					sendToLessonPage.sendToLessonPage("changeConsole", "console", changedConsole);
					break;
					
				//활성화 Editor가 바뀌었을 경우 실행
				case "activatedEditorChange":
					String nowPath = (String) receiveMapFromEclipse.get("path");
					String nowCode = (String) receiveMapFromEclipse.get("code");
					currentLessonPage.setNowPath(nowPath);
					currentLessonPage.setNowCode(nowCode);
					Map<String, String> tempMap = new HashMap<>();
					tempMap.put("path", nowPath);
					tempMap.put("code", nowCode);
					
					//자막 저장
					lessonSave.savePart("activatedEditorChange", tempMap);
					
//					System.out.println("now activated path : " + nowPath);
//					System.out.println("now activated code : " + nowCode);
					sendToLessonPage.sendToLessonPage("changeActivatedEditor", "nowPath", nowPath, "nowCode", nowCode);
					break;
				
				//Eclipse가 종료되거나 강의가 종료되었을 경우 실행
				case "disconnection":
					System.out.println("강의전송소켓 정상 종료");
					disconnect();
					break;
				}
			}
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("강의전송소켓 강제 종료");
			disconnect();
		}
	}

	/**
	 * Eclipse와 통신을 위한 Stream 생성
	 * @param socket 
	 */
	private void initStream(Socket socket) {
		try {
			this.socket = socket;
			
			os = socket.getOutputStream();
			is = socket.getInputStream();
			
			oos = new ObjectOutputStream(os);
			ois = new ObjectInputStream(is);
		} catch (IOException e) {
			e.printStackTrace();
			connClose();
		}
	}
	
	/**
	 * Eclipse가 종료되거나 강의가 종료되었을 경우 실행, 현재 Thread를 종료 시키고, 학생에게 강의 종료를 알림
	 */
	private void disconnect() {
		audioRecordThread.stop();
		
		sendToLessonPage.sendToLessonPage("disconnect");
		
		Map<String, Object> sendMap = new HashMap<>();
		sendMap.put("action", "disconnect");
		sendMap.put("savedFileName", savedFileName);
		sendMap.put("lessonTitle", teacherConn.getTitle());
		String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
		try {
			teacherConn.getSession().sendMessage(new TextMessage(JSONStringSendMessage));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		lessonSave.savePart("", null);
		
		connClose();
		
		TeacherConnList.getList().remove(teacherConn);
		currentLessonPage.close();
		LessonList.getLessonList().remove(this);
		
		stop = true;
		System.out.println(teacherConn.getId() + "님의 수업이 종료되었습니다.");
	}
	
	/**
	 * 학생이 클래스 Thread에 참여 하였을 때 실행
	 * @param studentConn 참여한 학생의 StudnetConn객체
	 */
	public void joinStudent(StudentConn studentConn) {
		//StudentConnList에 접속 학생의 StudentConn을 등록
		studentConnList.add(studentConn);
		
		//Eclipse의 Project Explorer의 정보 전달
		sendToLessonPage.sendToLessonPage("initProjectExplorer", 
				"projectExplorer", currentLessonPage.getProjectExplorerList());
		
		//활성화 Editor의 파일Path 및 파일내용 정보 전달
		sendToLessonPage.sendToLessonPage("initActivatedEditor", 
				"nowPath", currentLessonPage.getNowPath(), 
				"nowCode", currentLessonPage.getNowCode());
		sendStudentList();
	}
	
	/**
	 * 강의의 참여한 학생의 정보를 선생님 페이지에 전송
	 */
	public void sendStudentList() {
		//VO를 JSON형식으로 보낼 수 있도록 변환 (List<StudentConn> -> List<Map<String, String>>)
		List<Map<String, String>> tempStudentConnList = new ArrayList<>();
		for(StudentConn s : studentConnList) {
			Map<String, String> temp = new HashMap<>();
			temp.put("id", s.getId());
			temp.put("ip", s.getIp());
			tempStudentConnList.add(temp);
		}
		
		//client에게 보낼 실행 결과 객체 생성
		Map<String, Object> sendMap = new HashMap<>();
		sendMap.put("action", "studentListUpdate");
		sendMap.put("data", tempStudentConnList);
		
		//JSON String으로 변환
		JSONObject jsonObject = new JSONObject(sendMap);
		String JSONStringSendMessage = jsonObject.toJSONString();
		byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
		
		//선생님 페이지에 강의를 참여한 학생의 정보를 전송
		try {
			teacherConn.getSession().sendMessage(new TextMessage(sendMessageByteArray));
			sendToLessonPage.sendToLessonPage("studentListUpdate", "data", tempStudentConnList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public TeacherConn getTeacherConn() {
		return teacherConn;
	}

	public List<StudentConn> getStudentConnList() {
		return studentConnList;
	}

	public SendChatMessage getSendChatMessage() {
		return sendChatMessage;
	}

	/**
	 * socket이 강제 종료되었을 경우 실행
	 */
	private void connClose() {
		
		try {
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
