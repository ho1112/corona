package com.sesoc.cl.threadForLesson;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.sesoc.cl.connInfo.StudentConn;
import com.sesoc.cl.connInfo.TeacherConn;
import com.sesoc.cl.forLessonSave.LessonSave;

public class SendChatMessage {
	private List<StudentConn> studentConnList;
	private TeacherConn teacherConn;
	private List<Map<String, String>> chatHistory; 
	private LessonSave lessonSave;
	
	/**
	 * 웹 페이지에 정보 전송 클래스의 생성자, 클래스 Thread에 참가하고 있는 StudentConnList를 로딩
	 */
	public SendChatMessage(TeacherConn teacherConn, List<StudentConn> studentConnList,
			List<Map<String, String>> chatHistory, LessonSave lessonSave) {
		this.teacherConn = teacherConn;
		this.studentConnList = studentConnList;
		this.chatHistory = chatHistory;
		this.lessonSave = lessonSave;
	}

	public boolean sendChatMessage(String from, String to, String message) {
		boolean result = false;
		
		//client에게 보낼 실행 결과 객체 생성
		Map<String, Object> sendMap = new HashMap<>();
		
		if(to == null) {
			//client에게 보낼 실행 결과 설정
			sendMap.put("action", "chatMessage");
			sendMap.put("from", from);
			sendMap.put("chatMessage", message);
			
			Map<String, String> tempMap = new HashMap<String, String>();
			tempMap.put("from", from);
			tempMap.put("chatMessage", message);
			chatHistory.add(tempMap);
			
			lessonSave.savePart("chatMessage", chatHistory);
		} else {
			sendMap.put("to", to);
		}
		
		//JSON String으로 변환
		String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
		
		//접속해 있는 모든 StudentConn에 대해 작업 수행
		for(StudentConn s : studentConnList) {
			//StudentConn이 가지고 있는 웹 소켓 session 로딩
			WebSocketSession tempSession = s.getSession();
			
			//Client에게 정보를 전송
			try {
				tempSession.sendMessage(new TextMessage(JSONStringSendMessage));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			teacherConn.getSession().sendMessage(new TextMessage(JSONStringSendMessage));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		result = true;
		return result;
	}
}
