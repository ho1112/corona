package com.sesoc.cl.threadForStudentEclipse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

/**
 * 선생님의 웹 페이지에 정보를 전송하기 위한 클래스
 * @author LSY
 */
public class SendToStudentEclipsePage {
	
	private WebSocketSession teacherSession;
	
	/**
	 * 선생님의 웹 페이지 정보 전송 클래스의 생성자
	 * @param teacherSession 전송 해야 할 선생님 웹 페이지과 연결되있는 WebSocketSession
	 */
	public SendToStudentEclipsePage(WebSocketSession teacherSession) {
		this.teacherSession = teacherSession;
	}
	
	/**
	 * 학생 Eclipse 접속 Thread에 접속 해 있는 선생님에게 정보를 전송 (전달 data 0개)
	 * @param action 명령 정보
	 * @return 전송에 성공하면 true, 실패하면 false
	 */
	public boolean sendToStudentEclipsePage(String action) {
		boolean result = false;
		
		//client에게 보낼 실행 결과 객체 생성
		Map<String, Object> sendMap = new HashMap<>();
		
		//client에게 보낼 실행 결과 설정
		sendMap.put("action", action);
		
		//JSON String으로 변환
		String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
//		byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
		
		//Client에게 정보를 전송
		try {
			teacherSession.sendMessage(new TextMessage(JSONStringSendMessage));
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 학생 Eclipse 접속 Thread에 접속 해 있는 선생님에게 정보를 전송 (전달 data 1개)
	 * @param action 명령 정보
	 * @param dataName 명령에 필요한 data의 이름 (key)
	 * @param data 명령에 필요한 data (value)
	 * @return 전송에 성공하면 true, 실패하면 false
	 */
	public boolean sendToStudentEclipsePage(String action, String dataName ,Object data) {
		boolean result = false;
		
		//client에게 보낼 실행 결과 객체 생성
		Map<String, Object> sendMap = new HashMap<>();
		
		//client에게 보낼 실행 결과 설정
		sendMap.put("action", action);
		sendMap.put(dataName, data);
		
		//JSON String으로 변환
		String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
//		byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
		
		//Client에게 정보를 전송
		try {
			teacherSession.sendMessage(new TextMessage(JSONStringSendMessage));
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 학생 Eclipse 접속 Thread에 접속 해 있는 선생님에게 정보를 전송 (전달 data 2개)
	 * @param action 명령 정보
	 * @param dataName1 명령에 필요한 data1의 이름 (key)
	 * @param data1 명령에 필요한 data1 (value)
	 * @param dataName2 명령에 필요한 data2의 이름 (key)
	 * @param data2 명령에 필요한 data2 (value)
	 * @return 전송에 성공하면 true, 실패하면 false
	 */
	public boolean sendToStudentEclipsePage(String action, String dataName1 ,Object data1, String dataName2, Object data2) {
		boolean result = false;
		
		//client에게 보낼 실행 결과 객체 생성
		Map<String, Object> sendMap = new HashMap<>();
		
		//client에게 보낼 실행 결과 설정
		sendMap.put("action", action);
		sendMap.put(dataName1, data1);
		sendMap.put(dataName2, data2);
		
		//JSON String으로 변환
		String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
//		byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
		
		//Client에게 정보를 전송
		try {
			teacherSession.sendMessage(new TextMessage(JSONStringSendMessage));
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
