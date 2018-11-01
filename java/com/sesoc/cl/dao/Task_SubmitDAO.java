package com.sesoc.cl.dao;

import java.util.List;

import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Submit;

public interface Task_SubmitDAO {
	
	public String getNamebyUsers(String id);
	public int insert_Submit(Task_Submit task_submit);
	public List<Task_Submit> select_submitList(Task task);
	public Task_Submit selectOne(Task_Submit task_submit);

}
