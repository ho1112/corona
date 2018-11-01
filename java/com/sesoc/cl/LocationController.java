package com.sesoc.cl;

import java.io.File;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sesoc.cl.board.Board;
import com.sesoc.cl.board.BoardRepository;
import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.drive.Drive;
import com.sesoc.cl.drive.DriveRepository;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.ClassUser;
import com.sesoc.cl.vo.Users;
@Controller
public class LocationController {
	@Autowired
	UsersRepository repo;
	@Autowired
	ClassRepository cRepo;
	@Autowired
	BoardRepository br;
	@Autowired
	DriveRepository dr;
	
	String path = "/img";
	
	@RequestMapping(value="searchLocation", method=RequestMethod.GET)
	public String searchForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "customer/searchForm";
	}

	@RequestMapping(value="afterLoginLocation", method=RequestMethod.GET)
	public String afterLoginForm(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		String name = (String)session.getAttribute("name");
		String userImg = (String)session.getAttribute("userImg");
		String email = (String)session.getAttribute("email");
		model.addAttribute("loginId", id);
		model.addAttribute("name", name);
		model.addAttribute("userImg", userImg);
		model.addAttribute("email", email);
		List<ClassInfo> myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
		String mime = null;
			String fullPath = path + "/" + userImg;
			mime = new MimetypesFileTypeMap().getContentType(new File(fullPath));
			System.out.println("마임타입 : " + mime);
			if(mime.contains("image")||mime.contains("octet-stream")){
				model.addAttribute("mimetype", mime);
			}
		return "customer/afterLogin";
	}
	
	@RequestMapping(value="createClassLocation", method=RequestMethod.GET)
	public String createClassForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "customer/createClassForm";
	}
	
	@RequestMapping(value="createHomeWorkLocation", method=RequestMethod.GET)
	public String createHomeWorkForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "customer/createHomeWorkForm";
	}
	
	
	
	@RequestMapping(value="taskList", method=RequestMethod.GET)
	public String boardForm(
			@RequestParam(value="searchtype", defaultValue="title") String searchtype,
			@RequestParam(value="searchword",defaultValue="") String searchword,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="countpage", defaultValue="10") int countPerPage,
			HttpServletRequest request,
			Model model, String status) {
		//보드 리스트
		/*
		System.out.println("게시판 구분 : "+status);
		if(status.equals("normal")) {
			System.out.println(""+ "노말진입");
			List<Board> boardList = br.findAll(searchtype, searchword);
			model.addAttribute("boardList", boardList);
			model.addAttribute("status", status);
			System.out.println("노말모델 넘김 :"+boardList.get(0));
			return "boardForm";
			//return "entry";
			
		}else if(status.equals("drive")) {
			System.out.println("자료실 입장");
			List<Drive> drivelist = dr.selectDriveAll();
			model.addAttribute("driveList", drivelist);
			model.addAttribute("status", status);
			System.out.println("다시 자료실로 넘겨주기");
			return "boardForm";
		}
		*/
		System.out.println("과제 게시판");
		this.listCome(model, request);
		return "taskList";
	}
	
	@RequestMapping("teskWrite")
	public String teskWrite(HttpServletRequest request,
			Model model){
		this.listCome(model, request);
		return "teskWrite";
	}
	
	@RequestMapping("teskDetail")
	public String teskDetail(HttpServletRequest request,
			Model model){
		this.listCome(model, request);
		return "teskDetail";
	}
	
	@RequestMapping(value="teacherFormLocation", method=RequestMethod.GET)
	public String teacherForm(Model model, HttpServletRequest request, int num){
		this.listCome(model, request);
		ClassInfo classinfo = cRepo.selectClassOne(num);
		List<ClassUser> list = cRepo.selectRequestClassOne(num);
		List<Users> allList = repo.allList();
		model.addAttribute("allList", allList);
		model.addAttribute("userList", list);
		model.addAttribute("classInfo", classinfo);
		return "customer/teacherForm";
	}
	
	@RequestMapping(value="studentFormLocation", method=RequestMethod.GET)
	public String studentForm(Model model, HttpServletRequest request, int num){
		this.listCome(model, request);
		ClassInfo classinfo = cRepo.selectClassOne(num);
		List<Users> allList = repo.allList();
		List<ClassUser> list = cRepo.selectRequestClassOne(num);
		model.addAttribute("userList", list);
		model.addAttribute("allList", allList);
		model.addAttribute("classInfo", classinfo);
		return "customer/studentForm";
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
