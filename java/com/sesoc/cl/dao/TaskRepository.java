package com.sesoc.cl.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Answer;
import com.sesoc.cl.vo.Task_Submit;

@Repository
public class TaskRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertTask(Task task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.insertTask(task);
		return result;
	}
	
	
	public List<Task> selectAll(String searchword, int startRecord,int countPerPage,int class_num) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String,Object> getMap = new HashMap<String, Object>();
		getMap.put("searchword", searchword);
		getMap.put("class_num", class_num);
		List<Task> taskList = dao.selectAll(getMap, rb);
		return taskList;
	}
	
	public Task selectOne(Task task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		Task selectedTask = dao.selectOne(task);
		return selectedTask;
	}
	
	public int closed_work() {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.closed_work();
		return result;
	}
	
	public Task recent_task() {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		Task selectedTask = dao.recent_task();
		return selectedTask;
	}

	public int insertAnswer(Task_Answer task_answer) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		int result = dao.insertAnswer(task_answer);
		return result;
	}
	
	public List<Task_Answer> io_receive(int task_num) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		List<Task_Answer> selectedAnswer = dao.io_receive(task_num);
		return selectedAnswer;
	}
	
	public List<Task> submittedTask(Task_Submit task_Submit) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		List<Task> submittedTast = dao.submittedTask(task_Submit);
		return submittedTast;
	}
	
	public int deleteTask(Task task) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		return dao.deleteTask(task);
	}


	public int getTaskCount(String searchword, int classNum) {
		TaskDAO dao = sqlSession.getMapper(TaskDAO.class);
		Map<String,Object> getMap = new HashMap<String, Object>();
		getMap.put("searchword", searchword);
		getMap.put("class_num", classNum);	
		return dao.getTaskCount(getMap);
	}
}
