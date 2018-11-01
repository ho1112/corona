package com.sesoc.cl.socket;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.sesoc.cl.connInfo.TeacherConn;
import com.sesoc.cl.connInfo.TeacherConnList;
import com.sesoc.cl.websocket.TeacherSideLessonWebSocketHandler;

/**
 * 선생님 Eclipse와 연결 할 Server Socket을 생성하는 class 
 * @author LSY
 */
@Service
public class LessonMainSocket {
	
	private static final Logger logger = LoggerFactory.getLogger(LessonMainSocket.class);
	
	private int PORT_NUMBER = 8889;
	private ServerSocket serverSocket;
	private Socket socket;
	private TeacherConn teacherConn;
	private boolean repeat;
	
	/**
	 * Eclipse와 통신 할 서버 소켓을 생성
	 */
	@Async
	public void createServerSocket(TeacherConn teacherConn) {
		logger.info("teacherConn: " + this.teacherConn);
		this.teacherConn = teacherConn;
		repeat = true;
		
		while(repeat) {
			try {
				//서버 소켓 생성
				logger.info("ServerSocekt 생성 시작");
				serverSocket = new ServerSocket(PORT_NUMBER);
				serverSocket.setReuseAddress(true);
				logger.info("응답을 기다리고 있습니다.");
				//Eclipse가 서버소켓이 열린 후 2분간 접속이 없으면 자동으로 소켓 닫힘 설정
//				serverSocket.setSoTimeout(1000 * 60 * 2);
				
				//Eclipse의 소켓 연결 대기
				socket = serverSocket.accept();
				serverSocket.close();
				
				//연결된 Eclipse의 ip를 로딩
				String hostAddress = socket.getInetAddress().getHostAddress();
				logger.info(hostAddress + "에 연결되었습니다.");
				
				boolean isEmpty = true;
				
				if(this.teacherConn.getIp().equals(hostAddress)) {
					//찾았으면 선생님의 정보를 담은 VO에 socket 주소 저장
					this.teacherConn.setSocket(socket);
					logger.info("socket 등록이 완료 되었습니다.");
					try {
						//클래스 Thread 생성
						TeacherSideLessonWebSocketHandler.startLesson(this.teacherConn);
						
						//조건 초기화
						isEmpty = false;
						repeat = false;
						serverSocket = null;
						this.teacherConn = null;
						socket = null;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				//접속 한 선생님들 중 같은 ip를 가진 선생님을 못 찾았을 경우 실행
				if(isEmpty) {
					socket.close();
					logger.info("로그인 하지 않은 선생님 IP입니다.");
				}
			} 
			//서버 소켓의 접속 대기 시간을 초과하였을 경우
			catch (SocketTimeoutException e) {
//					e.printStackTrace();
				repeat = false;
				logger.info("시간초과, 서버소켓을 닫습니다.");
			} catch (SocketException e) {
				System.out.println(e.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int cancelLesson() {
		int result = -1;
		if(serverSocket == null || serverSocket.isClosed()) {
			result = 0;
		} else {
			repeat = false;
			try {
				serverSocket.close();
				TeacherConnList.getList().remove(teacherConn);
				teacherConn = null;
				logger.info("반 생성을 취소합니다.");
				result = 1;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public TeacherConn getTeacherConn() {
		return teacherConn;
	}

}