package com.sesoc.cl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Board_ReplyRepository {
	@Autowired
	SqlSession sqlSession;
	
	public List<Board_Reply> select(int boardnum){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		return dao.select(boardnum);
	}
	
	public Board_Reply selectOne(int parent){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		return dao.selectOne(parent);
	}
	
	public int maxOrder(int boardnum){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		return dao.maxOrder(boardnum);
	}
	
	public int insert(Board_Reply reply){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		int result = dao.insert(reply);
		return result;
	}
	
	public int update(Board_Reply reply){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		int result = dao.update(reply);
		return result;
	}
	
	public int delete(int replynum){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		int result = dao.delete(replynum);
		return result;
	}
	
	public List<Integer> selectCount(){
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		List<Integer> result = dao.selectCount();
		return result;
	}

	public int updateorder(int board_num, int reorder) {
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num); map.put("reorder", reorder);
		return dao.updateorder(map);
	}

	public Board_Reply findOne(int parent) {
		Board_ReplyDAO dao = sqlSession.getMapper(Board_ReplyDAO.class);
		return dao.findOne(parent);
	}
	
	
	
}
