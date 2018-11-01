package com.sesoc.cl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.ClassCount;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.ClassUser;



@Repository
public class ClassRepository {
	@Autowired
	SqlSession sqlSession;
	
	public int createClass(ClassInfo createClass) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.createClass(createClass);
	}
	
	public List<ClassInfo> selectMyAll(String teacher_Id){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectMyAll(teacher_Id);
	}
	public List<ClassCount> selectCount(String teacher_Id){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectCount(teacher_Id);
	}
	public List<ClassCount> selectSearchCount(Map<String, Object> map){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectSearchCount(map);
	}
	
	public ClassInfo checkClassName(String name) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.checkClassName(name);
	}
	
	public List<ClassUser> selectUserAll(int class_num){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectUserAll(class_num);
	}
	public ClassInfo selectClassOne(int num) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectClassOne(num);
	}
	public int updateStatus(Map<String, Object> map) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.updateStatus(map);
	}
	public int deleteRetired(int num) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.deleteRetired(num);
	}
	public List<ClassInfo> selectSearch(Map<String, Object> map){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectSearch(map);
	}
	
	public List<ClassUser> selectMyRequestAll(String user_id){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectMyRequestAll(user_id);
	}
	
	//중복값 검사
	public ClassUser selectDuplicateCheckOne(ClassUser user) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectDuplicateCheckOne(user);
	}
	public int insertClassUser(ClassUser user) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.insertClassUser(user);
	}
	public List<ClassInfo> myStudentList(String id){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.myStudentList(id);
	}
	public List<ClassUser> selectRequestClassOne(int num){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		return dao.selectRequestClassOne(num);
	}
	public List<ClassInfo> myTeacherList(String id){
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		
		List<ClassInfo> result = dao.myTeacherList(id);
		
		return result;
	}
	public int changeClassState(int classNum, int state) {
		ClassInfoDao dao = sqlSession.getMapper(ClassInfoDao.class);
		Map<String, Integer> tempMap = new HashMap<>();
		tempMap.put("classNum", classNum);
		tempMap.put("state", state);
		return dao.changeClassState(tempMap);
	}
}
