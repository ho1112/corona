package com.sesoc.cl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Answer;
import com.sesoc.cl.vo.Task_Submit;

public interface TaskDAO {
	
	public int insertTask(Task task);
	public List<Task> selectAll(Map<String,Object> getMap, RowBounds rb);
	public Task selectOne(Task task);
	public int closed_work();
	public Task recent_task();
	public int insertAnswer(Task_Answer task_answer);
	public List<Task_Answer> io_receive(int task_num);
	public List<Task> submittedTask(Task_Submit task_Submit);
	public int deleteTask(Task task);
	public int getTaskCount(Map<String, Object> getMap);
}
