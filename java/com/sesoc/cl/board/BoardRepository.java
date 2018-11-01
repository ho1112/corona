
package com.sesoc.cl.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.cl.drive.Drive;
import com.sesoc.cl.drive.DriveDAO;


@Repository
public class BoardRepository {

	@Autowired
	SqlSession sqlSession;
	
	public String login(String id, String pw){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_id", id); map.put("password", pw);
		return dao.login(map);
	}
	
	public List<Board> findAll (String searchtype,String searchword,int startRecord,int countPerPage,int classNum) {
		List<Board> boardList = new ArrayList<Board>();
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		Map<String,Object> search = new HashMap<String, Object>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		search.put("classNum", classNum);
		boardList = dao.select(search,rb);
		return boardList;
	}
	
	public Board findOne(int boardnum){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.selectOne(boardnum);
	}
	

	public int insertBoard(Board board) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.insert(board);
	}

	public int updateBoard(Board board) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		System.out.println(board);
		return dao.update(board);
	}

	public int updateHits(int boardnum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.updateHits(boardnum);
	}
	
	public int deleteForm(int boardnum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.delete(boardnum);
	}
	
	public int replyUpdate(int num, int amount){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num); map.put("amount", amount);
		return dao.replyUpdate(map);
	}
	
	//전체 글 개수
	public int getBoardCount(String searchtype,String searchword,int classNum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		Map<String,Object> search = new HashMap<String,Object>();
		search.put("searchtype", searchtype);
		search.put("searchword", searchword);
		search.put("classNum", classNum);
		return dao.getBoardCount(search);
	}
	
	//다중파일 업로드
	public int insert_file(Board_File bf) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.insert_file(bf);
	}
	
	public int seq() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.seq();
	}
	
	//업로드 된 파일 리스트 가져오기
	public List<Board_File> selectBoard_fileAll(int board_num){
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.selectBoard_fileAll(board_num);
	}
	
	public int deleteFile(int fileNum) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.deleteFile(fileNum);
	}

	public Board_File selectFileOne(int num) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.selectFileOne(num);
	}
	
}
