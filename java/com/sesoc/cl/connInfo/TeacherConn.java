package com.sesoc.cl.connInfo;

import java.net.Socket;

import org.springframework.web.socket.WebSocketSession;

/**
 * 선생님 정보를 담고 있는 VO
 * @author LSY
 */
public class TeacherConn {
	private String classNum;
	private String title;
	private String id;
	private String ip;
	private Socket socket;
	private WebSocketSession session;
	
	public TeacherConn() {
		super();
	}
	
	public TeacherConn(String num, String title, String id, String ip) {
		super();
		this.classNum = num;
		this.title = title;
		this.id = id;
		this.ip = ip;
	}

	public String getclassNum() {
		return classNum;
	}
	public void setclassNum(String classNum) {
		this.classNum = classNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Socket getSocket() {
		return socket;
	}
	public void setSocket(Socket socket) {
		this.socket = socket;
	}
	public WebSocketSession getSession() {
		return session;
	}
	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	@Override
	public String toString() {
		return "TeacherConn [classNum=" + classNum + ", title=" + title + ", id=" + id + ", ip=" + ip + ", socket="
				+ socket + ", session=" + session + "]";
	}

}
