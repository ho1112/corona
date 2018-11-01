package com.sesoc.cl.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.sesoc.cl.connInfo.LessonList;
import com.sesoc.cl.connInfo.StudentConn;
import com.sesoc.cl.threadForLesson.LessonThread;

/**
 * 강의 접속 시 학생 쪽 웹 소켓 핸들러 클래스
 * @author LSY
 */
public class StudentSideLessonWebSocketHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(StudentSideLessonWebSocketHandler.class);
	
	public StudentSideLessonWebSocketHandler() {
		logger.info("StudentSideLessonWebSocketHandler 시작");
	}
	
	/**
	 * 웹 소켓 접속 직후 실행
	 * @param session 클라이언트의 session 객체
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}
	
	/**
	 * 클라이언트에서 서버에 메세지를 보냈을 때 실행
	 * @param session 클라이언트의 session 객체
	 * @param textMessage 클라이언트가 보낸 메세지를 담은 객체
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage textMessage) {
		
		logger.info(session.getId() + "님이 메시지 전송");
		
		//클라이언트에서 보내온 메세지를 String으로 저장
		String message = textMessage.getPayload();
		
		//JSON으로 다시 parsing
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject) jsonParser.parse(message);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//action에 담겨있는 명령을 로딩
		String action = (String) jsonObject.get("action");
		//action에 담겨있는 명령에 따라 코드를 실행
		switch(action) {
		//client가 강의 참여 초기화를 요청했을 경우 실행
		case "init":
			//client에게 받은 id, ip, 반 번호, client의 session으로 StudentConn객체 생성 후 등록
			String id = (String) jsonObject.get("id");
			String ip = (String) jsonObject.get("ip");
			String classNum = (String) jsonObject.get("classNum");
			StudentConn tempStudentConn = new StudentConn(id, ip, classNum, session);
			
			//client에게 보낼 실행 결과 객체 생성
			Map<String, Object> sendMap = new HashMap<>();
			//client에게 보낼 실행 결과를 실패로 설정
			sendMap.put("action", "LessonJoinFail");
			
			//현재 진행되고 있는 클래스 Thread에서 학생이 입력한 반 번호를 탐색
			for(LessonThread l : LessonList.getLessonList()) {
				if(l.getTeacherConn().getclassNum().equals(classNum)) {
					//클래스 Thread의 참여메소드 실행
					l.joinStudent(tempStudentConn);
					logger.info("LessonJoinSuccess");
					//client에게 보낼 실행 결과를 성공으로 변경
					sendMap.replace("action", "LessonJoinSuccess");
					break;
				}
			}
			
			//JSON String으로 변환
			String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
//			byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
			
			//Client에게 강의 참여 결과를 전송
			try {
				session.sendMessage(new TextMessage(JSONStringSendMessage));
			} catch (IOException e) {
				e.printStackTrace();
			}
			break;
		case "chatMessage":
			String chatMessage = (String) jsonObject.get("chatMessage");
			for(LessonThread l : LessonList.getLessonList()) {
				for(StudentConn s : l.getStudentConnList()) {
					if(s.getSession().equals(session)) {
						l.getSendChatMessage().sendChatMessage(s.getId(), null, chatMessage);
						break;
					}
				}
			}
			break;
		}
	}
	
	/**
	 * 웹 소켓 종료 직후 실행
	 * @param session 클라이언트의 session 객체
	 * @param closeStatus 클라이언트의 종료 상태를 담은 객체
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		logger.info(session.getId() + "님 접속 종료 시도");
		
		//현재 진행되고 있는 클래스 Thread에서 접속 종료한 session을 가진 StudentConn객체를 탐색
		for(LessonThread l : LessonList.getLessonList()) {
			for(StudentConn t : l.getStudentConnList()) {
				if(t.getSession().equals(session)) {
					//클래스 Thread에서 해당하는 StudentConn객체를 삭제
					l.getStudentConnList().remove(t);
					l.sendStudentList();
					logger.info(session.getId() + "님 안전하게 접속 종료");
					return;
				}
			}
		}
		
		logger.info(session.getId() + "님 비정상 접속 종료");
	}
}