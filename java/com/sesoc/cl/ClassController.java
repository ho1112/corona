package com.sesoc.cl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.vo.ClassCount;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.ClassUser;


@Controller
public class ClassController {
	@Autowired
	UsersRepository repo;
	@Autowired
	ClassRepository cRepo;
	
		//반 생성
		@RequestMapping(value = "createClass", method = RequestMethod.POST)
		public String createClass(ClassInfo createClass, @RequestParam(defaultValue="y", value="is_public")String is_public) {
			createClass.setIs_public(is_public);
			cRepo.createClass(createClass);
			return "redirect:afterLoginLocation";
		}
		
		//반 리스트 폼 출력
		@RequestMapping(value = "myClassListForm", method = RequestMethod.GET)
		public String myClassList(Locale locale, Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("loginId");
			List<ClassInfo> list = cRepo.selectMyAll(id);
			List<ClassCount> countList = cRepo.selectCount(id);
			model.addAttribute("countList", countList);
			model.addAttribute("list", list);
			return "myClassList1";
		}
		
		//반 정보 출력
		@RequestMapping(value = "myClassDetailForm", method = RequestMethod.GET)
		public String myClassDetailForm(Model model, HttpServletRequest request, int num) {
			List<ClassUser> list = cRepo.selectUserAll(num);
			ClassInfo classOne = cRepo.selectClassOne(num);
			model.addAttribute("list", list);
			model.addAttribute("classOne", classOne);
			return "myClassDetail";
		}
		
		//반 생성 이름 중복 체크
		@ResponseBody
		@RequestMapping(value = "checkClassName", method = RequestMethod.GET)
		public int checkClassName(String name) {
			int swt = 1;
			if(!(name.equals(""))) {
			ClassInfo check = cRepo.checkClassName(name);
			if(check == null) {
				swt = 0;
			}
			else swt = 1;
			}
			
			return swt;
		}
		
		//유저 상태 변경 (student 또는 withdraw)
		@ResponseBody
		@RequestMapping(value = "status", method = RequestMethod.POST)
		public String status(String status, int num) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("status", status);
			map.put("num", num);
			cRepo.updateStatus(map);
			return status;
		}
		//강제 탈퇴(선생님)
		@ResponseBody
		@RequestMapping(value = "retired", method = RequestMethod.POST)
		public int teacherRetired(int num) {
			int result =  cRepo.deleteRetired(num);
			return result;
		}
		//탈퇴(학생)
		@RequestMapping(value = "retired", method = RequestMethod.GET)
		public String studentRetired(int num) {
			cRepo.deleteRetired(num);
			return "redirect:afterLoginLocation";
		}
		
		//검색
		@RequestMapping(value = "search" , method = RequestMethod.GET)
		public String search(
				@RequestParam(defaultValue="", value="searchWord")String searchWord, String searchType, Model model, HttpServletRequest request) {
			Map<String, Object> map = new HashMap<String, Object>();
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("loginId");
			List<ClassUser> myList = cRepo.selectMyRequestAll(user_id);
			map.put("searchWord", searchWord);
			map.put("searchType", searchType);
			map.put("user_id", user_id);
			List<ClassCount> countList= cRepo.selectSearchCount(map);
			map.put("myList", myList);
			map.put("countList", countList);
			List<ClassInfo> list = cRepo.selectSearch(map);
			map.put("list", list);
			model.addAttribute("map", map);
			this.listCome(model, request);
			return "customer/searchForm";
		}
		
		//반 가입 신청
		@RequestMapping(value = "request", method = RequestMethod.POST)
		public @ResponseBody int request(int classNum, HttpServletRequest request) {
			int swt = 0;
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("loginId");
			ClassUser user = new ClassUser(0, classNum, user_id, "");
			ClassUser checkUser = cRepo.selectDuplicateCheckOne(user);
			if(checkUser == null) {
				swt = cRepo.insertClassUser(user);
				return swt;
			} else {
				return swt;
			}
		}
		
		//반 상태 변경(공개, 비공개)
		@ResponseBody
		@RequestMapping(value = "changeClassState", method = RequestMethod.POST)
		public int changeClassState(int classNum, int state) {
			return cRepo.changeClassState(classNum, state);
		}
		
		
		public void listCome(Model model, HttpServletRequest request) {
			HttpSession session = request.getSession(); 
			String id = (String)session.getAttribute("loginId");
			model.addAttribute("id", id);
			List<ClassInfo> myTeacherList = cRepo.myTeacherList(id);
			List<ClassInfo> myStudentList = cRepo.myStudentList(id);
			model.addAttribute("myTeacherList", myTeacherList);
			model.addAttribute("myStudentList", myStudentList);
		}
}
