package com.sesoc.cl.board;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class Board_ReplyController {

	@Autowired
	Board_ReplyRepository repo;
	
	@Autowired
	BoardRepository br;
	
	@ResponseBody
	@RequestMapping(value="/replyWrite", method=RequestMethod.POST)
	public void replyWrite(Board_Reply reply, HttpSession session){
		System.out.println("리플작성 컨트롤러");
		String id = (String) session.getAttribute("loginId");
		reply.setUser_id(id);
		System.out.println(id);
		if(reply.getParent() != 0){ //답글일 경우
			//답글이 하나도 안달렸을 경우
			Board_Reply replyInfo = repo.selectOne(reply.getParent());//부모 댓글의 마지막 답글 정보를 가져온다
			if(replyInfo == null){
				replyInfo = repo.findOne(reply.getParent());
			}
			System.out.println("1");
			reply.setDepth(replyInfo.getDepth()+20); //답글은 +20
			reply.setReorder(replyInfo.getReorder() +1); //부모댓글 order에 +1        현재 reorder가 다 0으로 들어감
			repo.updateorder(reply.getBoard_num(), replyInfo.getReorder()); // 답글 밑 댓글들의 order +1씩
			repo.insert(reply);
			br.replyUpdate(reply.getBoard_num(), 1);
		}else{ //그냥 댓글일 경우
			int maxOrder = repo.maxOrder(reply.getBoard_num()); //현재 reorder에 +1 한 결과를 가져옴
			reply.setReorder(maxOrder);
			System.out.println("else"+reply);
			repo.insert(reply);
			br.replyUpdate(reply.getBoard_num(), 1); // 댓글 카운트 추가
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/replyUpdate")
	public void replyUpdate(Board_Reply reply, HttpSession session, RedirectAttributes ra){
		repo.update(reply);
	}
	
	@ResponseBody
	@RequestMapping("/replyDelete")
	public void replyDelete(int rnum,int bnum){
		repo.delete(rnum);
		br.replyUpdate(bnum, -1);
	}
	
	@ResponseBody
	@RequestMapping("/replyList")
	public List<Board_Reply> replyList(int board_num){
		List<Board_Reply> list = repo.select(board_num);
		return list;
	}
	
}
