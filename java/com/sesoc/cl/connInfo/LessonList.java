package com.sesoc.cl.connInfo;

import java.util.ArrayList;
import java.util.List;

import com.sesoc.cl.threadForLesson.LessonThread;

/**
 * 진행되고 있는 강의의 정보를 담고있는 List
 * @author LSY
 */
public class LessonList {
	private static List<LessonThread> lessonList = new ArrayList<>();

	public LessonList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static List<LessonThread> getLessonList() {
		return lessonList;
	}

	public static void setLessonList(List<LessonThread> lessonList) {
		LessonList.lessonList = lessonList;
	}

}