package com.sesoc.cl.threadForLesson;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.sesoc.cl.connInfo.StudentConn;

/**
 * 현재 접속하고 있는 학생들의 웹 페이지에 정보를 전송하기 위한 클래스
 * @author LSY
 */
public class SendToLessonPage {
	
	private List<StudentConn> studentConnList;
	
	/**
	 * 웹 페이지에 정보 전송 클래스의 생성자, 클래스 Thread에 참가하고 있는 StudentConnList를 로딩
	 * @param studentConnList 클래스 Thread 객체
	 */
	public SendToLessonPage(List<StudentConn> studentConnList) {
		this.studentConnList = studentConnList;
	}
	
	/**
	 * 클래스 Thread에 접속 해 있는 학생들에게 정보를 전송 (전달 data 1개)
	 * @param action 명령 정보
	 * @param dataName 명령에 필요한 data의 이름 (key)
	 * @param data 명령에 필요한 data (value)
	 * @return 전송에 성공하면 true, 실패하면 false
	 */
	public boolean sendToLessonPage(String action) {
		boolean result = false;
		
		//접속해 있는 모든 StudentConn에 대해 작업 수행
		for(StudentConn s : studentConnList) {
			//StudentConn이 가지고 있는 웹 소켓 session 로딩
			WebSocketSession tempSession = s.getSession();
			
			//client에게 보낼 실행 결과 객체 생성
			Map<String, Object> sendMap = new HashMap<>();
			
			//client에게 보낼 실행 결과 설정
			sendMap.put("action", action);
			
			//JSON String으로 변환
			String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
			
			//Client에게 정보를 전송
			try {
				tempSession.sendMessage(new TextMessage(JSONStringSendMessage));
				result = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 클래스 Thread에 접속 해 있는 학생들에게 정보를 전송 (전달 data 1개)
	 * @param action 명령 정보
	 * @param dataName 명령에 필요한 data의 이름 (key)
	 * @param data 명령에 필요한 data (value)
	 * @return 전송에 성공하면 true, 실패하면 false
	 */
	public boolean sendToLessonPage(String action, String dataName ,Object data) {
		boolean result = false;
		
		//접속해 있는 모든 StudentConn에 대해 작업 수행
		for(StudentConn s : studentConnList) {
			//StudentConn이 가지고 있는 웹 소켓 session 로딩
			WebSocketSession tempSession = s.getSession();
			
			//client에게 보낼 실행 결과 객체 생성
			Map<String, Object> sendMap = new HashMap<>();
			
			//client에게 보낼 실행 결과 설정
			sendMap.put("action", action);
			sendMap.put(dataName, data);
			
			//JSON String으로 변환
			String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
			
			//Client에게 정보를 전송
			try {
				tempSession.sendMessage(new TextMessage(JSONStringSendMessage));
				result = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 클래스 Thread에 접속 해 있는 학생들에게 정보를 전송 (전달 data 2개)
	 * @param action 명령 정보
	 * @param dataName1 명령에 필요한 data1의 이름 (key)
	 * @param data1 명령에 필요한 data1 (value)
	 * @param dataName2 명령에 필요한 data2의 이름 (key)
	 * @param data2 명령에 필요한 data2 (value)
	 * @return 전송에 성공하면 true, 실패하면 false
	 */
	public boolean sendToLessonPage(String action, String dataName1 ,Object data1, String dataName2, Object data2) {
		boolean result = false;
		
		//접속해 있는 모든 StudentConn에 대해 작업 수행
		for(StudentConn s : studentConnList) {
			//StudentConn이 가지고 있는 웹 소켓 session 로딩
			WebSocketSession tempSession = s.getSession();
			
			//client에게 보낼 실행 결과 객체 생성
			Map<String, Object> sendMap = new HashMap<>();
			
			//client에게 보낼 실행 결과 설정
			sendMap.put("action", action);
			sendMap.put(dataName1, data1);
			sendMap.put(dataName2, data2);
			
			//JSON String으로 변환
			String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
//			byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
			
			//Client에게 정보를 전송
			try {
				tempSession.sendMessage(new TextMessage(JSONStringSendMessage));
				result = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
