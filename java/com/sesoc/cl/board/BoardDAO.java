package com.sesoc.cl.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.cl.drive.Drive;


public interface BoardDAO {

	public List<Board> select(Map<String,Object> search, RowBounds rb);
	public int insert(Board board);
	public int delete(int num);
	public int update(Board board);
	public Board selectOne(int boardnum);
	public int getBoardCount(Map<String,Object> map);
	public int updateHits(int boardnum);
	public int replyUpdate(Map<String,Integer> map);
	
	public int seq();
	public int insert_file(Board_File bf);
	public List<Board_File> selectBoard_fileAll(int board_num);
	public int deleteFile(int fileNum);
	public Board_File selectFileOne(int num);
	
	//임시 로그인용
	public String login(Map<String,String> map);
	
}
