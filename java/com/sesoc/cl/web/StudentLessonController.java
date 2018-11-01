package com.sesoc.cl.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.cl.connInfo.LessonList;
import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.threadForLesson.LessonThread;
import com.sesoc.cl.vo.ClassInfo;

/**
 * 강의 관련 학생 쪽 Controller 
 * @author LSY
 */
@Controller
public class StudentLessonController {
	
	@Autowired
	ClassRepository cRepo;
	
	private static final Logger logger = LoggerFactory.getLogger(StudentLessonController.class);
	
	
	@RequestMapping(value = "/lessonJoin", method = RequestMethod.POST)
	public String joinLesson(
			String student_id, 
			int classNum, 
			Model model, 
			HttpServletRequest request) 
	{
		ClassInfo classInfo = cRepo.selectClassOne(classNum);
		listCome(model, request);
		model.addAttribute("classInfo", classInfo);
		model.addAttribute("student_id", student_id);
		model.addAttribute("classNum", classNum);
		return "lesson/studentSideLesson";
	}
	
	@ResponseBody
	@RequestMapping(value = "checkOpenLesson", method = RequestMethod.POST)
	public int checkOpenLesson(int classNum) {
		int result = 0;
		String classNumString = classNum + "";
		
		
		for(LessonThread lt : LessonList.getLessonList()) {
			if(lt.getTeacherConn().getclassNum().equals(classNumString)) {
				result = 1;
				break;
			}
		}
		
		return result;
	}
	
	/**
	 * 파일의 코드 확인 용 페이지 요청 시 실행
	 * @param code 파일의 코드
	 * @param model 코드를 전달 할 model 객체
	 * @return 파일의 코드 확인 페이지 jsp
	 */
	@RequestMapping("/sourceCode")
	public String viewSourceCodePage(
			String code, 
			String theme, 
			String invisibles, 
			String indentGuides, 
			Model model) 
	{
		model.addAttribute("code", code);
		model.addAttribute("theme", theme);
		model.addAttribute("invisibles", invisibles);
		model.addAttribute("indentGuides", indentGuides);
		return "lesson/sourceCodePopup";
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