package com.sesoc.cl.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Submit;

@Repository
public class Task_SubmitRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	public String getNamebyUsers(String id) {
		Task_SubmitDAO dao = sqlSession.getMapper(Task_SubmitDAO.class);
		String student_Name = dao.getNamebyUsers(id);
		return student_Name;
	}
	
	public int insert_Submit(Task_Submit task_submit) {
		Task_SubmitDAO dao = sqlSession.getMapper(Task_SubmitDAO.class);
		int result = dao.insert_Submit(task_submit);
		return result;
	}
	
	
	public List<Task_Submit> select_submitList(Task task) {
		Task_SubmitDAO dao = sqlSession.getMapper(Task_SubmitDAO.class);
		List<Task_Submit> submit_list = dao.select_submitList(task);
		return submit_list;
	}
	
	
	public Task_Submit selectOne(Task_Submit task_Submit) {
		Task_SubmitDAO dao = sqlSession.getMapper(Task_SubmitDAO.class);
		Task_Submit selectedSubmit = dao.selectOne(task_Submit);
		return selectedSubmit;
	}
}
