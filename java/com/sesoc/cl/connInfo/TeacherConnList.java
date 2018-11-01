package com.sesoc.cl.connInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * 현재 접속 선생님의 정보를 담고있는 List
 * @author LSY
 */
public class TeacherConnList {
	private static List<TeacherConn> List = new ArrayList<>();

	public TeacherConnList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static List<TeacherConn> getList() {
		return List;
	}

	public static void setList(List<TeacherConn> list) {
		List = list;
	}

}
