package com.sesoc.cl.dao;

import java.util.List;
import java.util.Map;

import com.sesoc.cl.vo.ClassCount;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.ClassUser;


public interface ClassInfoDao {
	public int createClass(ClassInfo createClass);
	public ClassInfo checkClassName(String name);
	public List<ClassInfo> selectMyAll(String teacher_id);
	public List<ClassCount> selectCount(String teacher_id);
	public List<ClassCount> selectSearchCount(Map<String, Object> map);
	public List<ClassUser> selectUserAll(int class_num);
	public ClassInfo selectClassOne(int num);
	public int updateStatus(Map<String, Object> map);
	public int deleteRetired(int num);
	public List<ClassInfo> selectSearch(Map<String, Object> map);
	public List<ClassUser> selectMyRequestAll(String user_id);
	public ClassUser selectDuplicateCheckOne(ClassUser user);
	public int insertClassUser(ClassUser user);
	public List<ClassInfo> myStudentList(String id);
	public List<ClassUser> selectRequestClassOne(int num);
	public List<ClassInfo> myTeacherList(String id);
	public int changeClassState(Map<String, Integer> map);
}
