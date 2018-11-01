package com.sesoc.cl.board;

import java.util.List;
import java.util.Map;



public interface Board_ReplyDAO {
	public List<Board_Reply> select(int boardnum);
	public int insert(Board_Reply reply);
	public int delete(int replynum);
	public int update(Board_Reply reply);
	public List<Integer> selectCount();
	public Board_Reply selectOne(int parent);
	public int maxOrder(int boardnum);
	public int updateorder(Map<String,Integer> map);
	public Board_Reply findOne(int parent);
}
