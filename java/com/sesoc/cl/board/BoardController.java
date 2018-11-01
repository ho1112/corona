package com.sesoc.cl.board;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.drive.CheckOriginalFileNames;
import com.sesoc.cl.drive.Drive;
import com.sesoc.cl.drive.MultiFiles;
import com.sesoc.cl.util.FileService;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.Users;



@Controller
public class BoardController {
	
	@Autowired
	BoardRepository repo;
	
	@Autowired
	Board_ReplyRepository rr;
	
	@Autowired
	UsersRepository ur;
	
	@Autowired
	ClassRepository cRepo;
	
	final String uploadPath = "/boardfile";
	
	
	@RequestMapping(value="/boardList")
	public String boardList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="searchtype", defaultValue="title") String searchtype,
			@RequestParam(value="searchword",defaultValue="") String searchword,
			@RequestParam(value="countpage", defaultValue="10") int countPerPage,
			Model model, HttpServletRequest request, String status, int classNum) {
		this.listCome(model, request);
		//전체 글 개수
		int totalRecordCount = repo.getBoardCount(searchtype,searchword, classNum);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		//게시글 리스트 호출
		List<Board> boardList = repo.findAll(searchtype,searchword,navi.getStartRecord(),navi.getCountPerPage(),classNum);
		//게시글 이미지 파일 호출
		List<List<Board_File>> bfList = new ArrayList<>();
		List<Board_File> Filelist = new ArrayList<>();
		for(Board b :boardList){
			Filelist = repo.selectBoard_fileAll(b.getNum());
			bfList.add(Filelist);
		}
		
		model.addAttribute("classNum",classNum);
		model.addAttribute("navi",navi);
		model.addAttribute("boardList",boardList);
		model.addAttribute("bfList", bfList);
		model.addAttribute("countPerPage",countPerPage);
		model.addAttribute("searchword",searchword);
		model.addAttribute("searchtype",searchtype);
		return "boardList";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(int num, Model model, HttpServletRequest request, String status,int classNum){
		this.listCome(model, request);
		System.out.println("detail");
		Board board = repo.findOne(num);
		repo.updateHits(num); //조회수 업데이트
		
		List<Board_File> list = repo.selectBoard_fileAll(num);
		//작성자의 프로필 사진 가져오기
		String id = board.getUser_id();
		Users u = new Users();
		u.setId(id);
		u =ur.selectOne(u);
		String userImg = u.getImg_name();
		
		model.addAttribute("userImg",userImg);
		model.addAttribute("list", list);
		model.addAttribute("board",board);
		model.addAttribute("classNum",classNum);
		return "boardDetail";
	}
	
	@RequestMapping("/boardWrite")
	public String boardWrite(int classNum, Model model, HttpServletRequest request){
		this.listCome(model, request);
		model.addAttribute("classNum",classNum);
		return "boardWrite";
	}
	
	@RequestMapping(value = "/boardWrite", method=RequestMethod.POST)
	public String boardWrite(Board board,Model model, HttpServletRequest request, HttpSession session,
			MultipartFile file1, MultiFiles multiFiles, int classNum,RedirectAttributes ra)
	{this.listCome(model, request);
		System.out.println("글쓰기 컨트롤러 / "+classNum);
		if(file1 != null){
			String on = file1.getOriginalFilename();
			MultipartFile f[] = multiFiles.getFile1();
			for(int i=0;i<f.length;i++){
				String sub = f[i].getOriginalFilename().substring(f[i].getOriginalFilename().length()-3);
				if(!(sub.equals("jpg") || sub.equals("png") || sub.equals("gif"))){
					model.addAttribute("message","이미지파일만 업로드 해주세요.");
					return "imgCheckMessage";
				}
			}
		}//end if 이미지파일 검사
		
		String user_id = (String) session.getAttribute("loginId");
		board.setUser_id(user_id);
		int seq = repo.seq();
		//class_num 입력
		board.setClass_num(classNum);
		board.setNum(seq);
		//보드DB에 게시글 정보만 저장
		int i = repo.insertBoard(board);
		
		if(i == 1 && file1 != null){//성공하면
			Board_File bf = new Board_File(0,"","",seq);
			//파일 다중 첨부시  for문으로 돌려서 insert 저장
			for(MultipartFile file : multiFiles.getFile1()) {
				String originalName = file.getOriginalFilename();
				String savedFileName = FileService.saveFile(file, uploadPath);
				
				bf.setOriginal_filename(originalName);
				bf.setSaved_filename(savedFileName);
				repo.insert_file(bf);
			}//for
		}
		ra.addAttribute("classNum",classNum);
		return "redirect:boardList";
	}
	
	@RequestMapping(value="/boardUpdateForm", method=RequestMethod.POST)
	public String boardUpdate(int num, Model model, HttpServletRequest request, int classNum){
		this.listCome(model, request);
		Board board = repo.findOne(num);
		List<Board_File> list = repo.selectBoard_fileAll(num);
		model.addAttribute("board",board);
		model.addAttribute("list",list);
		model.addAttribute("classNum",classNum);
		return "boardUpdate";
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(Board board, Model model, HttpServletRequest request, RedirectAttributes ra, MultiFiles multifiles, 
			MultipartFile file1, String user_id, String title, String content,int num, CheckOriginalFileNames fileNames,int classNum){
		this.listCome(model, request);
		repo.updateBoard(board);
		//파일을 제외한 정보는 업데이트 끝;
		List<Board_File> list = repo.selectBoard_fileAll(board.getNum());
		
		//삭제 처리 
		if(fileNames.getOriginal_filename() != null){
			for(Board_File boardFile : list) {
				int check = 0; //스위치
				String originalSavedFile = boardFile.getOriginal_filename();
				for(String original_filename : fileNames.getOriginal_filename()) {
					if(originalSavedFile.equals(original_filename)) {
						//첨부된 파일 이름과 DB에 저장된 이름을 검사해서 같으면 스위치 걸어줌
						check = 1;
					}
				}
				if(check == 0) {
					//첨부된 파일이름이 DB안에 없을경우 기존파일을 일단 삭제
					FileService.deleteFile(uploadPath+"/"+boardFile.getSaved_filename());
					repo.deleteFile(boardFile.getNum());
				}
			}
		}
		
		//파일이름 null로 넘어오면
		if(fileNames.getOriginal_filename() == null){
			for(Board_File boardFile : list) {
				FileService.deleteFile(uploadPath+"/"+boardFile.getSaved_filename());
				repo.deleteFile(boardFile.getNum());
			}
		}
		
		//수정 처리
		if(!(file1 == null)){
			//삽입 처리와 같은 방식으로 수정 처리 시작
			Board_File bf = new Board_File(0,"","",board.getNum());
			for(MultipartFile file : multifiles.getFile1()) {
				String originalName = file.getOriginalFilename();
				String savedFileName = FileService.saveFile(file, uploadPath);
				bf.setOriginal_filename(originalName);
				bf.setSaved_filename(savedFileName);
				repo.insert_file(bf);
			}
		}
		
		ra.addAttribute("num",board.getNum());
		ra.addAttribute("classNum",classNum);
		return "redirect:boardDetail";
	}
	
	@RequestMapping(value="/deleteForm", method=RequestMethod.GET)
	public String boardDelete(Board board, Model model, HttpServletRequest request,RedirectAttributes ra, int classNum){
		this.listCome(model, request);
		List<Board_File> list = repo.selectBoard_fileAll(board.getNum());
		
		//파일 삭제처리
		for(Board_File boardFile : list) {
			FileService.deleteFile(uploadPath+"/"+boardFile.getSaved_filename());
			repo.deleteFile(boardFile.getNum());
		}
		
		//게시글 삭제처리
		repo.deleteForm(board.getNum());
		ra.addAttribute("classNum",classNum);
		return "redirect:boardList";
	}
	
	//다운로드 로직
	@RequestMapping(value="downloadbf", method=RequestMethod.GET)
	public String download(int num, Model model, HttpServletRequest request, HttpServletResponse response){
		this.listCome(model, request);
		//num은 Board_File의 시퀀스
		Board_File fileDrive = repo.selectFileOne(num);
		
		String original_fileName = fileDrive.getOriginal_filename();
		String saved_fileName = fileDrive.getSaved_filename();
		try {
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(original_fileName, "UTF-8"));
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" + saved_fileName;
		//파일 가져오기
		FileInputStream filein = null;
		//브라우저로 내보내기
		ServletOutputStream sout = null;
		try {
			filein = new FileInputStream(fullPath);
			sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		String img_name = (String)session.getAttribute("userImg");
		model.addAttribute("img_name", img_name);
		model.addAttribute("id", id);
		List<ClassInfo> myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
	
}
