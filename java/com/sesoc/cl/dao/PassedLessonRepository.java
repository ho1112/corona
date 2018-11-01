package com.sesoc.cl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.SavedLessonInfo;

@Repository
public class PassedLessonRepository {

	@Autowired
	SqlSession sqlSession;
	
	public int saveLesson(SavedLessonInfo savedLessonInfo) {
		PassedLessonDao dao = sqlSession.getMapper(PassedLessonDao.class);
		return dao.saveLesson(savedLessonInfo);
	}

	public List<SavedLessonInfo> loadSavedLesson(String searchword, int startRecord,int countPerPage, int classNum) {
		PassedLessonDao dao = sqlSession.getMapper(PassedLessonDao.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String,Object> getMap = new HashMap<String, Object>();
		getMap.put("searchword", searchword);
		getMap.put("class_num", classNum);
		return dao.loadSavedLesson(getMap,rb);
	}

	public int getPassedLessonCount(String searchword, int classNum) {
		PassedLessonDao dao = sqlSession.getMapper(PassedLessonDao.class);
		Map<String,Object> getMap = new HashMap<String, Object>();
		getMap.put("searchword", searchword);
		getMap.put("class_num", classNum);
		return dao.getPassedLessonCount(getMap);
	}
	
}