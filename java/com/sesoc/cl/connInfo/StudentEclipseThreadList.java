package com.sesoc.cl.connInfo;

import java.util.ArrayList;
import java.util.List;

import com.sesoc.cl.threadForStudentEclipse.StudentEclipseThread;

/**
 * 진행되고 있는 학생 Eclipse 접속 정보를 담고있는 List
 * @author LSY
 */
public class StudentEclipseThreadList {
	private static List<StudentEclipseThread> StudentEclipseList = new ArrayList<>();
	
	public StudentEclipseThreadList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static List<StudentEclipseThread> getStudentEclipseList() {
		return StudentEclipseList;
	}

	public static void setStudentEclipseList(List<StudentEclipseThread> studentEclipseList) {
		StudentEclipseList = studentEclipseList;
	}
	
}
