package com.sesoc.cl.connInfo;

import org.springframework.web.socket.WebSocketSession;

/**
 * 학생의 정보를 담고있는 VO
 * @author LSY
 */
public class StudentConn {
	private String id;
	private String ip;
	private String classNum;
	private WebSocketSession session;
	
	public StudentConn() {
		super();
	}
	
	public StudentConn(String id, String ip, String classNum, WebSocketSession session) {
		super();
		this.id = id;
		this.ip = ip;
		this.classNum = classNum;
		this.session = session;
	}

	public String getClassNum() {
		return classNum;
	}
	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public WebSocketSession getSession() {
		return session;
	}
	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	@Override
	public String toString() {
		return "StudentConn [id=" + id + ", ip=" + ip + ", classNum=" + classNum + ", session=" + session + "]";
	}

}
