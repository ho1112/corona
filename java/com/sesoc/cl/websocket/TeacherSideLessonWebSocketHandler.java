package com.sesoc.cl.websocket;

import java.io.IOException;
import java.net.Socket;
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
import com.sesoc.cl.connInfo.StudentEclipseThreadList;
import com.sesoc.cl.connInfo.TeacherConn;
import com.sesoc.cl.connInfo.TeacherConnList;
import com.sesoc.cl.threadForLesson.LessonThread;
import com.sesoc.cl.threadForStudentEclipse.StudentEclipseThread;

/**
 * 강의 접속 시 선생님 쪽 웹 소켓 핸들러 클래스
 * @author LSY
 */
public class TeacherSideLessonWebSocketHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(TeacherSideLessonWebSocketHandler.class);
	
	public TeacherSideLessonWebSocketHandler() {
		logger.info("TeacherSideLessonWebSocketHandler 시작");
	}
	
	/**
	 * Eclipse와 접속 후 실행, 클래스 Thread를 생성 및 실행
	 * @param conn Eclipse로 접속 한 선생님의 정보와 socket을 담고 있는 TeacherConn 객체
	 * @throws Exception
	 */
	public static void startLesson(TeacherConn conn) throws Exception {
		//TeacherConn이 가지고 있는 웹소켓 session 객체를 로딩
		WebSocketSession session = conn.getSession();
		
		//client에게 보낼 실행 결과 객체 생성
		Map<String, Object> sendMap = new HashMap<>();
		
		//client에게 보낼 실행 결과 설정
		sendMap.put("action", "eclipseConnSuccess");
		
		//JSON String으로 변환
		String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
		
		//Client에게 강의 참여 결과를 전송
		session.sendMessage(new TextMessage(JSONStringSendMessage));
		
		//클래스 Thread 생성 및 Thread에 돌릴 LessonThread객체를 LessionList에 저장
		LessonThread lessonThread = new LessonThread(conn);
		Thread thread = new Thread(lessonThread);
		LessonList.getLessonList().add(lessonThread);
		
		//클래스 Thread 실행
		thread.start();
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
			e.printStackTrace();
		}
		
		//action에 담겨있는 명령을 로딩
		String action = (String) jsonObject.get("action");
		//action에 담겨있는 명령에 따라 코드를 실행
		switch(action) {
		//client가 강의 시작 초기화를 요청했을 경우 실행
		case "init":
			//client에게 받은 ip를 저장
			String teacherIp = (String) jsonObject.get("ip");
			//TeacherConnList에서 같은 ip를 가진 TeacherConn객체를 탐색
			for(TeacherConn t : TeacherConnList.getList()) {
				if(t.getIp().equals(teacherIp)) {
					//TeacherConn객체를 찾으면 현재 웹 소켓 session을 TeacherConn객체에 등록
					t.setSession(session);
					
					//client에게 보낼 실행 결과 객체 생성
					Map<String, Object> sendMap = new HashMap<>();
					//client에게 보낼 실행 결과를 성공으로 설정
					sendMap.put("action", "initSuccess");
					
					//JSON String으로 변환
					String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
//					byte[] sendMessageByteArray = JSONStringSendMessage.getBytes();
					
					//Client에게 강의 참여 결과를 전송
					try {
						session.sendMessage(new TextMessage(JSONStringSendMessage));
					} catch (IOException e) {
						e.printStackTrace();
					}
					break;
				}
			}
			break;
		case "join":
			//client에게 보낼 실행 결과 객체 생성
			Map<String, Object> sendMap = new HashMap<>();
			//client에게 보낼 실행 결과 설정
			sendMap.put("action", "eclipseConnSuccess");
			//JSON String으로 변환
			String JSONStringSendMessage = JSONObject.toJSONString(sendMap);
			//Client에게 강의 참여 결과를 전송
			try {
				session.sendMessage(new TextMessage(JSONStringSendMessage));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//client에게 받은 ip를 저장
			String teacherId = (String) jsonObject.get("id");
			for(LessonThread lt : LessonList.getLessonList()) {
				if(lt.getTeacherConn().getId().equals(teacherId)) {
					lt.getTeacherConn().setSession(session);
					lt.sendStudentList();
					break;
				}
			}
			
			break;
		//학생의 eclipse에 접속 요청을 하였을 경우 실행
		case "viewStudentEclipse":
			//접속하려는 학생의 ip를 저장
			String studentIp = (String) jsonObject.get("ip");
			int serverPort = 8891;
			Socket socket = null;
			try {
				socket = new Socket(studentIp, serverPort);
			} catch (IOException e) {
//				e.printStackTrace();
				logger.error("접속실패!");
			}
			if(socket == null || !socket.isConnected()) {
				return;
			}
			
			//학생 eclipse확인 용 thread실행
			for(LessonThread l : LessonList.getLessonList()) {
				if(l.getTeacherConn().getSession().equals(session)) {
					//학생 Eclipse 접속 Thread 생성 및 Thread에 돌릴 StudentEclipseThread객체를 StudentEclipseThreadList에 저장
					//접속하려는 학생의 ip와 현재 요청 한 선생님의 정보를 매개 변수로 하여 생성
					StudentEclipseThread studentEclipseThread = new StudentEclipseThread(l.getTeacherConn(), socket);
					Thread thread = new Thread(studentEclipseThread);
					StudentEclipseThreadList.getStudentEclipseList().add(studentEclipseThread);
					
					//클래스 Thread 실행
					thread.start();
				}
			}
			break;
		case "closeStudentEclipse":
			for(StudentEclipseThread s : StudentEclipseThreadList.getStudentEclipseList()) {
				if(s.getTeacherConn().getSession().equals(session)) {
					s.requestDisconnect();
					break;
				}
			}
			break;
		case "chatMessage":
			String chatMessage = (String) jsonObject.get("chatMessage");
			for(LessonThread l : LessonList.getLessonList()) {
				if(l.getTeacherConn().getSession().equals(session)) {
					l.getSendChatMessage().sendChatMessage(l.getTeacherConn().getId(), null, chatMessage);
					break;
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
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + "님 접속 종료");
	}
}
