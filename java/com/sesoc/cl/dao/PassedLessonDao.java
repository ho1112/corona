package com.sesoc.cl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.cl.vo.SavedLessonInfo;

public interface PassedLessonDao {

	public int saveLesson(SavedLessonInfo savedLessonInfo);

	public List<SavedLessonInfo> loadSavedLesson(Map<String,Object> getMap, RowBounds rb);

	public int getPassedLessonCount(Map<String,Object> getMap);
	
}